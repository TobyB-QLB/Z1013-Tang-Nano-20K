# BL616 Companion for USB Keyboard

[Deutsch](#deutsch) · [English](#english)

## Deutsch

Diese Hinweise beschreiben die BL616-Erweiterung für die USB-Tastatur-Version des Z1013 auf dem Tang Nano 20K. Sie gelten für Boards mit Revision v3923.

## Aufgabe des BL616

Der BL616 auf dem Tang Nano 20K arbeitet als USB-Host für die Tastatur. Er liest die HID-Tastaturereignisse und sendet sie über die interne SPI-Verbindung an den FPGA. Im FPGA werden diese USB-Ereignisse mit der vorhandenen PS/2-Tastaturauswertung zusammengeführt.

Der BL616 greift nicht auf die microSD-Karte zu. FAT32, Z1013-Monitor, Video, Sound und SD-Zugriff bleiben im FPGA beziehungsweise im Z1013-System.

## Boardrevision und Signale

Diese Version wurde für Tang Nano 20K v3923 vorbereitet. Die verwendeten FPGA-Pins stehen in `src/hdmi.cst`:

| Signal | FPGA-Pin | Richtung aus FPGA-Sicht |
|---|---:|---|
| `I_usb_cs_n` | 86 | Eingang |
| `I_usb_sclk` | 13 | Eingang |
| `I_usb_mosi` | 76 | Eingang |
| `O_usb_miso` | 75 | Ausgang |
| `O_usb_irq_n` | 69 | Ausgang |

Die Companion-Firmware fordert 12 MHz SPI an. Damit bleibt die gerundete reale SPI-Frequenz unter der für den FPGA vorgesehenen 20-MHz-Grenze.

## Verwendete Dateien

| Datei | Zweck |
|---|---|
| `release/companion_z1013_v3923.bin` | angepasste BL616-Companion-Firmware |
| `release/secondary_only.ini` | Konfiguration für den BL616-Zusatzbereich ab `0x40000` |
| `release/companion_z1013.patch` | dokumentiert die Änderungen gegenüber FPGA-Companion |
| `release/USB_KEYBOARD_STATUS.json` | Prüfsummen, Teststatus und Programmierstand |

`secondary_only.ini` verwendet nur den Dateinamen `companion_z1013_v3923.bin`. Falls das verwendete BL616-Programmierwerkzeug einen vollständigen Pfad verlangt, muss dieser lokal auf den eigenen Downloadordner angepasst werden.

## Flash-Adresse

Die Z1013-Companion-Datei wird ab Adresse `0x40000` geschrieben. Die ursprüngliche BL616-Firmware unterhalb `0x40000` soll erhalten bleiben.

Vor dem Schreiben ist eine vollständige Sicherung des BL616-Flash sinnvoll. Beim getesteten Stand wurden die geänderten Bereiche geschrieben, anschließend zurückgelesen und gegen die Soll-Prüfsummen verglichen.

## Änderungen gegenüber FPGA-Companion

Die Änderungen sind klein und in `release/companion_z1013.patch` dokumentiert:

- OSD-Hotkey standardmäßig deaktiviert, damit F12 an den Z1013 weitergegeben wird.
- Beim Abziehen einer USB-Tastatur sendet der BL616 ein Freigabeereignis `0xff`, damit keine Taste hängen bleibt.
- SPI-Frequenzanforderung für Tang Nano 20K v3923 auf 12 MHz gesetzt.
- LTO für den BL616-Build deaktiviert, weil die verwendeten vorgebauten SDK-Bibliotheken damit nicht kompatibel waren.

## SPI-Protokoll zum FPGA

Der FPGA antwortet auf die Companion-Statusabfrage mit den erwarteten Kennbytes. Tastaturereignisse werden als HID-Transaktion an Ziel `1`, Befehl `1`, Byte `2` übergeben.

Bei Tastaturereignissen enthält Bit 7 den Loslass-Status:

- Bit 7 = 0: Taste gedrückt
- Bit 7 = 1: Taste losgelassen
- Wert `0xff`: USB-Tastatur wurde abgezogen, alle USB-Tastenzustände freigeben

Der FPGA übernimmt die Ereignisse über eine Taktdomänenübergabe in den Pixeltakt und führt sie anschließend mit dem PS/2-Zustand zusammen.

## Nachbau-Hinweise

Für einen Nachbau werden beide Teile benötigt:

1. `release/z1013_usb_v3923.fs` in den FPGA-Flash schreiben.
2. `release/companion_z1013_v3923.bin` ab Adresse `0x40000` in den BL616 schreiben.
3. Board kurz trennen und neu verbinden.
4. USB-Tastatur über einen geeigneten USB-C-Hub anschließen.

Wenn nur der FPGA-Bitstream geschrieben wird, bleibt der Z1013 lauffähig, aber die USB-Tastatur funktioniert nicht dauerhaft. PS/2 kann weiterhin genutzt werden.

## English

These notes describe the BL616 extension used by the USB keyboard version of the Z1013 on the Tang Nano 20K. They apply to v3923 boards.

## BL616 Role

The BL616 on the Tang Nano 20K acts as the USB host for the keyboard. It reads HID keyboard events and sends them to the FPGA through the internal SPI link. Inside the FPGA, these USB events are merged with the existing PS/2 keyboard handling.

The BL616 does not access the microSD card. FAT32, the Z1013 monitor, video, sound, and SD access remain in the FPGA and Z1013 system.

## Board Revision and Signals

This version was prepared for Tang Nano 20K v3923. The FPGA pins are listed in `src/hdmi.cst`:

| Signal | FPGA pin | Direction from FPGA |
|---|---:|---|
| `I_usb_cs_n` | 86 | input |
| `I_usb_sclk` | 13 | input |
| `I_usb_mosi` | 76 | input |
| `O_usb_miso` | 75 | output |
| `O_usb_irq_n` | 69 | output |

The companion firmware requests a 12 MHz SPI clock. This keeps the rounded real SPI frequency below the FPGA-side 20 MHz limit.

## Files

| File | Purpose |
|---|---|
| `release/companion_z1013_v3923.bin` | adapted BL616 companion firmware |
| `release/secondary_only.ini` | configuration for the BL616 secondary area starting at `0x40000` |
| `release/companion_z1013.patch` | documents the changes against FPGA-Companion |
| `release/USB_KEYBOARD_STATUS.json` | checksums, test status, and programming state |

`secondary_only.ini` uses only the file name `companion_z1013_v3923.bin`. If your BL616 programming tool requires an absolute path, adjust it locally to your download folder.

## Flash Address

The Z1013 companion file is written starting at address `0x40000`. The original BL616 firmware below `0x40000` should remain untouched.

A full BL616 flash backup is recommended before writing. In the tested setup, the modified ranges were written, read back, and compared against the expected checksums.

## Changes Against FPGA-Companion

The changes are small and documented in `release/companion_z1013.patch`:

- OSD hotkey disabled by default so F12 is passed to the Z1013.
- When a USB keyboard is unplugged, the BL616 sends release event `0xff` so no key remains stuck.
- SPI frequency request for Tang Nano 20K v3923 set to 12 MHz.
- LTO disabled for the BL616 build because the used prebuilt SDK libraries were not compatible with it.

## SPI Protocol to the FPGA

The FPGA answers the companion status request with the expected signature bytes. Keyboard events are transferred as a HID transaction to target `1`, command `1`, byte `2`.

For keyboard events, bit 7 marks release:

- bit 7 = 0: key press
- bit 7 = 1: key release
- value `0xff`: USB keyboard unplugged, release all USB key states

The FPGA moves the events into the pixel clock domain and then merges them with the PS/2 state.

## Rebuild Notes

For a rebuild, both parts are required:

1. Program `release/z1013_usb_v3923.fs` into the FPGA flash.
2. Program `release/companion_z1013_v3923.bin` to the BL616 starting at address `0x40000`.
3. Briefly disconnect and reconnect the board.
4. Connect the USB keyboard through a suitable USB-C hub.

If only the FPGA bitstream is programmed, the Z1013 still runs, but persistent USB keyboard operation is not available. PS/2 remains usable.
