"""The host's ends of the STREAM BRIDGE: a design's framed
stream carried as datagrams, one a frame, over any transport's one face.

    rx = StreamRx(Udp4("192.168.77.2", 0x8E8C))       # the board's sender (pipe 0; or Fx3(...), UartLink(...).port(...), Jtag(...))
    rx.hello()                                        # the board's peer from now on (one byte 0)
    f = rx.recv()                                     # Frame(seq, lost, cut, data) or None (the transport's timeout)
    ... rx.gaps: datagrams the transport lost; f.lost: frames the board dropped before this one

    tx = StreamTx(Udp4("192.168.77.2", 0x8E8A), held=True)   # the board's receiver (pipe 1)
    tx.send(b"...")                                   # one frame; in HELD mode it waits for the board's credits

A datagram: seq[2] lost[2] flags[1] bytes… (little endian); flags bit 0: cut at the sender's MAXW words; bit 7: a
CONTROL datagram (no bytes; seq = the next the receiver expects, lost = its credits, bit 6 = a NAK: send again from seq).
`Pipe` is StreamRx's first name."""
import os, struct, sys
import time
from collections import namedtuple

Frame = namedtuple("Frame", "seq lost cut data")
PORT0 = 0x8E8C                                 # pipe p at 0x8E8C - 2 p
CONTROL, NAK, SYNC, CUT = 0x80, 0x40, 0x20, 0x01


class StreamRx:
    def __init__(self, transport, hello=b"\0", held=False, credits=64):
        self.t, self.hello_bytes, self.held, self.credits = transport, hello, held, credits
        self.expect, self.gaps, self.frames, self.dropped, self.dups = None, 0, 0, 0, 0

    def hello(self):
        if self.held:
            self._control()
        else:
            self.t.send(self.hello_bytes)

    def _control(self, nak=False):
        e = 0 if self.expect is None else self.expect
        sync = SYNC if self.expect is None else 0           # starting anew: the sender's count is whatever it is
        self.t.send(struct.pack("<HHB", e, self.credits, CONTROL | sync | (NAK if nak else 0)))

    def recv(self):
        """the next frame in order, or None after the transport's timeout (HELD: a gap is asked again, a duplicate dropped)"""
        while True:
            r = self.t.recv()                      # (every transport's face answers None after its own timeout)
            if r is None:
                if self.held:
                    self._control()                # the word repeated while idle: the HELLO and the credits
                return None
            if len(r) < 5 or r[4] & CONTROL:
                continue
            seq, lost, flags = struct.unpack("<HHB", r[:5])
            if self.expect is not None and seq != self.expect:
                if (seq - self.expect) & 0x8000:   # older: a re-send of what we have
                    self.dups += 1
                    if self.held:
                        self._control()
                    continue
                self.gaps += (seq - self.expect) & 0xFFFF
                if self.held:                      # HELD: not taken; the sender comes back to what we expect
                    self._control(nak=True)
                    continue
            self.expect = (seq + 1) & 0xFFFF
            self.frames += 1
            self.dropped += lost
            if self.held:
                self._control()
            return Frame(seq, lost, bool(flags & CUT), r[5:])


Pipe = StreamRx


class StreamTx:
    """the host as the SENDER: frames to a board's stream_rx; LOSSY sends at once, HELD waits for the board's credits
    and re-sends on its NAK or after a silence"""
    def __init__(self, transport, held=False, rtx=0.5):
        self.t, self.held, self.rtx = transport, held, rtx
        self.seq, self.ack, self.credit, self.sent = 0, 0, 0, []     # sent: the frames not yet acked (HELD)
        self.lost = 0
        self.synced = False                                            # a control word came: our numbers are the board's

    def _take(self, most=64):
        """read what the board says (control words) without blocking long -- at most `most` datagrams a call"""
        r = self.t.recv()
        while r is not None and most > 0:
            most -= 1
            if len(r) >= 5 and r[4] & CONTROL:
                e, cr, fl = struct.unpack("<HHB", r[:5])
                if os.environ.get("L8_PIPE_V"):
                    print(f"{time.time():.3f} ctl expect {e} credits {cr} flags {fl:#x} (ack {self.ack} seq {self.seq} unacked {len(self.sent)})", file=sys.stderr, flush=True)
                if not self.synced:                                      # the first word: its expect is our oldest unacked frame, whatever
                    self.synced = True                                   # it says (a board receiver with history); the frames sent go again
                    self.sent = [((e + i) & 0xFFFF, struct.pack("<H", (e + i) & 0xFFFF) + d[2:]) for i, (s, d) in enumerate(self.sent)]
                    self.ack, self.seq = e, (e + len(self.sent)) & 0xFFFF
                    fl |= NAK
                if ((e - self.ack) & 0xFFFF) <= len(self.sent):
                    n = (e - self.ack) & 0xFFFF
                    self.sent, self.ack, self.credit = self.sent[n:], e, cr
                    if fl & NAK:
                        for s, d in self.sent:                           # send again from what it expects
                            self.t.send(d)
            r = self.t.recv()

    def send(self, data, cut=False):
        if self.held:
            t0 = time.time()
            self._take()
            while len(self.sent) >= max(1, self.credit):             # no credit: wait for the board's word
                self._take()
                if time.time() - t0 > self.rtx:                        # a silence: ask by sending the oldest again
                    for s, dd in self.sent[:1]:
                        self.t.send(dd)
                    t0 = time.time()
        d = struct.pack("<HHB", self.seq, self.lost, CUT if cut else 0) + bytes(data)   # (packed AFTER the board's words: the first
        if self.held:                                                                   # word may have renumbered us,
            self.sent.append((self.seq, d))
        self.t.send(d)
        self.seq = (self.seq + 1) & 0xFFFF
        self.lost = 0

    def flush(self, timeout=2.0):
        """HELD: wait until every frame sent is acked"""
        t0 = time.time()
        while self.held and self.sent and time.time() - t0 < timeout:
            self._take()
        return not self.sent
