"""UDP over IPv4 and ARP, as the board's side of the link speaks them.

`Udp4(ip, port)` is the real thing: an ordinary socket to the target's address (the kernel
resolves it by ARP; the interface needs an address in the target's subnet).  The frame
functions build and take apart WHOLE ethernet frames for co-simulation, short ones padded to
60 bytes as a link does, both checksums verified."""
import socket
import struct
from dataclasses import dataclass

BROADCAST_MAC = b"\xff" * 6


def _fold(data: bytes) -> int:
    if len(data) % 2:
        data += b"\x00"
    s = sum(struct.unpack(f"!{len(data) // 2}H", data))
    while s >> 16:
        s = (s & 0xFFFF) + (s >> 16)
    return ~s & 0xFFFF


def pad(f: bytes) -> bytes:
    return f + b"\x00" * max(0, 60 - len(f))


def frame4(payload, src_mac, src_ip, sport, dst_mac, dst_ip, dport) -> bytes:
    udp = struct.pack("!HHHH", sport, dport, 8 + len(payload), 0) + payload
    ck = _fold(src_ip + dst_ip + struct.pack("!BBH", 0, 17, len(udp)) + udp) or 0xFFFF
    udp = udp[:6] + struct.pack("!H", ck) + udp[8:]
    ip = struct.pack("!BBHHHBBH", 0x45, 0, 20 + len(udp), 0, 0x4000, 64, 17, 0) + src_ip + dst_ip
    ip = ip[:10] + struct.pack("!H", _fold(ip)) + ip[12:]
    return pad(dst_mac + src_mac + b"\x08\x00" + ip + udp)


def arp_request(src_mac, src_ip, target_ip, dst_mac=BROADCAST_MAC) -> bytes:
    return pad(dst_mac + src_mac + b"\x08\x06" + struct.pack("!HHBBH", 1, 0x0800, 6, 4, 1) + src_mac + src_ip + b"\x00" * 6 + target_ip)


@dataclass
class Datagram4:
    dst_mac: bytes
    src_mac: bytes
    src_ip: bytes
    dst_ip: bytes
    sport: int
    dport: int
    payload: bytes
    checksums_ok: bool


@dataclass
class ArpReply:
    dst_mac: bytes
    src_mac: bytes
    sha: bytes
    spa: bytes
    tha: bytes
    tpa: bytes


def parse_frame4(f: bytes):
    if len(f) >= 42 and f[12:14] == b"\x08\x06" and f[14:22] == struct.pack("!HHBBH", 1, 0x0800, 6, 4, 2):
        return ArpReply(f[0:6], f[6:12], f[22:28], f[28:32], f[32:38], f[38:42])
    if len(f) < 42 or f[12:14] != b"\x08\x00" or f[14] != 0x45 or f[23] != 17:
        return None
    tlen, = struct.unpack("!H", f[16:18])
    ip, udp = f[14:34], f[34:14 + tlen]
    sport, dport, ulen, ck = struct.unpack("!HHHH", udp[:8])
    zeroed = udp[:6] + b"\x00\x00" + udp[8:]
    ok = _fold(ip) == 0 and ulen == len(udp) and ck == (_fold(f[26:30] + f[30:34] + struct.pack("!BBH", 0, 17, ulen) + zeroed) or 0xFFFF)
    return Datagram4(f[0:6], f[6:12], f[26:30], f[30:34], sport, dport, udp[8:], ok)


class Udp4:
    """The host's end: `Udp4("192.168.77.2", 0x8E90)`; the target answers this socket."""

    def __init__(self, ip: str, port: int, timeout=None):
        self.addr = (ip, port)
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock.settimeout(timeout)

    def hello(self):
        self.send(b"")

    def send(self, payload: bytes):
        self.sock.sendto(payload, self.addr)

    def recv(self):
        try:
            return self.sock.recvfrom(4096)[0]
        except socket.timeout:
            return None
