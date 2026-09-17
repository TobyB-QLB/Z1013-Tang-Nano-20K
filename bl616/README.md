# BL616: USB-Tastatur und Firmware-Installation

[Zur Projektübersicht](../README.md) · [Firmware-Status](firmware/README.md) · [Recovery](recovery/README.md)

## Boardrevision und Veröffentlichungsstatus

Vor jedem BL616-Update die Revision auf der Platine prüfen. Für 3921 und 3923 sind getrennte Images vorgesehen; die Revisionen verwenden unterschiedliche BL616-SPI-Pinbelegungen. Images nicht zwischen den Revisionen austauschen oder durch Umbenennen anpassen.

| Boardrevision | Vorgesehener Dateiname | Status |
|---|---|---|
| 3921 | `z1013-usb-keyboard-3921.bin` | Kommendes Release-Artefakt; noch nicht enthalten oder für dieses Projekt validiert |
| 3923 | `z1013-usb-keyboard-3923.bin` | Kommendes Release-Artefakt unter diesem Namen; noch nicht enthalten |

Es werden keine Dummy-Binaries bereitgestellt. Bereits vorhanden ist der separate 3923-Stand [`release/companion_z1013_v3923.bin`](../release/companion_z1013_v3923.bin), zusammen mit [`release/z1013_usb_v3923.fs`](../release/z1013_usb_v3923.fs). Dessen Funktionsumfang und Einschränkungen stehen in [USB_KEYBOARD.md](../docs/USB_KEYBOARD.md), die Companion-Anpassungen in [BL616_COMPANION.md](../docs/BL616_COMPANION.md). Dieser Stand wird hier weder umbenannt noch als 3921-Firmware ausgegeben. Für 3921 muss auch der passende FPGA-Stand geprüft werden; die neue Dateinamenskonvention allein schafft keine Hardware-Kompatibilität.

## Zwei Bausteine, drei unterschiedliche Dateien

| Bestandteil | Ziel und Aufgabe | Werkzeug / Startadresse |
|---|---|---|
| FPGA-Bitstream (`.fs`, alternativ `hdmi.bin`) | Gowin-FPGA: Z1013, Bild, Ton, SD und Tastaturauswertung | openFPGALoader; eigener FPGA-Konfigurationsflash |
| Sipeed Debugger-/Partner-Firmware | BL616: Programmieradapter und Secondary-Boot-Unterstützung | BL616-Programmierwerkzeug, **`0x00000`** |
| Z1013 USB-Tastatur-/Companion-Firmware | BL616: USB-Host, Tastaturereignisse per SPI zum FPGA | BL616-Programmierwerkzeug, **`0x40000`** |

```text
Tang Nano 20K
├── BL616 mit eigenem Flash
│   ├── ab 0x00000: Sipeed Debugger / Partner
│   └── ab 0x40000: Secondary Firmware (USB-Tastatur)
│       └── Tastaturereignisse per SPI zum FPGA
└── Gowin-FPGA mit separatem Konfigurationsflash
    └── Z1013-Bitstream (.fs / .bin)
```

**Die USB-Tastatur-Firmware niemals nach `0x00000` schreiben.** Dort würde sie die BL616-Debugger-Firmware überschreiben. Die Adresse `0x000000` eines FPGA-Flashbefehls bezeichnet dagegen einen anderen Speicher. Die Dateiendung `.bin` allein sagt nichts über den Zielbaustein aus: `hdmi.bin` ist kein BL616-Image.

Für Secondary Boot ist mindestens Sipeed-Debugger-Version **`2025030317`** erforderlich. Die Versionskennung lässt sich anhand der USB-Geräteinformationen gemäß [Sipeed-Anleitung](https://en.wiki.sipeed.com/hardware/en/tang/common-doc/update_debugger) prüfen. Eine ältere Partner-Firmware separat mit dem offiziellen Tang-Nano-20K-Image aktualisieren; das ist kein Bestandteil jedes FPGA-Updates.

## Normaler FPGA-Updateablauf mit openFPGALoader

1. Tastatur/Host-Hub trennen und das Board über ein USB-Datenkabel mit PC oder Mac verbinden. Der Sipeed-USB-Debugger muss verfügbar sein. **UPDATE nicht gedrückt halten**; der BL616-Downloadmodus ist hierfür falsch.
2. openFPGALoader installieren, siehe [Installations- und Projektanleitung](../docs/OPENFPGALOADER.md).
3. Im Repository-Hauptverzeichnis das Board erkennen:

   ```sh
   openFPGALoader -b tangnano20k -f --detect
   ```

4. Für den vorhandenen USB-Stand auf **3923** optional zunächst in SRAM testen:

   ```sh
   openFPGALoader -b tangnano20k release/z1013_usb_v3923.fs
   ```

5. Dauerhaft in den FPGA-Konfigurationsflash schreiben und prüfen:

   ```sh
   openFPGALoader -b tangnano20k -f --external-flash --verify --offset 0x000000 release/z1013_usb_v3923.fs
   ```

6. Erfolg und Verifikation abwarten, dann aus- und wieder einschalten. Für den bisherigen PS/2-Stand in beiden Schreibbefehlen stattdessen `release/z1013.fs` verwenden.

Dieser Ablauf verändert **keine BL616-Firmware**. Eine bereits passende Companion-Firmware bleibt bestehen. USB benötigt zusätzlich die passende BL616-Firmware und einen kompatiblen FPGA-Bitstream.

## BL616-Tastatur-Firmware erstmalig installieren oder aktualisieren

Die folgenden Schritte gelten für ein verfügbares, zur Boardrevision passendes Secondary-Image. Die beiden angekündigten Dateinamen sind noch keine Downloads.

1. Revision, Dateiherkunft, Prüfsumme und kompatiblen FPGA-Stand prüfen. Eine vollständige Sicherung des eigenen BL616-Flash samt verwendeter Werkzeugversion aufbewahren.
2. Sipeed-Debugger-Version prüfen (mindestens `2025030317`); bei nötiger Aktualisierung die offizielle Anleitung und [Recovery-Hinweise](recovery/README.md) beachten.
3. Board stromlos machen. Den mit **UPDATE** beschrifteten BL616-Taster beim Anschließen an den Rechner gedrückt halten, danach loslassen. Nicht mit den FPGA-Benutzertastern verwechseln.
4. Im von Sipeed beschriebenen Bouffalo Lab Dev Cube **BL616/618** und den neu erscheinenden Download-Port wählen.
5. Für das Secondary-Image ausdrücklich **`0x40000`** als Startadresse einstellen. Nur den benötigten Bereich löschen/schreiben, **keinen vollständigen Chip-Erase** ausführen; der Bereich `0x00000` bis `0x3FFFF` muss erhalten bleiben. Die Einstellungen anhand der Anleitung der verwendeten Werkzeugversion prüfen.
6. Schreiben abschließen und verifizieren bzw. zurücklesen. Für den vorhandenen 3923-Stand dokumentiert [`secondary_only.ini`](../release/secondary_only.ini) Datei und Adresse; sie verweist weiterhin auf `companion_z1013_v3923.bin`, nicht auf die angekündigten neuen Namen.
7. Neu starten, diesmal ohne UPDATE. Für den Tastaturbetrieb den Rechneranschluss durch den in [USB_KEYBOARD.md](../docs/USB_KEYBOARD.md) beschriebenen geeigneten, versorgten USB-C-Hub mit Tastatur ersetzen. Z1013-Eingabe, Loslassen und erneutes Anstecken prüfen; bei Problemen siehe [Recovery](recovery/README.md).

## Quellen und Prüfgrenzen

- [Sipeed: Debugger-Update](https://en.wiki.sipeed.com/hardware/en/tang/common-doc/update_debugger): Downloadmodus, BL616-Werkzeug, Flash-Adressen und Mindestversion für Secondary Boot.
- [openFPGALoader: First steps](https://trabucayre.github.io/openFPGALoader/guide/first-steps.html): SRAM- und Flash-Programmierung.
- [Vorhandener Projekt-Prüfstand](../release/USB_KEYBOARD_STATUS.json): protokollierte Prüfungen und verbleibende Hardware-Prüfung der Makros.

Diese Dokumentation ergänzt die Veröffentlichungsvorbereitung. Sie behauptet keine neuen Hardwaretests und keine Freigabe eines 3921-Images.
