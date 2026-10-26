"""The debug link over a UART ([debug_uartdbg-01 .. -06]: datagrams to ports as SLIP
frames on the line -- `port[2] datagram crc[2]`, the port little endian, CRC-16/CCITT-FALSE high byte first -- and every
byte outside a frame the console's.  `UartLink(dev, baud)` opens a serial line (pyserial) or takes any object with
`write(bytes)` and `read(n)`; `.port(p)` is the one face every transport has: `send(payload)`,
`recv()` -> the next datagram from port p or None after the timeout.  The console's bytes it meets are kept for
`.console()`."""
import time

END, ESC, ESC_END, ESC_ESC = 0xC0, 0xDB, 0xDC, 0xDD
CONSOLE = 0x8E94


def crc16(data: bytes, crc=0xFFFF) -> int:
    """CRC-16/CCITT-FALSE: poly 0x1021, init 0xFFFF, no reflection, no final xor."""
    for b in data:
        crc ^= b << 8
        for _ in range(8):
            crc = ((crc << 1) ^ 0x1021) if crc & 0x8000 else (crc << 1)
            crc &= 0xFFFF
    return crc


def encode(port: int, payload: bytes) -> bytes:
    """One frame on the line: END, the escaped `port[2] payload crc[2]`, END."""
    body = bytes([port & 0xFF, port >> 8]) + payload
    c = crc16(body)
    body += bytes([c >> 8, c & 0xFF])
    out = bytearray([END])
    for b in body:
        if b == END:
            out += bytes([ESC, ESC_END])
        elif b == ESC:
            out += bytes([ESC, ESC_ESC])
        else:
            out.append(b)
    out.append(END)
    return bytes(out)


class Decoder:
    """The line's bytes in, (port, payload) frames and the console's bytes out.  A frame whose CRC is wrong, or too
    short, goes to the console as the bytes it was (a stray 0xC0 costs the console nothing."""

    def __init__(self):
        self.inframe, self.esc, self.buf, self.raw = False, False, bytearray(), bytearray()

    def feed(self, data: bytes):
        frames, console = [], bytearray()
        for b in data:
            if not self.inframe:
                if b == END:
                    self.inframe, self.buf, self.raw = True, bytearray(), bytearray([b])
                else:
                    console.append(b)
                continue
            self.raw.append(b)
            if b == END:
                if not self.buf:                                   # END END: an empty frame, or a frame's start
                    self.raw = bytearray([b])
                    continue
                body = bytes(self.buf)
                if len(body) >= 4 and crc16(body) == 0:
                    frames.append((body[0] | body[1] << 8, body[2:-2]))
                else:
                    console += self.raw[:-1]                       # not a frame: the bytes were the console's
                    self.raw = bytearray([b])
                    self.buf = bytearray()
                    continue
                self.inframe, self.buf = False, bytearray()
                continue
            if self.esc:
                self.buf.append(END if b == ESC_END else ESC if b == ESC_ESC else b)
                self.esc = False
            elif b == ESC:
                self.esc = True
            else:
                self.buf.append(b)
        return frames, bytes(console)


class UartLink:
    """The host's end of a UART debug link.  `line` is a pyserial port's name or an object with write / read."""

    def __init__(self, line, baud=115200, timeout=0.5):
        if isinstance(line, str):
            import serial                                          # pyserial
            line = serial.Serial(line, baud, timeout=0.02)
        self.line, self.timeout, self.dec = line, timeout, Decoder()
        self.box, self.con = {}, bytearray()

    def write(self, port: int, payload: bytes):
        self.line.write(encode(port, payload))

    def console(self) -> bytes:
        out, self.con = bytes(self.con), bytearray()
        return out

    def type(self, text: bytes):
        """bytes to the console: raw, outside any frame"""
        self.line.write(bytes(b for b in text if b not in (END,)))

    def poll(self):
        data = self.line.read(4096)
        if data:
            frames, console = self.dec.feed(data)
            self.con += console
            for p, payload in frames:
                self.box.setdefault(p, []).append(payload)
        return bool(data)

    def take(self, port: int):
        t0 = time.time()
        while not self.box.get(port):
            if not self.poll() and time.time() - t0 > self.timeout:
                return None
        return self.box[port].pop(0)

    def port(self, p: int):
        return UartPort(self, p)


class UartPort:
    """'s face for one port: what `EthMaster` takes."""

    def __init__(self, link: UartLink, port: int):
        self.link, self.p = link, port

    def hello(self):
        pass

    def send(self, payload: bytes):
        self.link.write(self.p, payload)

    def recv(self):
        return self.link.take(self.p)
