# Z1013 für Tang Nano 20K

FPGA-Nachbau eines erweiterten Z1013 auf dem Sipeed Tang Nano 20K. Dieser Stand ist die praktisch getestete Fassung mit Z80/T80, 64 KiB RAM, Text- und Vollgrafik, Farbattributen, HDMI-Bild und -Ton, PS/2-Tastatur sowie FAT32-Zugriff auf die eingebaute microSD-Karte.

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

## Schnellstart

1. Eine microSD-Karte mit MBR-Partitionstabelle und FAT32 formatieren.
2. Die gewünschten Dateien aus `programs/` in das Wurzelverzeichnis der Karte kopieren.
3. PS/2-Tastatur über die in [docs/HARDWARE.md](docs/HARDWARE.md) beschriebene Pegelanpassung anschließen.
4. In Gowin EDA 1.9.11.03 `hdmi.gprj` öffnen, synthetisieren und programmieren – oder den geprüften Bitstream aus `release/` verwenden.
5. Nach dem Start F1 drücken, um das Kartenverzeichnis zu sehen.

Ausführlichere Hinweise stehen in [docs/BUILD.md](docs/BUILD.md) und [docs/SD_CARD.md](docs/SD_CARD.md).

## Mitgelieferte Programme

- `programs/PACMAN/PACMAN.COM`
- `programs/PUNIVERS/PUNIVERS.COM` – stabile, getestete Fassung
- `programs/KIKSTART/KIKSTART.COM`

Die Dateien besitzen bereits den 9-Byte-Z1013-Kopf und können direkt auf die FAT32-Karte kopiert werden. Die jeweils zugehörigen Assemblerquellen und Grafikelemente liegen daneben im Verzeichnis `source/`.

PACMAN, KIKSTART und PUNIVERS wurden vollständig von Tobias Bremer für den Z1013 entwickelt. Programmcode, Darstellung, Grafik, Sound und Ausführung sind eigene Arbeiten. Die Programme sind lediglich an historische Spielideen angelehnt und wurden für dieses Projekt neu umgesetzt. Weitere Angaben stehen in [programs/README.md](programs/README.md).

## FAT32-Werkzeug @DS

Unter `tools/at-ds/` liegen ein Universalprogramm für macOS, eine x86-Fassung für Windows und der portable C-Quelltext. Das Werkzeug versieht eine rohe Programmdatei mit dem benötigten Z1013-Kopf und kopiert sie auf die SD-Karte. Siehe [tools/at-ds/README.md](tools/at-ds/README.md).

## Autor und Projektseite

Entwicklung: Tobias Bremer

Weitere Informationen, frühere Z80-/Z180-Eigenbauten und zusätzliche Dokumentation: [qlb-harz.de/Z80](https://qlb-harz.de/Z80/)

## Rechte und Herkunft

Der T80-Kern, der HDMI-Grundkern und Teile des ursprünglichen Tang-Nano-HDMI-Beispiels stammen aus Fremdprojekten und werden ausdrücklich nicht als eigene Entwicklung ausgegeben. Das historische ROM- und Zeichensatzmaterial von Robotron ist gesondert gekennzeichnet. Einzelheiten, Änderungsstatus und offene Rechtefragen stehen in [THIRD_PARTY.md](THIRD_PARTY.md). Für die projektspezifischen Eigenentwicklungen einschließlich der drei Programme wird derzeit keine pauschale Nutzungslizenz erteilt; siehe [LICENSE.md](LICENSE.md).
