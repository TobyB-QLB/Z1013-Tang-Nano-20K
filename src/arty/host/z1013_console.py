#!/usr/bin/env python3
"""z1013_console.py -- THE HOST'S SIDE OF THE Z1013 ON THE ARTY: one program on
the debug link's four pipes, over Ethernet (`--udp`) or the USB-UART (`--uart`) --

    pipe 0 (0x8E8C)  the screen: a frame a changed row -- row, frame count, 128 bytes of two palette indices each
    pipe 1 (0x8E8A)  the sound: 64 samples s16le at 22 050 Hz a frame -> ffplay
    pipe 2 (0x8E88)  the card's requests: op (1 read, 2 write), LBA (LE), a write's 512 bytes
    pipe 3 (0x8E86)  to the board: tag 0 key events, 1 a card answer, 2 refresh the screen, 3 boot (reset, then run)

The card is an image file, read, never written: a written sector goes into a copy-on-write map (`--cow FILE` keeps it
across runs).  The screen opens in the browser (a small http server on 127.0.0.1; the keys come back from the page as
the companion chip's event bytes: bits 6..0 the HID usage, bit 7 release); `--png FILE` writes it every second,
`--keys FILE` types a script (`<seconds> <key>...`, keys: F1..F12, ENTER, ESC, SPACE, a
letter, a digit, `.`, or "TEXT"), `--seconds N` stops after N seconds.

    python3 z1013_console.py --udp 192.168.77.2 --card card.img    (or --uart /dev/ttyUSB1; card.img: mkcard.sh card.img DEMO.COM …)
"""
import argparse, json, os, queue, struct, subprocess, sys, threading, time, webbrowser, zlib
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)                             # the link's host modules: zlink/ beside this file
from zlink.uart import UartLink                      # noqa: E402
from zlink.pipe import StreamRx, StreamTx            # noqa: E402
from zlink.udp4 import Udp4                          # noqa: E402

PIPE_SCREEN, PIPE_PCM, PIPE_CARD, PIPE_IN = 0x8E8C, 0x8E8A, 0x8E88, 0x8E86
TAG_KEYS, TAG_CARD, TAG_REFRESH, TAG_BOOT = 0, 1, 2, 3
N = 256
PAL = [0x000000, 0x0000AA, 0x00AA00, 0x00AAAA, 0xAA0000, 0xAA00AA, 0xAA5500, 0xAAAAAA,
       0x555555, 0x5555FF, 0x55FF55, 0x55FFFF, 0xFF5555, 0xFF55FF, 0xFFFF55, 0xFFFFFF]

# KeyboardEvent.code -> HID usage; modifiers as the companion sends them (usage 0xE0.. - 120)
HID = {**{f"Key{chr(65 + i)}": 4 + i for i in range(26)},
       **{f"Digit{i}": 0x1E + i - 1 for i in range(1, 10)}, "Digit0": 0x27,
       "Enter": 0x28, "Escape": 0x29, "Backspace": 0x2A, "Tab": 0x2B, "Space": 0x2C, "Minus": 0x2D, "Equal": 0x2E,
       "BracketLeft": 0x2F, "BracketRight": 0x30, "Backslash": 0x31, "Semicolon": 0x33, "Quote": 0x34,
       "Backquote": 0x35, "Comma": 0x36, "Period": 0x37, "Slash": 0x38, "CapsLock": 0x39,
       **{f"F{i}": 0x3A + i - 1 for i in range(1, 13)},
       "ArrowRight": 0x4F, "ArrowLeft": 0x50, "ArrowDown": 0x51, "ArrowUp": 0x52, "IntlBackslash": 0x64,
       "ControlLeft": 0xE0 - 120, "ShiftLeft": 0xE1 - 120, "AltLeft": 0xE2 - 120,
       "ControlRight": 0xE4 - 120, "ShiftRight": 0xE5 - 120, "AltRight": 0xE6 - 120}


def usage(k):
    """a script key's HID usage"""
    if len(k) == 1:
        c = k.upper()
        if "A" <= c <= "Z": return 4 + ord(c) - 65
        if "1" <= c <= "9": return 0x1E + ord(c) - 49
        if c == "0": return 0x27
        if c == ".": return 0x37
        if c == " ": return 0x2C
    named = {"ENTER": 0x28, "ESC": 0x29, "SPACE": 0x2C}
    if k in named: return named[k]
    if k[0] == "F" and k[1:].isdigit(): return 0x3A + int(k[1:]) - 1
    raise SystemExit(f"z1013_console: unknown key {k!r}")


class RetryUdp(Udp4):
    """Udp4 with a short receive timeout (the loop polls four pipes) whose SEND does not give up on it: the socket's
    timeout covers sendto too, and the first datagrams wait for the board's ARP answer longer than 2 ms"""
    def __init__(self, ip, port):
        super().__init__(ip, port, timeout=0.002)

    def send(self, payload):
        for _ in range(500):
            try:
                return super().send(payload)
            except TimeoutError:
                continue
        raise TimeoutError("z1013_console: the board does not take datagrams")


class Card:
    """the image, read only; written sectors in a copy-on-write map"""
    def __init__(self, path, cow=None):
        self.f, self.cow, self.cowpath = open(path, "rb"), {}, cow
        if cow and os.path.exists(cow):
            d = open(cow, "rb").read()
            for i in range(0, len(d), 516):
                self.cow[struct.unpack_from("<I", d, i)[0]] = d[i + 4:i + 516]
        self.reads = self.writes = 0

    def read(self, lba):
        self.reads += 1
        if lba in self.cow: return self.cow[lba]
        self.f.seek(lba * 512)
        return (self.f.read(512) + bytes(512))[:512]

    def write(self, lba, data):
        self.writes += 1
        self.cow[lba] = bytes(data[:512]).ljust(512, b"\0")
        if self.cowpath:
            with open(self.cowpath, "ab") as f: f.write(struct.pack("<I", lba) + self.cow[lba])


class Pcm:
    """the sound for the browser: the last seconds of samples and the count of all so far"""
    def __init__(self, keep=22050 * 4):
        self.buf, self.n, self.keep, self.lock = bytearray(), 0, keep, threading.Lock()

    def add(self, data):
        with self.lock:
            self.buf += data
            self.n += len(data) // 2
            if len(self.buf) > 2 * self.keep:
                del self.buf[:len(self.buf) - 2 * self.keep]

    def since(self, k):
        """the samples from number k on (no older than what is kept), and the number after them"""
        with self.lock:
            first = self.n - len(self.buf) // 2
            k = max(k, first, self.n - 22050 // 2) if k >= 0 else self.n - 22050 // 4   # a late page skips ahead
            return bytes(self.buf[2 * (k - first):]), self.n


class Screen:
    def __init__(self):
        self.px = bytearray(N * N)                   # palette indices
        self.rows = 0

    def row(self, data):
        y = data[0]
        for i, b in enumerate(data[2:2 + N // 2]):
            self.px[y * N + 2 * i] = b & 15
            self.px[y * N + 2 * i + 1] = b >> 4
        self.rows += 1

    def png(self):
        raw = b"".join(b"\0" + bytes(c for i in self.px[y * N:(y + 1) * N] for c in PAL[i].to_bytes(3, "big"))
                       for y in range(N))
        def chunk(t, d): return struct.pack(">I", len(d)) + t + d + struct.pack(">I", zlib.crc32(t + d) & 0xFFFFFFFF)
        return (b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", struct.pack(">IIBBBBB", N, N, 8, 2, 0, 0, 0))
                + chunk(b"IDAT", zlib.compress(raw, 6)) + chunk(b"IEND", b""))


PAGE = """<!doctype html><html><head><meta charset="utf-8"><title>Z1013</title><style>
body{background:#111;color:#aaa;font:13px monospace;margin:0;display:flex;flex-direction:column;align-items:center}
img{image-rendering:pixelated;width:768px;height:768px;max-width:100vw;max-height:90vh;object-fit:contain}
</style></head><body><img id="s" src="/frame.png"><div id="m">keys go to the Z1013 while this page has the focus -- click for sound</div><script>
const s=document.getElementById('s');
let ac=null,at=0,pk=-1;
addEventListener('click',()=>{if(ac)return;ac=new AudioContext();at=ac.currentTime+0.15;
 document.getElementById('m').textContent='sound on -- keys go to the Z1013 while this page has the focus';pull()});
async function pull(){try{const r=await fetch('/pcm?from='+pk);pk=+r.headers.get('X-Next');const b=await r.arrayBuffer();
 const n=b.byteLength>>1;if(n>0){const v=new DataView(b),ab=ac.createBuffer(1,n,22050),d=ab.getChannelData(0);
 for(let i=0;i<n;i++)d[i]=v.getInt16(2*i,true)/32768;const sr=ac.createBufferSource();sr.buffer=ab;sr.connect(ac.destination);
 if(at<ac.currentTime+0.05)at=ac.currentTime+0.15;sr.start(at);at+=n/22050}}catch(e){}setTimeout(pull,60)}
setInterval(()=>{const i=new Image();i.onload=()=>{s.src=i.src};i.src='/frame.png?'+Date.now()},150);
function k(e,d){fetch('/key',{method:'POST',body:JSON.stringify({code:e.code,down:d})});e.preventDefault()}
addEventListener('keydown',e=>{if(!e.repeat)k(e,1)});addEventListener('keyup',e=>k(e,0));
</script></body></html>"""


def webview(screen, keys, port, pcm=None):
    class H(BaseHTTPRequestHandler):
        def log_message(self, *a): pass
        def do_GET(self):
            nxt = None
            if self.path.startswith("/pcm") and pcm:
                try: k = int(self.path.split("from=")[1])
                except (IndexError, ValueError): k = -1
                body, nxt = pcm.since(k)
                ct = "application/octet-stream"
            elif self.path.startswith("/frame"):
                body, ct = screen.png(), "image/png"
            else:
                body, ct = PAGE.encode(), "text/html"
            self.send_response(200); self.send_header("Content-Type", ct); self.send_header("Cache-Control", "no-store")
            if nxt is not None: self.send_header("X-Next", str(nxt))
            self.end_headers(); self.wfile.write(body)
        def do_POST(self):
            e = json.loads(self.rfile.read(int(self.headers["Content-Length"])))
            if e.get("code") in HID: keys.put(HID[e["code"]] | (0 if e.get("down") else 0x80))
            self.send_response(204); self.end_headers()
    srv = ThreadingHTTPServer(("127.0.0.1", port), H)
    threading.Thread(target=srv.serve_forever, daemon=True).start()
    return f"http://127.0.0.1:{port}/"


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--udp", help="the board's address on Ethernet (192.168.77.2); otherwise the USB-UART")
    ap.add_argument("--uart", default="/dev/ttyUSB1")
    ap.add_argument("--baud", type=int, default=1000000)
    ap.add_argument("--card", required=True)
    ap.add_argument("--cow")
    ap.add_argument("--port", type=int, default=8013, help="the browser view's port (0: no browser)")
    ap.add_argument("--no-browser", action="store_true")
    ap.add_argument("--no-audio", action="store_true")
    ap.add_argument("--ffplay", action="store_true", help="the sound through ffplay as well (the browser page plays it)")
    ap.add_argument("--wav", help="also write the sound to this WAV")
    ap.add_argument("--png", help="write the screen here every second")
    ap.add_argument("--keys", help="a key script: lines `<seconds> <key>...`")
    ap.add_argument("--seconds", type=float, default=0)
    ap.add_argument("--attach", action="store_true", help="join the running machine (no BOOT: no reset)")
    a = ap.parse_args()

    if a.udp:                                        # a socket a pipe; replies come back by the transport spoken on
        port = lambda p: RetryUdp(a.udp, p)
    else:
        link = UartLink(a.uart, a.baud, timeout=0.002)
        port = link.port
    scr_rx = StreamRx(port(PIPE_SCREEN), held=True)
    pcm_rx = StreamRx(port(PIPE_PCM), held=True)
    card_rx = StreamRx(port(PIPE_CARD), held=True)
    tx = StreamTx(port(PIPE_IN), held=True)
    card, screen, keys = Card(a.card, a.cow), Screen(), queue.Queue()
    for r in (scr_rx, pcm_rx, card_rx):
        r.hello()
    tx.send(bytes([TAG_REFRESH]))
    if not tx.flush(timeout=5.0):                    # the bridge's first exchange (SYNC) done before any key or card
        print("z1013_console: the board does not acknowledge pipe 3 (programmed? the link up?)", file=sys.stderr)

    pcm = Pcm()
    audio = None if a.no_audio or not a.ffplay else subprocess.Popen(
        ["ffplay", "-loglevel", "error", "-nodisp", "-f", "s16le", "-ar", "22050", "-ch_layout", "mono", "-"],
        stdin=subprocess.PIPE)
    wav = open(a.wav, "wb") if a.wav else None
    if wav: wav.write(b"\0" * 44)
    if a.port and not a.no_browser:
        url = webview(screen, keys, a.port, pcm)
        print("the screen:", url, flush=True)
        webbrowser.open(url)
    elif a.port:
        print("the screen:", webview(screen, keys, a.port, pcm), flush=True)

    script = []
    if a.keys:
        for line in open(a.keys):
            f = line.split()
            if not f: continue
            at = float(f[0])
            for tok in f[1:]:
                for one in ([c for c in tok[1:-1]] if tok.startswith('"') else [tok]):
                    u = usage(one)
                    script += [(at, u), (at + 0.06, u | 0x80)]
                    at += 0.12
    script.sort()

    # THE CARD IN A THREAD OF ITS OWN: the machine's reader waits ~60 ms for a sector's token (65 535 polls at 9.3 MHz)
    # and then reports a read error; the screen's and the sound's frames never stop coming, so a request served
    # between them could come late.  Its own socket (pipe 2).  PIPE 3 HAS ONE SENDER, a thread of its own: a card
    # answer goes ahead of any key frame waiting (a held frame may wait for the board's credits).
    stop = threading.Event()
    outq = queue.PriorityQueue()                     # (0 card / 1 keys, order, bytes)
    order = [0]
    def put(prio, data):
        order[0] += 1
        outq.put((prio, order[0], data))
    def sender():
        while not stop.is_set():
            try:
                _, _, d = outq.get(timeout=0.05)
            except queue.Empty:
                tx._take(4)                          # keep reading the board's acks
                continue
            t1 = time.time()
            tx.send(d)
            if os.environ.get("Z1013_CARD_V"):
                print(f"sent: tag {d[0]} {len(d)} bytes in {1000 * (time.time() - t1):.2f} ms (credit {tx.credit}, unacked {len(tx.sent)})",
                      file=sys.stderr, flush=True)
    threading.Thread(target=sender, daemon=True).start()
    def serve_card():
        while not stop.is_set():
            f = card_rx.recv()
            if f is None:
                continue
            op, lba = f.data[0], struct.unpack_from("<I", f.data, 1)[0]
            tq = time.time()
            if os.environ.get("Z1013_CARD_V"):
                print(f"card: op {op} lba {lba} len {len(f.data)} seq {f.seq}", file=sys.stderr, flush=True)
            if op == 1:
                put(0, bytes([TAG_CARD]) + card.read(lba))
            elif op == 2:
                card.write(lba, f.data[5:])
                put(0, bytes([TAG_CARD, 0]))
            if os.environ.get("Z1013_CARD_V"):
                print(f"card: queued in {1000 * (time.time() - tq):.2f} ms", file=sys.stderr, flush=True)
    threading.Thread(target=serve_card, daemon=True).start()
    if not a.attach:                                 # the machine starts now: the card's server is listening
        put(1, bytes([TAG_BOOT]))

    t0 = last_png = last_stat = time.time()
    nsamp = 0
    try:
        while not a.seconds or time.time() - t0 < a.seconds:
            now = time.time() - t0
            while script and script[0][0] <= now:
                keys.put(script.pop(0)[1])
            ev = []
            while not keys.empty():
                ev.append(keys.get())
            if ev:
                put(1, bytes([TAG_KEYS] + ev))
            f = scr_rx.recv()
            while f is not None:
                screen.row(f.data)
                f = scr_rx.recv()
            f = pcm_rx.recv()
            while f is not None:
                if audio:
                    try: audio.stdin.write(f.data); audio.stdin.flush()
                    except BrokenPipeError: audio = None
                if wav: wav.write(f.data)
                pcm.add(f.data)
                nsamp += len(f.data) // 2
                f = pcm_rx.recv()
            if a.png and time.time() - last_png > 1.0:
                open(a.png, "wb").write(screen.png()); last_png = time.time()
            if time.time() - last_stat > 5.0:
                print(f"{now:6.1f}s rows {screen.rows} sound {nsamp / 22050:.1f}s card r{card.reads} w{card.writes}"
                      f" | lost: screen {scr_rx.dropped} sound {pcm_rx.dropped}", flush=True)
                last_stat = time.time()
    except KeyboardInterrupt:
        pass
    stop.set()
    if a.png:
        open(a.png, "wb").write(screen.png())
    if wav:
        wav.seek(0)
        wav.write(b"RIFF" + struct.pack("<I", 36 + nsamp * 2) + b"WAVEfmt " + struct.pack("<IHHIIHH", 16, 1, 1, 22050, 44100, 2, 16)
                  + b"data" + struct.pack("<I", nsamp * 2))
        wav.close()
    if audio:
        audio.stdin.close()


if __name__ == "__main__":
    main()
