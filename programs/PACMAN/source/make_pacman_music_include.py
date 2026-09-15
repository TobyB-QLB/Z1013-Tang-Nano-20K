#!/usr/bin/env python3
"""Erzeugt die 120-BPM-TED-Tabelle fuer PACMAN.asm reproduzierbar."""

from pathlib import Path


TED_CLOCK = 110_840.45
OUTPUT = Path(__file__).resolve().parent / "pacman_music.inc"

NOTE_NAMES = {
    "C": 0, "C#": 1, "D": 2, "D#": 3, "E": 4, "F": 5,
    "F#": 6, "G": 7, "G#": 8, "A": 9, "A#": 10, "B": 11,
}

LEAD = (
    ("A4", "C5", "F5", "A5", "G5", "E5", "C5", "A4"),
    ("B4", "D5", "G5", "B5", "A5", "G5", "D5", "B4"),
    ("E5", "G5", "C6", "G5", "E5", "D5", "C5", "G4"),
    ("A4", "C5", "E5", "A5", "G5", "E5", "C5", "A4"),
    ("A4", "C5", "F5", "A5", "C6", "A5", "G5", "F5"),
    ("B4", "D5", "G5", "B5", "A5", "G5", "D5", "G5"),
)

CHORDS = (
    ("F3", "C4", "F3", "C4"),
    ("G3", "D4", "G3", "D4"),
    ("C3", "G3", "C4", "G3"),
    ("A2", "E3", "A3", "E3"),
    ("F3", "C4", "F3", "C4"),
    ("G3", "D4", "G3", "D4"),
)

TOM_STEPS = (
    (), (7,), (3,), (7,), (5, 7,), (5, 7),
)


def frequency(name: str) -> float:
    pitch = name[:-1]
    octave = int(name[-1])
    midi = 12 * (octave + 1) + NOTE_NAMES[pitch]
    return 440.0 * 2.0 ** ((midi - 69) / 12.0)


def ted_value(name: str) -> int:
    value = round(1024.0 - TED_CLOCK / frequency(name))
    if not 0 <= value <= 1023:
        raise ValueError(f"{name} liegt ausserhalb des TED-Bereichs: {value}")
    return value


def db_entry(v1: int, v2: int, control: int, duration: int,
             comment: str) -> str:
    return (
        f"        DB      {v1 & 0xff:03X}h,{v1 >> 8:02X}h, "
        f"{v2 & 0xff:03X}h,{v2 >> 8:02X}h, "
        f"{control:03X}h,{duration:2d} ; {comment}"
    )


lines = [
    "; Automatisch erzeugte 120-BPM-Tabelle.",
    "; 035h = beide Rechteckstimmen, 055h = Stimme 1 plus Rauschen.",
    "PACMAN_MUSIC_TABLE:",
]

for bar in range(6):
    lines.append(f"        ; Takt {bar + 1}")
    for step in range(8):
        v1 = ted_value(LEAD[bar][step])
        accompaniment = ted_value(CHORDS[bar][step // 2])
        total_duration = 6 if step % 2 == 0 else 7

        if step in (0, 4):
            # Ein kurzer tiefer Tonimpuls simuliert die Bassdrum; danach wird
            # Stimme 2 fuer den Rest der Achtelnote zur Begleitung zurueckgesetzt.
            kick = round(1024.0 - TED_CLOCK / 135.0)
            lines.append(db_entry(v1, kick, 0x37, 1,
                                  f"{bar + 1}.{step + 1} Bassdrum"))
            lines.append(db_entry(v1, accompaniment, 0x34,
                                  total_duration - 1, "Begleitung"))
        elif step in (2, 6):
            # Stimme 2 wird fuer einen kurzen Rauschimpuls zur Snare.
            lines.append(db_entry(v1, 1000, 0x55, 1,
                                  f"{bar + 1}.{step + 1} Snare"))
            lines.append(db_entry(v1, accompaniment, 0x34,
                                  total_duration - 1, "Begleitung"))
        elif step in TOM_STEPS[bar]:
            tom_hz = 220.0 - 18.0 * (step % 4)
            tom = round(1024.0 - TED_CLOCK / tom_hz)
            lines.append(db_entry(v1, tom, 0x35, total_duration,
                                  f"{bar + 1}.{step + 1} Tom"))
        else:
            lines.append(db_entry(v1, accompaniment, 0x35, total_duration,
                                  f"{bar + 1}.{step + 1}"))

lines.extend((
    "        DB      000h,00h, 000h,00h, 000h, 0 ; Schleifenende",
    "",
))
OUTPUT.write_text("\n".join(lines), encoding="ascii")
print(f"Erzeugt: {OUTPUT}")
