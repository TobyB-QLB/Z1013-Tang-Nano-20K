# Fertige Dateien / Ready-made files

## Deutsch

- `z1013.fs` ist der getestete Bitstream für das Tang Nano 20K. Diese Datei im Gowin Programmer auswählen.
- `z1013_usb_v3923.fs` ist der getestete Bitstream mit USB-Tastaturunterstützung für Tang Nano 20K v3923.
  **Build und Hardwaretest: [Denny (OE4DEA)](https://github.com/OE4DEA), bereitgestellt über [PR #2](https://github.com/TobyB-QLB/Z1013-Tang-Nano-20K/pull/2).**
  Gebaut mit Gowin V1.9.12.04 aus Commit `4eda812087e03296a27be9ea01363c4e4dd3c907`. Auf Tang Nano 20K v3923 getestet: USB-Tastatur, F1/F2/F3 sowie F9-F12.
- `companion_z1013_v3923.bin` ist die passende BL616-Companion-Firmware für die USB-Tastatur-Version.
- `secondary_only.ini` und `companion_z1013.patch` dokumentieren die BL616-Programmierung und die Änderungen gegenüber FPGA-Companion.
- `hdmi.bin` ist eine alternative Binärdarstellung für andere Programmierverfahren.
- `SHA256SUMS` enthält die Prüfsummen, mit denen sich ein vollständiger Download kontrollieren lässt.

Für einen vorübergehenden Test `z1013.fs` oder `z1013_usb_v3923.fs` mit `SRAM Program` laden. Für den automatischen Start nach dem Einschalten anschließend `External Flash Mode` wählen und den Flash auf dem Board programmieren.

Die USB-Version benötigt zusätzlich die BL616-Datei `companion_z1013_v3923.bin`, die ab Adresse `0x40000` geschrieben wird. Hinweise dazu stehen in [`docs/USB_KEYBOARD.md`](../docs/USB_KEYBOARD.md).

Als freie Alternative zu Gowin Programmer kann openFPGALoader verwendet werden. Eine Schritt-für-Schritt-Anleitung steht in [`docs/OPENFPGALOADER.md`](../docs/OPENFPGALOADER.md).

## English

- `z1013.fs` is the tested bitstream for the Tang Nano 20K. Select this file in Gowin Programmer.
- `z1013_usb_v3923.fs` is the tested bitstream with USB keyboard support for Tang Nano 20K v3923 boards.
  **Build and hardware testing: [Denny (OE4DEA)](https://github.com/OE4DEA), contributed via [PR #2](https://github.com/TobyB-QLB/Z1013-Tang-Nano-20K/pull/2).**
  Built with Gowin V1.9.12.04 from commit `4eda812087e03296a27be9ea01363c4e4dd3c907`. Hardware-tested on Tang Nano 20K v3923: USB keyboard, F1/F2/F3 and F9-F12.
- `companion_z1013_v3923.bin` is the matching BL616 companion firmware for the USB keyboard version.
- `secondary_only.ini` and `companion_z1013.patch` document BL616 programming and the changes against FPGA-Companion.
- `hdmi.bin` is an alternative raw binary for other programming methods.
- `SHA256SUMS` contains checksums for verifying a complete download.

For a temporary test, load `z1013.fs` or `z1013_usb_v3923.fs` with `SRAM Program`. To start the system automatically after power-on, select `External Flash Mode` and program the on-board flash after the test succeeds.

The USB version also requires the BL616 file `companion_z1013_v3923.bin`, written starting at address `0x40000`. See [`docs/USB_KEYBOARD.md`](../docs/USB_KEYBOARD.md) for details.

The free openFPGALoader utility can be used instead of Gowin Programmer. See [`docs/OPENFPGALOADER.md`](../docs/OPENFPGALOADER.md) for step-by-step instructions.
