# Z1013 für Tang Nano 20K / Z1013 for Tang Nano 20K

[Deutsch](#deutsch) · [English](#english)

## Deutsch

FPGA-Nachbau eines erweiterten Z1013 für das Sipeed Tang Nano 20K. Dieser Stand ist praktisch getestet und bietet einen Z80/T80, 64 KiB RAM, Text- und Vollgrafik, Farben, HDMI-Bild und -Ton, eine PS/2-Tastatur und Zugriff auf eine FAT32-microSD-Karte.

> **Veröffentlichungsstatus:** Technisch getesteter Release-Kandidat. Boot-ROM und Zeichengenerator stammen von Robotron aus der DDR und sind derzeit über öffentlich zugängliche Internetquellen verfügbar. Eine ausdrückliche Weiterverbreitungslizenz ist im Projekt noch nicht dokumentiert. Auch die Bedingungen für übernommene Gowin-Dateien müssen vor der öffentlichen Freigabe geklärt oder die Dateien ersetzt werden. Einzelheiten stehen in [THIRD_PARTY.md](THIRD_PARTY.md) und im lokalen Veröffentlichungsbericht.

## Funktionsumfang

- T80-kompatibler Z80-Prozessorkern
- 64 KiB Hauptspeicher und 8 KiB Boot-ROM
- Z1013-Textbild: 32 × 32 Zeichen
- Vollgrafik: 256 × 256 Pixel, auf 512 × 512 HDMI-Pixel skaliert
- 8 KiB Bildspeicher plus 8 KiB Farbattributspeicher
- 1280 × 720 HDMI mit digitalem Ton
- TED-inspirierter Zweikanal-Klanggenerator mit Rauschen und 4-Bit-Wiedergabe
- PS/2-Tastatur über zwei FPGA-Anschlüsse
- FAT32-microSD im SPI-Modus; Verzeichnis, Laden, Speichern und Löschen
- Kassettenausgabe des Monitors über HDMI-Ton
- umschaltbarer CPU-Takt

## Verifizierter Bedienstand

| Taste | Funktion |
|---|---|
| F1 | `@DD` und Enter – Verzeichnis anzeigen |
| F2 | `@DL` und Enter – Datei laden |
| F9 | CPU-Takt 1 MHz |
| F10 | CPU-Takt 2 MHz |
| F11 | CPU-Takt 4 MHz |
| F12 | CPU-Takt 8,25 MHz (Vorgabe) |
| Strg+Alt+Entf | FPGA-System zurücksetzen |

Dieser Stand entspricht dem gesicherten Projekt `Z1013_HDMI_FULL8K_SD_Z80_FAT32_STUFE11_CASSETTE_HDMI_OUT`. Die entscheidenden Quelldateien wurden gegen die Sicherung `Sicherung_Z1013_Tackt_@DD_Kassette` byteweise geprüft.

## Einfacher Schnellstart

1. Eine microSD-Karte mit MBR-Partitionstabelle und FAT32 formatieren.
2. `PACMAN.COM`, `KIKSTART.COM` und/oder `PUNIVERS.COM` aus `programs/` in das Wurzelverzeichnis der Karte kopieren. Die Dateien sind bereits fertig vorbereitet.
3. PS/2-Tastatur über die in [docs/HARDWARE.md](docs/HARDWARE.md) beschriebene Pegelanpassung anschließen.
4. Den fertigen Bitstream [`release/z1013.fs`](release/z1013.fs) mit Gowin Programmer auf das Tang Nano 20K übertragen. Zum Ausprobieren `SRAM Mode` verwenden; für einen dauerhaften Start `External Flash Mode` wählen und den Flash auf dem Board programmieren.
5. Nach dem Start F1 drücken, um das Kartenverzeichnis zu sehen.

Ausführlichere Hinweise stehen in [docs/BUILD.md](docs/BUILD.md) und [docs/SD_CARD.md](docs/SD_CARD.md). Wer Gowin Programmer nicht verwenden möchte, findet unter [docs/OPENFPGALOADER.md](docs/OPENFPGALOADER.md) eine einfache Anleitung für das freie Werkzeug openFPGALoader.

## Mitgelieferte Programme

- `programs/PACMAN/PACMAN.COM`
- `programs/PUNIVERS/PUNIVERS.COM` – stabile, getestete Fassung
- `programs/KIKSTART/KIKSTART.COM`

Die drei `.COM`-Dateien besitzen bereits den geprüften 9-Byte-Z1013-Kopf `@DD`. Anfangsadresse, Endadresse und Startadresse sind enthalten. Die Dateien können unverändert direkt auf die FAT32-Karte kopiert werden. Die jeweils zugehörigen Assemblerquellen und Grafikelemente liegen daneben im Verzeichnis `source/`.

PACMAN, KIKSTART und PUNIVERS wurden vollständig von Tobias Bremer für den Z1013 entwickelt. Programmcode, Darstellung, Grafik, Sound und Ausführung sind eigene Arbeiten. Die Programme sind lediglich an historische Spielideen angelehnt und wurden für dieses Projekt neu umgesetzt. Weitere Angaben stehen in [programs/README.md](programs/README.md).

## FAT32-Werkzeug @DS

Unter `tools/at-ds/` liegen ein Universalprogramm für macOS, eine x86-Fassung für Windows und der portable C-Quelltext. Das Werkzeug versieht eine rohe Programmdatei mit dem benötigten Z1013-Kopf und kopiert sie auf die SD-Karte. Siehe [tools/at-ds/README.md](tools/at-ds/README.md).

## Autor und Projektseite

Entwicklung: Tobias Bremer

Weitere Informationen, frühere Z80-/Z180-Eigenbauten und zusätzliche Dokumentation: [qlb-harz.de/Z80](https://qlb-harz.de/Z80/)

## Rechte und Herkunft

Der T80-Kern, der HDMI-Grundkern und Teile des ursprünglichen Tang-Nano-HDMI-Beispiels stammen aus Fremdprojekten und werden ausdrücklich nicht als eigene Entwicklung ausgegeben. Das historische ROM- und Zeichensatzmaterial von Robotron ist gesondert gekennzeichnet. Einzelheiten, Änderungsstatus und offene Rechtefragen stehen in [THIRD_PARTY.md](THIRD_PARTY.md). Für die projektspezifischen Eigenentwicklungen einschließlich der drei Programme wird derzeit keine pauschale Nutzungslizenz erteilt; siehe [LICENSE.md](LICENSE.md).

---

## English

This project recreates an enhanced Z1013 computer on the Sipeed Tang Nano 20K FPGA board. This version has been tested on real hardware. It provides a Z80/T80 CPU, 64 KiB RAM, text and full-screen graphics, color attributes, HDMI video and audio, a PS/2 keyboard, and access to a FAT32 microSD card.

> **Publication status:** Technically tested release candidate. The boot ROM and character generator originate from Robotron in the former GDR and are currently available from public Internet archives. The repository does not yet document an explicit redistribution license for them. The conditions for included Gowin files must also be clarified, or those files must be replaced, before public release. See [THIRD_PARTY.md](THIRD_PARTY.md).

### Features

- T80-compatible Z80 CPU core
- 64 KiB RAM and 8 KiB boot ROM
- 32 × 32 character Z1013 text display
- 256 × 256 full-screen graphics, scaled to 512 × 512 HDMI pixels
- 8 KiB video RAM and 8 KiB color attribute RAM
- 1280 × 720 HDMI video with digital audio
- TED-inspired two-channel sound generator with noise and 4-bit playback
- PS/2 keyboard using two FPGA pins
- FAT32 microSD directory, load, save, and delete functions
- Monitor cassette output through HDMI audio
- Selectable CPU speed

### Keyboard shortcuts

| Key | Function |
|---|---|
| F1 | Enter `@DD` and press Enter – show the directory |
| F2 | Enter `@DL` and press Enter – load a file |
| F9 | Set CPU speed to 1 MHz |
| F10 | Set CPU speed to 2 MHz |
| F11 | Set CPU speed to 4 MHz |
| F12 | Set CPU speed to 8.25 MHz (default) |
| Ctrl+Alt+Delete | Reset the FPGA system |

### Easy start

1. Format a microSD card with an MBR partition table and a FAT32 partition.
2. Copy `PACMAN.COM`, `KIKSTART.COM`, and/or `PUNIVERS.COM` from `programs/` to the root directory of the card. These files are ready to use.
3. Connect a PS/2 keyboard through the level adapter described in [docs/HARDWARE.md](docs/HARDWARE.md).
4. Program [`release/z1013.fs`](release/z1013.fs) onto the Tang Nano 20K with Gowin Programmer. Use `SRAM Mode` for a temporary test, or select `External Flash Mode` and program the on-board flash to keep the system after power-off.
5. Start the board and press F1 to display the card directory.

More detailed instructions are available in [docs/BUILD.md](docs/BUILD.md) and [docs/SD_CARD.md](docs/SD_CARD.md). If you prefer not to use Gowin Programmer, [docs/OPENFPGALOADER.md](docs/OPENFPGALOADER.md) explains how to use the free openFPGALoader tool.

### Included programs

- `programs/PACMAN/PACMAN.COM`
- `programs/PUNIVERS/PUNIVERS.COM` – stable, tested version
- `programs/KIKSTART/KIKSTART.COM`

All three `.COM` files already contain a verified 9-byte Z1013 `@DD` header with load, end, and start addresses. Copy them unchanged to the FAT32 card. Their assembly source code and graphics are stored in the adjacent `source/` directories.

PACMAN, KIKSTART, and PUNIVERS were developed entirely by Tobias Bremer for the Z1013. Their code, presentation, graphics, sound, and implementation are original work. They are inspired only by historical game ideas and were newly implemented for this project. See [programs/README.md](programs/README.md).

### FAT32 tool `@DS`

The `tools/at-ds/` directory contains a universal macOS program, a Windows x86 build, and portable C source code. It adds the required Z1013 header to a raw program file and copies the result to the SD card. See [tools/at-ds/README.md](tools/at-ds/README.md).

### Author and project website

Development: Tobias Bremer

More information, earlier Z80/Z180 home-built computers, and additional documentation: [qlb-harz.de/Z80](https://qlb-harz.de/Z80/)

### Rights and origins

The T80 core, the HDMI base core, and parts of the original Tang Nano HDMI example originate from third-party projects and are not presented as original work. Historical Robotron ROM and character-set material is identified separately. See [THIRD_PARTY.md](THIRD_PARTY.md) for origins, modifications, and unresolved rights questions. No general permission to use or redistribute the project-specific work, including the three games, is currently granted; see [LICENSE.md](LICENSE.md).
