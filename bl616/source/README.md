# BL616-Quellen und Build

Basis: [MiSTle-Dev/FPGA-Companion v1.4.29](https://github.com/MiSTle-Dev/FPGA-Companion/tree/49ebb110045866493ce5802e46466096b4265874), Commit `49ebb110045866493ce5802e46466096b4265874`.

[`z1013-keyboard.patch`](z1013-keyboard.patch) enthält alle Änderungen an den Companion-Dateien gegenüber diesem Stand:

- OSD-Hotkey deaktiviert, damit F12 beim Z1013 bleibt.
- Beim Abziehen der Tastatur das Z1013-Freigabeereignis `0xff` senden.
- SPI-Taktanforderung für 3921 und 3923 auf 12 MHz begrenzen.
- LTO wegen der vorgebauten SDK-Bibliotheken deaktivieren.

Upstream-Lizenz: [Apache-2.0](LICENSE-Apache-2.0.txt). Die Firmware enthält außerdem Komponenten des Bouffalo SDK; deren jeweilige Hinweise und Lizenzen bleiben gültig.

## Build der 3921-Variante

Verwendete SDK-Basis: [bouffalolab/bouffalo_sdk](https://github.com/bouffalolab/bouffalo_sdk/tree/9ce0e6b51d6bfa379c124e7d21a17d30ccce32a3), Commit `9ce0e6b51d6bfa379c124e7d21a17d30ccce32a3`, wie beim bisherigen Z1013-3923-Build. Werkzeug: Bouffalo T-Head RISC-V GCC 10.2.0 für macOS (Intel; auf Apple Silicon mit Rosetta), GNU Make und CMake. Die Compiler-Binaries müssen auch im `PATH` stehen, damit die SDK-Nachbearbeitung sie findet.

```sh
git clone --branch v1.4.29 --recurse-submodules https://github.com/MiSTle-Dev/FPGA-Companion.git
cd FPGA-Companion
git apply /absoluter/pfad/z1013-keyboard.patch
# BL_SDK_BASE auf den oben genannten SDK-Checkout setzen.
# CROSS_COMPILE auf den vollständigen Pfad mit Präfix riscv64-unknown-elf- setzen.
# Das Verzeichnis dieser Compiler-Werkzeuge zum PATH hinzufügen.
cd src/bl616
make TANG_BOARD=nano20k
```

Unter macOS GNU Make (`gmake`) verwenden. Das Ziel **`nano20k` steht für 3921**, `nano20k_v3923` für 3923. Nicht den Standard `m0sdock` bauen. Das Ergebnis `build/build_out/fpga_companion_bl616.bin` wird als `z1013-usb-keyboard-3921.bin` bereitgestellt. Keine zusammengefügten Flash-Images, OTA-Dateien, eFuse-Dateien oder Partner-Binaries als Secondary-Image verwenden.

| BL616-Signal | 3921 GPIO | 3923 GPIO |
|---|---:|---:|
| CS | 0 | 0 |
| SCLK | 1 | 1 |
| MISO | 2 | 30 |
| MOSI | 3 | 27 |
| IRQ | 13 | 13 |

Der Build und die präprozessierten 3921-Pins wurden geprüft. Ein physischer 3921-Test fehlt. Besonders bei 3921 ist GPIO2 zugleich ein Boot-Signal; Kaltstart und Rückkehr zum PC-Programmierbetrieb gehören deshalb zum Hardwaretest.

## Hardware-Abnahme vor einer stabilen Freigabe

Auf einem kompatiblen 3921-Board mit funktionierender Partner-Firmware: Secondary-Image ab `0x40000` schreiben und zurücklesen; den unveränderten Primary-Bereich prüfen. Mit USB-fähigem Z1013-Bitstream Kaltstart, Texteingabe/QWERTZ, F1/F2, F9–F12, Strg+Alt+Entf, Loslassen/Abziehen/Anstecken, PS/2 parallel sowie Rückkehr zum PC-Debugger testen. Boardvariante, Tastatur/Hub, Firmware-Prüfsummen und Ergebnis protokollieren. Bis dahin bleibt das Image ein experimenteller Teststand.

Als Kontrolle wurde mit derselben Build-Umgebung auch `nano20k_v3923` neu gebaut. Das Ergebnis stimmt mit `release/companion_z1013_v3923.bin` bis auf zwei eingebettete Build-Datums-/Zeitangaben byteweise überein. Dies prüft die Build-Basis, ersetzt aber keinen 3921-Hardwaretest.
