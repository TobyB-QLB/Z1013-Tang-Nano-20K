# Z1013 für Tang Nano 20K / Z1013 for Tang Nano 20K

[Deutsch](#deutsch) · [English](#english)

## Deutsch

FPGA-Nachbau eines erweiterten Z1013 für das Sipeed Tang Nano 20K. Dieser Stand ist praktisch getestet und bietet einen Z80/T80, 64 KiB RAM, Text- und Vollgrafik, Farben, HDMI-Bild und -Ton, PS/2-Tastatur, optional USB-Tastatur über den BL616-Companion und Zugriff auf eine FAT32-microSD-Karte.

> **Veröffentlichungsstatus:** Öffentlich veröffentlichter und auf echter Hardware getesteter Projektstand. Boot-ROM und Zeichengenerator stammen von Robotron aus der DDR und sind seit vielen Jahren in öffentlich zugänglichen Internetarchiven verfügbar. Für diese historischen Dateien wird keine eigene Urheberschaft oder zusätzliche Lizenz beansprucht. Herkunft und Fremdkomponenten sind in [THIRD_PARTY.md](THIRD_PARTY.md) dokumentiert.

## Funktionsumfang

- T80-kompatibler Z80-Prozessorkern
- 64 KiB Hauptspeicher und 8 KiB Boot-ROM
- Z1013-Textbild: 32 × 32 Zeichen
- Vollgrafik: 256 × 256 Pixel, auf 512 × 512 HDMI-Pixel skaliert
- 8 KiB Bildspeicher plus 8 KiB Farbattributspeicher
- 1280 × 720 HDMI mit digitalem Ton
- TED-inspirierter Zweikanal-Klanggenerator mit Rauschen und 4-Bit-Wiedergabe
- PS/2-Tastatur über zwei FPGA-Anschlüsse
- optionale USB-Tastatur über den eingebauten BL616 des Tang Nano 20K v3923
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

## USB-Tastatur-Update

Die [BL616-Installations- und Recovery-Anleitung](bl616/README.md) trennt FPGA-Updates, Sipeed-Debugger und Secondary-Firmware. Sie erklärt die Programmierung mit BouffaloLabDevCube, den Downloadmodus und die getrennten BL616-Dateien für 3921/3923. Ein [experimenteller 3921-Build](bl616/firmware/README.md) ist verfügbar; der Hardwaretest steht aus.

Der aktuelle Quellstand enthält zusätzlich eine USB-Tastaturanbindung für Tang Nano 20K Boards mit Revision v3923. Dabei wertet der vorhandene BL616-Companion eine USB-Tastatur aus und übergibt die Tastaturereignisse per SPI an den FPGA. PS/2 bleibt parallel nutzbar; gedrückte Tasten beider Eingänge werden getrennt verfolgt und in der Z1013-Tastaturmatrix zusammengeführt.

F1/F2 erzeugen die bekannten Monitorbefehle `@DD` und `@DL`, F9 bis F12 schalten die CPU-Geschwindigkeit. Die USB-Belegung ist deutsch/QWERTZ mit Y/Z-Tausch und wichtigen AltGr-Zeichen wie `@`, `{`, `[`, `]`, `}`, `\`, `~` und `|`. PS/2 behält die bisherige US-Zuordnung.

Für USB werden zwei Dateien benötigt:

- [`release/z1013_usb_v3923.fs`](release/z1013_usb_v3923.fs) – FPGA-Bitstream mit USB-Tastaturunterstützung
- [`release/companion_z1013_v3923.bin`](release/companion_z1013_v3923.bin) – angepasste BL616-Companion-Firmware für Tang Nano 20K v3923

Die BL616-Firmware wird ab Adresse `0x40000` geschrieben; die ursprüngliche Firmware unterhalb dieser Adresse bleibt erhalten. Details, Einschränkungen und Prüfergebnisse stehen in [docs/USB_KEYBOARD.md](docs/USB_KEYBOARD.md).

Eine genauere Beschreibung der BL616-Companion-Anpassung steht in [docs/BL616_COMPANION.md](docs/BL616_COMPANION.md).

## Einfacher Schnellstart

1. Eine microSD-Karte mit MBR-Partitionstabelle und FAT32 formatieren.
2. `PACMAN.COM`, `KIKSTART.COM` und/oder `PUNIVERS.COM` aus `programs/` in das Wurzelverzeichnis der Karte kopieren. Die Dateien sind bereits fertig vorbereitet.
3. PS/2-Tastatur über die in [docs/HARDWARE.md](docs/HARDWARE.md) beschriebene Pegelanpassung anschließen.
4. Den fertigen Bitstream [`release/z1013.fs`](release/z1013.fs) mit Gowin Programmer auf das Tang Nano 20K übertragen. Für die USB-Tastatur-Version stattdessen [`release/z1013_usb_v3923.fs`](release/z1013_usb_v3923.fs) verwenden und zusätzlich die Hinweise in [docs/USB_KEYBOARD.md](docs/USB_KEYBOARD.md) beachten. Zum Ausprobieren `SRAM Mode` verwenden; für einen dauerhaften Start `External Flash Mode` wählen und den Flash auf dem Board programmieren.
5. Nach dem Start F1 drücken, um das Kartenverzeichnis zu sehen.

Ausführlichere Hinweise stehen in [docs/BUILD.md](docs/BUILD.md) und [docs/SD_CARD.md](docs/SD_CARD.md). Wer Gowin Programmer nicht verwenden möchte, findet unter [docs/OPENFPGALOADER.md](docs/OPENFPGALOADER.md) eine einfache Anleitung für das freie Werkzeug openFPGALoader.

## Mitgelieferte Programme

Zusätzlich: [DEMO.COM – Concept-Demo](programs/DEMO/README.md) mit farbigem Lauftext und Musik, inklusive 9-Byte-Dateikopf.

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

Der T80-Kern, der HDMI-Grundkern und Teile des ursprünglichen Tang-Nano-HDMI-Beispiels stammen aus Fremdprojekten und werden ausdrücklich nicht als eigene Entwicklung ausgegeben. Das historische ROM- und Zeichensatzmaterial von Robotron ist gesondert gekennzeichnet. Einzelheiten zu Herkunft, Änderungen und Lizenzstatus stehen in [THIRD_PARTY.md](THIRD_PARTY.md). Für die projektspezifischen Eigenentwicklungen einschließlich der drei Programme wird derzeit keine pauschale Nutzungslizenz erteilt; siehe [LICENSE.md](LICENSE.md).

---

## English

This project recreates an enhanced Z1013 computer on the Sipeed Tang Nano 20K FPGA board. This version has been tested on real hardware. It provides a Z80/T80 CPU, 64 KiB RAM, text and full-screen graphics, color attributes, HDMI video and audio, a PS/2 keyboard, optional USB keyboard support through the BL616 companion, and access to a FAT32 microSD card.

> **Publication status:** Publicly released project version tested on real hardware. The boot ROM and character generator originate from Robotron in the former GDR and have been available from public Internet archives for many years. This project claims neither authorship nor an additional license for these historical files. Origins and third-party components are documented in [THIRD_PARTY.md](THIRD_PARTY.md).

### Features

- T80-compatible Z80 CPU core
- 64 KiB RAM and 8 KiB boot ROM
- 32 × 32 character Z1013 text display
- 256 × 256 full-screen graphics, scaled to 512 × 512 HDMI pixels
- 8 KiB video RAM and 8 KiB color attribute RAM
- 1280 × 720 HDMI video with digital audio
- TED-inspired two-channel sound generator with noise and 4-bit playback
- PS/2 keyboard using two FPGA pins
- optional USB keyboard through the on-board BL616 on Tang Nano 20K v3923 boards
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

### USB keyboard update

The [BL616 installation and recovery guide (German)](bl616/README.md) separates FPGA updates, Sipeed debugger firmware and secondary firmware. It explains programming with BouffaloLabDevCube, download mode, and the separate firmware files for 3921/3923. An [experimental 3921 build](bl616/firmware/README.md) is available; hardware testing is pending.

The current source tree also contains USB keyboard support for Tang Nano 20K v3923 boards. The on-board BL616 companion reads a USB keyboard and forwards key events to the FPGA over SPI. PS/2 remains usable at the same time; both keyboard states are tracked separately and combined into the Z1013 keyboard matrix.

F1/F2 enter the familiar monitor commands `@DD` and `@DL`, while F9 to F12 select the CPU speed. USB uses a German QWERTZ layout with swapped Y/Z and important AltGr characters such as `@`, `{`, `[`, `]`, `}`, `\`, `~`, and `|`. PS/2 keeps the previous US layout.

USB operation requires two files:

- [`release/z1013_usb_v3923.fs`](release/z1013_usb_v3923.fs) – FPGA bitstream with USB keyboard support
- [`release/companion_z1013_v3923.bin`](release/companion_z1013_v3923.bin) – adapted BL616 companion firmware for Tang Nano 20K v3923

The BL616 firmware is written starting at address `0x40000`; the original firmware below that address remains unchanged. See [docs/USB_KEYBOARD.md](docs/USB_KEYBOARD.md) for details, limitations, and verification notes.

A more detailed description of the BL616 companion adaptation is available in [docs/BL616_COMPANION.md](docs/BL616_COMPANION.md).

### Easy start

1. Format a microSD card with an MBR partition table and a FAT32 partition.
2. Copy `PACMAN.COM`, `KIKSTART.COM`, and/or `PUNIVERS.COM` from `programs/` to the root directory of the card. These files are ready to use.
3. Connect a PS/2 keyboard through the level adapter described in [docs/HARDWARE.md](docs/HARDWARE.md).
4. Program [`release/z1013.fs`](release/z1013.fs) onto the Tang Nano 20K with Gowin Programmer. For the USB keyboard version, use [`release/z1013_usb_v3923.fs`](release/z1013_usb_v3923.fs) instead and also follow [docs/USB_KEYBOARD.md](docs/USB_KEYBOARD.md). Use `SRAM Mode` for a temporary test, or select `External Flash Mode` and program the on-board flash to keep the system after power-off.
5. Start the board and press F1 to display the card directory.

More detailed instructions are available in [docs/BUILD.md](docs/BUILD.md) and [docs/SD_CARD.md](docs/SD_CARD.md). If you prefer not to use Gowin Programmer, [docs/OPENFPGALOADER.md](docs/OPENFPGALOADER.md) explains how to use the free openFPGALoader tool.

### Included programs

Also available: [DEMO.COM – Concept demo](programs/DEMO/README.md), with color scrolling text, music, and the required 9-byte header.

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

The T80 core, the HDMI base core, and parts of the original Tang Nano HDMI example originate from third-party projects and are not presented as original work. Historical Robotron ROM and character-set material is identified separately. See [THIRD_PARTY.md](THIRD_PARTY.md) for origins, modifications, and license status. No general permission to use or redistribute the project-specific work, including the three games, is currently granted; see [LICENSE.md](LICENSE.md).
