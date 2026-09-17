# BL616-Recovery

[Zur BL616-Anleitung](../README.md)

## Zuerst den betroffenen Baustein feststellen

- **Debugger erkannt, aber kein Z1013-Bild:** passenden FPGA-Bitstream nach [openFPGALoader-Anleitung](../../docs/OPENFPGALOADER.md) prüfen/erneut laden. Das installiert keine USB-Tastatur-Firmware.
- **Z1013 läuft, USB-Tastatur reagiert nicht:** Boardrevision, passendes Secondary-Image, USB-fähigen FPGA-Bitstream, Hub/Versorgung und Debugger-Version ab `2025030317` prüfen. PS/2 kann zur Fehlereingrenzung dienen.
- **Sipeed-Debugger fehlt:** zunächst USB-Datenkabel, direkten Rechneranschluss und Neustart ohne UPDATE prüfen. Im BL616-Downloadmodus erscheint stattdessen ein serieller Download-Port.

## Debugger-/Partner-Firmware wiederherstellen

Falls ein Secondary-Image versehentlich nach `0x00000` geschrieben oder der gesamte BL616-Flash gelöscht wurde, reicht ein erneutes FPGA-Update nicht aus.

1. Passende offizielle **Tang-Nano-20K**-Debugger-/Partner-Firmware über [Sipeeds Update-Anleitung](https://en.wiki.sipeed.com/hardware/en/tang/common-doc/update_debugger) beziehen und deren Prüfsumme prüfen. Kein Image für ein anderes Tang-Board verwenden.
2. Board stromlos machen; **UPDATE** beim Verbinden mit dem Rechner gedrückt halten, danach loslassen. Der BL616-Downloadmodus ist vom beschädigten normalen Debuggerbetrieb zu unterscheiden.
3. Nach Sipeed-Anleitung Bouffalo Lab Dev Cube auf BL616/618 und den Download-Port einstellen. Die **offizielle Debugger-Firmware ab `0x00000`** schreiben und verifizieren. Eine Sicherung des eigenen Boards nur mit passendem Wiederherstellungsverfahren verwenden; ein vollständiger Restore ersetzt auch den Secondary-Bereich.
4. Ohne UPDATE neu starten und prüfen, ob der Sipeed-Debugger wieder erkannt wird. Für Secondary Boot muss die Debugger-Version mindestens `2025030317` sein.
5. Falls nötig anschließend das verfügbare, revisionsrichtige Tastatur-Image separat ab **`0x40000`** installieren, siehe [Installation](../README.md#bl616-tastatur-firmware-erstmalig-installieren-oder-aktualisieren). Die beiden geplanten Dateinamen in `firmware/` sind noch keine verfügbaren Images.

Bei ausschließlich falscher Secondary-Firmware das passende Image ab `0x40000` ersetzen und den Debugger-Bereich `0x00000`–`0x3FFFF` erhalten. Nicht pauschal den gesamten Flash löschen. Bei einem fehlerhaften FPGA-Bitstream den FPGA separat wiederherstellen.

Bleibt nach korrektem Flashen und Neustart nur ein einzelner COM-Port sichtbar, nennt Sipeed in seiner FAQ mögliche eFuse-Probleme und verweist auf den Support. Keine eFuses auf Verdacht ändern. Für eine Fehlermeldung Boardrevision, Firmwaredatei/Prüfsumme, Startadresse, Werkzeugversion und Protokoll notieren.

Diese Hinweise beschreiben das Wiederherstellungsverfahren; im Rahmen dieser Dokumentationsänderung wurde kein Recovery an Hardware durchgeführt.
