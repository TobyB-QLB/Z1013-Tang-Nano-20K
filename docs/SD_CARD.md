# FAT32-microSD und Z1013-Dateien / FAT32 microSD and Z1013 files

[Deutsch](#deutsch) · [English](#english)

## Deutsch

Die Karte benötigt eine MBR-Partitionstabelle und eine FAT32-Partition. Dateien liegen ohne Unterverzeichnisse im Wurzelverzeichnis. Kurze FAT-Namen im Format 8.3 sind am zuverlässigsten.

## 9-Byte-Kopf

Vor den eigentlichen Nutzdaten steht:

| Byte | Inhalt |
|---|---|
| 0–2 | ASCII `@DD` (`40 44 44`) |
| 3–4 | Anfangsadresse, Low-Byte zuerst |
| 5–6 | Endadresse einschließlich, Low-Byte zuerst |
| 7–8 | Startadresse, Low-Byte zuerst |
| ab 9 | Nutzdaten |

Der Z1013 zeigt den Namen aus dem FAT32-Verzeichniseintrag an. Nur `.COM`-Dateien werden nach dem Laden automatisch gestartet; andere Dateiendungen dürfen auch ohne ausführbare Startadresse verwendet werden.

## Monitorbefehle

- `@DD` – Verzeichnis anzeigen
- `@DL` – Datei laden; `.COM` wird automatisch gestartet
- `@DS ANFANG ENDE START` – Speicherbereich als Datei sichern
- `@DK` – Datei nach Sicherheitsabfrage löschen

Die Verzeichnisanzeige pausiert passend zum 32×32-Zeichenbild und kann mit Enter fortgesetzt oder mit Esc beendet werden.

## Mitgelieferte Spiele

`PACMAN.COM`, `KIKSTART.COM` und `PUNIVERS.COM` besitzen bereits einen gültigen 9-Byte-Kopf. Sie werden unverändert in das Wurzelverzeichnis der FAT32-Karte kopiert. Das Werkzeug `@DS` darf auf diese fertigen Dateien nicht noch einmal angewendet werden, weil dadurch ein zweiter Kopf entstehen würde.

---

## English

The card needs an MBR partition table and a FAT32 partition. Store files in the root directory without subdirectories. Short 8.3 FAT filenames are the most reliable choice.

### 9-byte header

Every Z1013 file starts with this header before its payload:

| Byte | Contents |
|---|---|
| 0–2 | ASCII `@DD` (`40 44 44`) |
| 3–4 | Load address, low byte first |
| 5–6 | Inclusive end address, low byte first |
| 7–8 | Start address, low byte first |
| 9 onward | Program data |

The Z1013 displays the name from the FAT32 directory entry. Only `.COM` files start automatically after loading. Other extensions may be used without an executable start address.

### Monitor commands

- `@DD` – display the directory
- `@DL` – load a file; `.COM` files start automatically
- `@DS BEGIN END START` – save a memory range as a file
- `@DK` – delete a file after confirmation

The directory display pauses to fit the 32 × 32 character screen. Press Enter to continue or Esc to stop.

### Included games

`PACMAN.COM`, `KIKSTART.COM`, and `PUNIVERS.COM` already contain a valid 9-byte header. Copy them unchanged to the root directory of the FAT32 card. Do not process these ready-made files with the `@DS` tool again, because that would add a second header.
