# Bauen und programmieren

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
5. Erst nach erfolgreichem Test dauerhaft in den internen Konfigurations-Flash schreiben.

Der geprüfte Ausgangsstand liegt zusätzlich als `release/hdmi.fs` und `release/hdmi.bin` vor. Die Prüfsummen befinden sich in `release/SHA256SUMS`.

## Boot-ROM neu bauen

Die FAT32-Routinen liegen in `firmware/IO_SYS_NEU`. Sie werden mit SjASMPlus assembliert. Das Skript `build_boot_rom.rb` setzt die erzeugten Teile in `src/gowin_rom/z1013_boot_rom.bin` ein. Vor Änderungen unbedingt eine Kopie des funktionierenden ROMs aufbewahren.

## Hinweis zu Gowin-IP

`src/gowin_rpll/TMDS_rPLL.v` ist die für dieses Projekt erzeugte PLL-Instanz. Die Pin- und Timing-Vorgaben liegen in `src/hdmi.cst` und `src/nano_20k_video.sdc`.

