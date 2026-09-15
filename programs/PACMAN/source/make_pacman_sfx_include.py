#!/usr/bin/env python3
"""Erzeugt die TED-Registertabellen fuer Punkt, Extraleben und Geistkontakt."""

from pathlib import Path


TED_CLOCK = 110_840.45
OUTPUT = Path(__file__).resolve().parent / "pacman_sfx.inc"


def ted_value(frequency: float) -> int:
    value = round(1024.0 - TED_CLOCK / frequency)
    if not 0 <= value <= 1023:
        raise ValueError(f"Frequenz {frequency} Hz liegt ausserhalb des TED-Bereichs")
    return value


def bytes_for(value: int) -> tuple[int, int]:
    return value & 0xff, value >> 8


def game_entry(v1_hz: float, v2_hz: float, control: int, comment: str) -> str:
    v1_lo, v1_hi = bytes_for(ted_value(v1_hz))
    v2_lo, v2_hi = bytes_for(ted_value(v2_hz))
    return (
        f"        DB      {v1_lo:03X}h,{v1_hi:02X}h, "
        f"{v2_lo:03X}h,{v2_hi:02X}h, {control:03X}h ; {comment}"
    )


def scream_entry(v1_hz: float, v2_value: float, control: int,
                 duration: int, comment: str, raw_v2: bool = False) -> str:
    v1_lo, v1_hi = bytes_for(ted_value(v1_hz))
    v2 = round(v2_value) if raw_v2 else ted_value(v2_value)
    v2_lo, v2_hi = bytes_for(v2)
    return (
        f"        DB      {v1_lo:03X}h,{v1_hi:02X}h, "
        f"{v2_lo:03X}h,{v2_hi:02X}h, {control:03X}h,{duration:2d} ; {comment}"
    )


lines = [
    "; Deutliches zweistimmiges TA-TAA fuer ein neues Leben.",
    "SOUND_LIFE_TABLE:",
    game_entry(392.00, 523.25, 0x37, "TA: G4 und C5"),
    game_entry(392.00, 523.25, 0x30, "kurze Pause"),
    game_entry(659.25, 783.99, 0x3A, "TAA: E5 und G5"),
    game_entry(659.25, 783.99, 0x3A, "TAA halten"),
    game_entry(659.25, 783.99, 0x37, "TAA ausklingen"),
    "        DB      000h,00h, 000h,00h, 000h ; Ende",
    "",
    "; Lauter Schrei: schneller Anstieg, rauer Hoehepunkt, tiefer Abbruch.",
    "; Jeder Schritt dauert ein FRAME_PAUSE (ungefaehr 39 ms).",
    "SOUND_SCREAM_TABLE:",
]

for v1, v2, comment in (
    (220.0, 233.0, "Anstieg 1"),
    (277.0, 294.0, "Anstieg 2"),
    (349.0, 370.0, "Anstieg 3"),
    (440.0, 466.0, "Anstieg 4"),
    (554.0, 587.0, "Anstieg 5"),
):
    lines.append(scream_entry(v1, v2, 0x38, 1, comment))

for frequency, noise_value, comment in (
    (659.0, 1000, "rauer Hoehepunkt 1"),
    (784.0, 992, "rauer Hoehepunkt 2"),
    (698.0, 980, "rauer Hoehepunkt 3"),
):
    lines.append(scream_entry(frequency, noise_value, 0x58, 1, comment, True))

for v1, v2, comment in (
    (554.0, 523.0, "Abfall 1"),
    (440.0, 415.0, "Abfall 2"),
    (330.0, 311.0, "Abfall 3"),
    (247.0, 220.0, "Abbruch"),
):
    lines.append(scream_entry(v1, v2, 0x38, 1, comment))

lines.extend((
    "        DB      000h,00h, 000h,00h, 000h, 0 ; Ende",
    "",
))

OUTPUT.write_text("\n".join(lines), encoding="ascii")
print(f"Erzeugt: {OUTPUT}")
