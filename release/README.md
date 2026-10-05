# Fertige Dateien / Ready-made files

## Deutsch

- `z1013.fs` ist der getestete Bitstream für das Tang Nano 20K. Diese Datei im Gowin Programmer auswählen.
- `z1013_usb_v3923.fs` ist der getestete Bitstream mit USB-Tastaturunterstützung für Tang Nano 20K v3923.
  **FAT32-Update vom 05.10.2026:** F3/DOS ist enthalten; der SD-Controller wartet bis zu 500 ms auf das Ende der Programmierung und berücksichtigt verzögerte Schreibantworten. Gebaut mit Gowin V1.9.12.03 aus dem aktuellen Quellstand auf Basis von `ae63a1d`. FPGA-Flash verifiziert, BL616 vollständig wiederhergestellt; Tobias bestätigte anschließend erfolgreiches `@DS`-Speichern auf v3923. Details: [USB_KEYBOARD_STATUS.json](USB_KEYBOARD_STATUS.json), [SD-Anleitung](../docs/SD_CARD.md).
  **Vorheriger F3-Build und Hardwaretest: [Denny (OE4DEA)](https://github.com/OE4DEA), [PR #2](https://github.com/TobyB-QLB/Z1013-Tang-Nano-20K/pull/2).** Denny baute mit Gowin V1.9.12.04 und testete USB-Tastatur, F1/F2/F3 und F9–F12. Sein Beitrag bleibt Grundlage dieses Updates.
- `companion_z1013_v3923.bin` ist die passende BL616-Companion-Firmware für die USB-Tastatur-Version.
- `secondary_only.ini` und `companion_z1013.patch` dokumentieren die BL616-Programmierung und die Änderungen gegenüber FPGA-Companion.
- `hdmi.bin` ist eine alternative Binärdarstellung für andere Programmierverfahren.
- `SHA256SUMS` enthält die Prüfsummen, mit denen sich ein vollständiger Download kontrollieren lässt.

Für einen vorübergehenden Test `z1013.fs` oder `z1013_usb_v3923.fs` mit `SRAM Program` laden. Für den automatischen Start nach dem Einschalten anschließend `External Flash Mode` wählen und den Flash auf dem Board programmieren.

Die USB-Version benötigt zusätzlich die BL616-Datei `companion_z1013_v3923.bin`, die ab Adresse `0x40000` geschrieben wird. Hinweise dazu stehen in [`docs/USB_KEYBOARD.md`](../docs/USB_KEYBOARD.md).

Als freie Alternative zu Gowin Programmer kann openFPGALoader verwendet werden. Eine Schritt-für-Schritt-Anleitung steht in [`docs/OPENFPGALOADER.md`](../docs/OPENFPGALOADER.md).

Dieses FAT32-Update betrifft `z1013_usb_v3923.fs`. Die älteren Dateien `z1013.fs` und `hdmi.bin` wurden nicht neu gebaut und enthalten diese Korrektur nicht.

## English

- `z1013.fs` is the tested bitstream for the Tang Nano 20K. Select this file in Gowin Programmer.
- `z1013_usb_v3923.fs` is the tested bitstream with USB keyboard support for Tang Nano 20K v3923 boards.
  **FAT32 update, 2026-10-05:** includes F3/DOS; SD programming busy timeout increased to 500 ms and delayed write responses supported. Built with Gowin V1.9.12.03 from the current source based on `ae63a1d`. FPGA programming verified, complete BL616 restored; Tobias then confirmed successful `@DS` saving on v3923. See [USB_KEYBOARD_STATUS.json](USB_KEYBOARD_STATUS.json) and the [SD guide](../docs/SD_CARD.md).
  **Previous F3 build and hardware testing: [Denny (OE4DEA)](https://github.com/OE4DEA), [PR #2](https://github.com/TobyB-QLB/Z1013-Tang-Nano-20K/pull/2).** Denny built with Gowin V1.9.12.04 and tested USB keyboard, F1/F2/F3 and F9–F12. His contribution remains the basis of this update.
- `companion_z1013_v3923.bin` is the matching BL616 companion firmware for the USB keyboard version.
- `secondary_only.ini` and `companion_z1013.patch` document BL616 programming and the changes against FPGA-Companion.
- `hdmi.bin` is an alternative raw binary for other programming methods.
- `SHA256SUMS` contains checksums for verifying a complete download.

For a temporary test, load `z1013.fs` or `z1013_usb_v3923.fs` with `SRAM Program`. To start the system automatically after power-on, select `External Flash Mode` and program the on-board flash after the test succeeds.

The USB version also requires the BL616 file `companion_z1013_v3923.bin`, written starting at address `0x40000`. See [`docs/USB_KEYBOARD.md`](../docs/USB_KEYBOARD.md) for details.

The free openFPGALoader utility can be used instead of Gowin Programmer. See [`docs/OPENFPGALOADER.md`](../docs/OPENFPGALOADER.md) for step-by-step instructions.

This FAT32 update applies to `z1013_usb_v3923.fs`. The older `z1013.fs` and `hdmi.bin` files were not rebuilt and do not include this correction.
