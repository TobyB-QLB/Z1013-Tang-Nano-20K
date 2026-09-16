# USB-Tastatur / USB keyboard

[Deutsch](#deutsch) · [English](#english)

## Deutsch

Dieser Stand ergänzt den Z1013 um eine USB-Tastatur für Tang Nano 20K Boards mit Revision v3923. Die vorhandene PS/2-Tastatur bleibt parallel nutzbar.

## Funktionsprinzip

Der eingebaute BL616 des Tang Nano 20K liest die USB-Tastatur und übergibt Tastaturereignisse per SPI an den FPGA. Im FPGA werden USB- und PS/2-Zustände getrennt geführt und anschließend in der Z1013-Tastaturmatrix zusammengeführt. Dadurch löscht das Loslassen einer Taste auf einem Gerät keine weiterhin gedrückte Taste auf dem anderen Gerät.

## Benötigte Dateien

- `release/z1013_usb_v3923.fs`: FPGA-Bitstream mit USB-Tastaturunterstützung
- `release/companion_z1013_v3923.bin`: angepasste BL616-Companion-Firmware
- `release/secondary_only.ini`: Programmierkonfiguration für den BL616-Zusatzbereich
- `release/companion_z1013.patch`: dokumentiert die Änderungen gegenüber FPGA-Companion

Die Companion-Firmware wird ab Adresse `0x40000` geschrieben. Die ursprüngliche Firmware unterhalb `0x40000` bleibt erhalten. Vor Änderungen am BL616-Flash ist trotzdem eine vollständige Sicherung des BL616 empfehlenswert.

## Tastaturbelegung

- USB nutzt deutsche QWERTZ-Belegung.
- Y und Z sind für deutsche Tastaturen getauscht.
- Wichtige AltGr-Zeichen sind abgebildet: `@`, `{`, `[`, `]`, `}`, `\`, `~` und `|`.
- F1 sendet `@DD` und Enter.
- F2 sendet `@DL` und Enter.
- F9, F10, F11 und F12 wählen 1 MHz, 2 MHz, 4 MHz und 8,25 MHz.
- Strg+Alt+Entf löst den vorhandenen Z1013-Reset aus.

Nicht alle nationalen Sonderzeichen sind als neue Z1013-Zeichen ergänzt. Der Ziffernblock ist außer Enter derzeit nicht vollständig abgebildet.

## Programmieren

1. `release/z1013_usb_v3923.fs` mit Gowin Programmer oder openFPGALoader in den FPGA-Flash schreiben.
2. `release/companion_z1013_v3923.bin` mit passender BL616-Programmiersoftware ab Adresse `0x40000` schreiben.
3. Board kurz trennen und neu verbinden.
4. USB-Tastatur über einen geeigneten USB-C-Hub anschließen, der das Board und die Tastatur versorgen kann.

Für einen ersten FPGA-Test kann `z1013_usb_v3923.fs` auch nur in den SRAM geladen werden. Die USB-Tastatur funktioniert dauerhaft erst zusammen mit der passenden BL616-Companion-Firmware.

## Prüfung und Einschränkungen

Der Stand wurde mit Gowin EDA 1.9.12.03 gebaut. FPGA-Flash und BL616-Zusatzfirmware wurden geschrieben, verifiziert und zurückgelesen. Die F1/F2-Makros wurden verlängert, damit der originale Z1013-Monitor die Zeichenfolge bei 1 MHz zuverlässig erkennt.

Bekannte Einschränkungen:

- Die bekannten Timing-Hinweise des T80-Gesamtsystems bleiben bestehen.
- Mehrere USB-Tastaturen gleichzeitig werden nicht getrennt verwaltet.
- Gleichzeitige Sonderzeichen mit widersprüchlichen Shift-Anforderungen bleiben durch die historische Z1013-Matrix begrenzt.

## English

This version adds USB keyboard support for Tang Nano 20K v3923 boards. The existing PS/2 keyboard remains usable at the same time.

## How it works

The on-board BL616 reads the USB keyboard and forwards key events to the FPGA over SPI. Inside the FPGA, USB and PS/2 key states are tracked separately and then merged into the Z1013 keyboard matrix. Releasing a key on one device therefore does not clear the same key while it is still held on the other device.

## Required files

- `release/z1013_usb_v3923.fs`: FPGA bitstream with USB keyboard support
- `release/companion_z1013_v3923.bin`: adapted BL616 companion firmware
- `release/secondary_only.ini`: programming configuration for the BL616 secondary area
- `release/companion_z1013.patch`: documents the changes against FPGA-Companion

The companion firmware is written starting at address `0x40000`. The original firmware below `0x40000` remains unchanged. A full BL616 flash backup is still recommended before changing the BL616 flash.

## Keyboard layout

- USB uses a German QWERTZ layout.
- Y and Z are swapped for German keyboards.
- Important AltGr characters are mapped: `@`, `{`, `[`, `]`, `}`, `\`, `~`, and `|`.
- F1 sends `@DD` and Enter.
- F2 sends `@DL` and Enter.
- F9, F10, F11, and F12 select 1 MHz, 2 MHz, 4 MHz, and 8.25 MHz.
- Ctrl+Alt+Delete triggers the existing Z1013 reset.

Not all national special characters have been added as new Z1013 characters. The numeric keypad is currently not fully mapped except for Enter.

## Programming

1. Program `release/z1013_usb_v3923.fs` into the FPGA flash with Gowin Programmer or openFPGALoader.
2. Program `release/companion_z1013_v3923.bin` to the BL616 at address `0x40000` with suitable BL616 programming software.
3. Briefly disconnect and reconnect the board.
4. Connect the USB keyboard through a suitable USB-C hub that can power both the board and the keyboard.

For an initial FPGA test, `z1013_usb_v3923.fs` can also be loaded into SRAM only. Persistent USB keyboard operation requires the matching BL616 companion firmware.

## Verification and limitations

This version was built with Gowin EDA 1.9.12.03. FPGA flash and BL616 secondary firmware were programmed, verified, and read back. The F1/F2 macros were extended so that the original Z1013 monitor reliably sees the command sequence even at 1 MHz.

Known limitations:

- The existing T80 system timing warnings remain.
- Multiple USB keyboards are not tracked separately.
- Simultaneous special characters with conflicting Shift requirements remain limited by the historical Z1013 matrix.
