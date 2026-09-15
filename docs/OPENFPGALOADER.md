# openFPGALoader

[Deutsch](#deutsch) · [English](#english)

## Deutsch

[openFPGALoader](https://trabucayre.github.io/openFPGALoader/) ist eine freie Alternative zu Gowin Programmer. Damit lässt sich der fertige Bitstream `release/z1013.fs` über die USB-Verbindung auf das Tang Nano 20K übertragen. Eine ähnliche Anleitung mit Abbildungen steht auf der [Projektseite von Tobias Bremer](https://qlb-harz.de/Z80/).

### Installation

- macOS mit Homebrew: `brew install openfpgaloader`
- Debian oder Ubuntu: `sudo apt install openfpgaloader`
- Windows mit MSYS2: `pacman -S mingw-w64-ucrt-x86_64-openFPGALoader`

Weitere Möglichkeiten stehen in der [offiziellen Installationsanleitung](https://trabucayre.github.io/openFPGALoader/guide/install.html).

### 1. Board erkennen

Das Tang Nano 20K über USB anschließen und im Hauptverzeichnis dieses Projekts ausführen:

```text
openFPGALoader -b tangnano20k -f --detect
```

Der Befehl zeigt das erkannte FPGA und den Flash-Baustein an.

### 2. Vorübergehend testen

```text
openFPGALoader -b tangnano20k release/z1013.fs
```

Der Bitstream wird nur in den SRAM geladen. Nach dem Ausschalten ist er wieder gelöscht. Diese Variante eignet sich zum gefahrlosen Testen.

### 3. Dauerhaft in den Flash schreiben

```text
openFPGALoader -b tangnano20k -f --external-flash --verify --offset 0x000000 release/z1013.fs
```

Der Bitstream wird ab Adresse `0x000000` in den Flash auf dem Board geschrieben und anschließend geprüft. Während des Schreibens dürfen USB-Verbindung und Stromversorgung nicht getrennt werden. Nach der Erfolgsmeldung das Board kurz trennen und wieder verbinden.

Dieses Projekt verwendet eine echte FAT32-microSD-Karte. Die Spiele werden auf diese Karte kopiert; für sie muss kein zweiter Flash-Bereich programmiert werden.

---

## English

[openFPGALoader](https://trabucayre.github.io/openFPGALoader/) is a free alternative to Gowin Programmer. It can transfer the ready-made `release/z1013.fs` bitstream to the Tang Nano 20K through USB. A similar illustrated guide is available on [Tobias Bremer's project website](https://qlb-harz.de/Z80/).

### Installation

- macOS with Homebrew: `brew install openfpgaloader`
- Debian or Ubuntu: `sudo apt install openfpgaloader`
- Windows with MSYS2: `pacman -S mingw-w64-ucrt-x86_64-openFPGALoader`

Other installation methods are described in the [official installation guide](https://trabucayre.github.io/openFPGALoader/guide/install.html).

### 1. Detect the board

Connect the Tang Nano 20K through USB and run this command from the root directory of the project:

```text
openFPGALoader -b tangnano20k -f --detect
```

The command displays the detected FPGA and flash device.

### 2. Run a temporary test

```text
openFPGALoader -b tangnano20k release/z1013.fs
```

This loads the bitstream into SRAM only. It is lost when power is removed, making this the safer choice for testing.

### 3. Write permanently to flash

```text
openFPGALoader -b tangnano20k -f --external-flash --verify --offset 0x000000 release/z1013.fs
```

This writes the bitstream to the on-board flash starting at address `0x000000` and verifies it. Do not disconnect USB or power while writing. After both success messages appear, briefly disconnect and reconnect the board.

This project uses a physical FAT32 microSD card. Copy the games to that card; no second flash area needs to be programmed for them.
