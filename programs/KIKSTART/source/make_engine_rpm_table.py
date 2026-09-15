#!/usr/bin/env python3
"""Erzeugt die 800..4000-U/min-TED-Tabellen fuer KIKSTART."""

from pathlib import Path


TED_CLOCK = 110_840.45
STEPS = 64
RPM_IDLE = 800.0
RPM_FULL = 4000.0
FUNDAMENTAL_AT_IDLE = 110.0
FUNDAMENTAL_AT_FULL = 600.0 / (2.0 ** 0.5)  # eine halbe Oktave tiefer
OVERTONE_RATIO = 1.72
OUTPUT = Path(__file__).with_name("kikstart_engine_rpm.inc")


def ted_value(frequency: float) -> int:
    value = round(1024.0 - TED_CLOCK / frequency)
    if not 0 <= value <= 1023:
        raise ValueError(f"{frequency:.2f} Hz liegt ausserhalb des TED-Bereichs")
    return value


def table_lines(label: str, values: list[int]) -> list[str]:
    lines = [f"{label}:"]
    for start in range(0, len(values), 8):
        part = ",".join(f"{value:04X}h" for value in values[start:start + 8])
        lines.append(f"        DW      {part}")
    return lines


rpms = [RPM_IDLE + (RPM_FULL - RPM_IDLE) * step / STEPS for step in range(STEPS + 1)]
fundamentals = [
    FUNDAMENTAL_AT_IDLE
    + (FUNDAMENTAL_AT_FULL - FUNDAMENTAL_AT_IDLE) * step / STEPS
    for step in range(STEPS + 1)
]
overtones = [frequency * OVERTONE_RATIO for frequency in fundamentals]

lines = [
    "; Automatisch erzeugt: 65 gleichmaessige Schritte von 800 bis 4000 U/min.",
    "; Grundfrequenz 110..424 Hz, zweite Stimme bei Faktor 1,72.",
]
lines.extend(table_lines("SOUND_ENGINE_TABLE", [ted_value(f) for f in fundamentals]))
lines.append("")
lines.extend(table_lines("SOUND_ENGINE_OVERTONE_TABLE", [ted_value(f) for f in overtones]))
lines.append("")

OUTPUT.write_text("\n".join(lines), encoding="ascii")
print(f"Erzeugt: {OUTPUT}")
