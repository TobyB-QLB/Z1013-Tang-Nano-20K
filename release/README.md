# Fertige Dateien / Ready-made files

## Deutsch

- `z1013.fs` ist der getestete Bitstream für das Tang Nano 20K. Diese Datei im Gowin Programmer auswählen.
- `hdmi.bin` ist eine alternative Binärdarstellung für andere Programmierverfahren.
- `SHA256SUMS` enthält die Prüfsummen, mit denen sich ein vollständiger Download kontrollieren lässt.

Für einen vorübergehenden Test `z1013.fs` mit `SRAM Program` laden. Für den automatischen Start nach dem Einschalten anschließend `External Flash Mode` wählen und den Flash auf dem Board programmieren.

Als freie Alternative zu Gowin Programmer kann openFPGALoader verwendet werden. Eine Schritt-für-Schritt-Anleitung steht in [`docs/OPENFPGALOADER.md`](../docs/OPENFPGALOADER.md).

## English

- `z1013.fs` is the tested bitstream for the Tang Nano 20K. Select this file in Gowin Programmer.
- `hdmi.bin` is an alternative raw binary for other programming methods.
- `SHA256SUMS` contains checksums for verifying a complete download.

For a temporary test, load `z1013.fs` with `SRAM Program`. To start the system automatically after power-on, select `External Flash Mode` and program the on-board flash after the test succeeds.

The free openFPGALoader utility can be used instead of Gowin Programmer. See [`docs/OPENFPGALOADER.md`](../docs/OPENFPGALOADER.md) for step-by-step instructions.
