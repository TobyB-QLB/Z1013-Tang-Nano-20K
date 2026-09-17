# Geplante BL616-Release-Artefakte

| Boardrevision | Künftiger Dateiname | BL616-Startadresse | Verfügbarkeit |
|---|---|---|---|
| 3921 | `z1013-usb-keyboard-3921.bin` | `0x40000` | Kommendes Release-Artefakt |
| 3923 | `z1013-usb-keyboard-3923.bin` | `0x40000` | Kommendes Release-Artefakt |

Diese Dateien sind noch nicht enthalten. Es gibt keine Dummy-Binaries und keine Downloadlinks auf nicht vorhandene Dateien.

Der vorhandene 3923-Stand liegt separat unter [`release/companion_z1013_v3923.bin`](../../release/companion_z1013_v3923.bin). Er ist kein 3921-Image. Die vorhandene [`secondary_only.ini`](../../release/secondary_only.ini) verwendet dessen bisherigen Dateinamen.

Für die spätere Veröffentlichung jedes Images sind Boardrevision, Quellstand/Build-Anleitung, SHA-256-Prüfsumme, kompatibler FPGA-Bitstream und der tatsächliche Hardware-Teststatus zu dokumentieren. Beide Revisionen müssen getrennt geprüft werden; eine Umbenennung ersetzt keinen passenden Build.

Installation, Mindest-Debugger-Version `2025030317` und die Trennung der Flash-Bereiche erklärt die [BL616-Anleitung](../README.md). **Secondary-Images niemals nach `0x00000` schreiben.**
