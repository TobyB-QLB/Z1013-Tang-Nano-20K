# Bauen und programmieren / Building and programming

[Deutsch](#deutsch) · [English](#english)

## Deutsch

## Voraussetzungen

- Sipeed Tang Nano 20K, FPGA `GW2AR-LV18QN88C8/I7`
- Gowin EDA 1.9.11.03 oder eine kompatible neuere Version
- HDMI-Monitor oder Fernseher
- FAT32-microSD-Karte
- optional eine PS/2-Tastatur samt passiver 5-V/3,3-V-Pegelanpassung

## Erzeugen

1. `hdmi.gprj` mit Gowin EDA öffnen.
2. Kontrollieren, dass `video_top` das Top-Modul ist.
3. „Synthesize“ und anschließend „Place & Route“ ausführen.
4. Für einen gefahrlosen Test im Programmer `SRAM Program` verwenden.
5. Erst nach erfolgreichem Test mit `External Flash Mode` dauerhaft in den Flash auf dem Board schreiben.

Der geprüfte und sofort nutzbare Bitstream liegt als `release/z1013.fs` vor. `release/hdmi.bin` ist eine alternative Binärdarstellung für andere Programmierverfahren. Für Gowin Programmer wird `z1013.fs` empfohlen. Die Prüfsummen befinden sich in `release/SHA256SUMS`.

## Boot-ROM neu bauen

Die FAT32-Routinen liegen in `firmware/IO_SYS_NEU`. Sie werden mit SjASMPlus assembliert. Das Skript `build_boot_rom.rb` setzt die erzeugten Teile in `src/gowin_rom/z1013_boot_rom.bin` ein. Vor Änderungen unbedingt eine Kopie des funktionierenden ROMs aufbewahren.

## Hinweis zu Gowin-IP

`src/gowin_rpll/TMDS_rPLL.v` ist die für dieses Projekt erzeugte PLL-Instanz. Die Pin- und Timing-Vorgaben liegen in `src/hdmi.cst` und `src/nano_20k_video.sdc`.

---

## English

### Requirements

- Sipeed Tang Nano 20K with FPGA `GW2AR-LV18QN88C8/I7`
- Gowin EDA 1.9.11.03 or a compatible newer version
- HDMI monitor or television
- FAT32 microSD card
- Optional PS/2 keyboard with a passive 5 V/3.3 V level adapter

### Using the ready-made bitstream

The tested bitstream is [`release/z1013.fs`](../release/z1013.fs). Connect the board through USB and select this file in Gowin Programmer.

- Use `SRAM Program` for a temporary test. The configuration is lost when power is removed.
- After a successful test, select `External Flash Mode` and program the on-board flash for automatic startup after power-on.

`release/hdmi.bin` is an alternative raw binary for other programming methods. Use `z1013.fs` with Gowin Programmer. Checksums are stored in `release/SHA256SUMS`.

### Building from source

1. Open `hdmi.gprj` in Gowin EDA.
2. Confirm that `video_top` is the top module.
3. Run Synthesize and then Place & Route.
4. Test the result with `SRAM Program`.
5. Select `External Flash Mode` and program the on-board flash only after the test succeeds.

### Rebuilding the boot ROM

The FAT32 routines are stored in `firmware/IO_SYS_NEU` and are assembled with SjASMPlus. The `build_boot_rom.rb` script inserts the generated parts into `src/gowin_rom/z1013_boot_rom.bin`. Keep a copy of the working ROM before making changes.

### Gowin IP note

`src/gowin_rpll/TMDS_rPLL.v` is the PLL instance generated for this project. Pin and timing constraints are stored in `src/hdmi.cst` and `src/nano_20k_video.sdc`.
