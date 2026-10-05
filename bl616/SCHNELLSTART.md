# Schnellstart: Tang Nano 20K v3923 mit BL616 und USB-Tastatur

Stand: 05.10.2026 · Befehle für macOS und das Terminal

Diese Anleitung installiert die USB-Version für das Tang Nano 20K **v3923** und beschreibt spätere FPGA-Updates bei bereits installiertem USB-Host. Der Ablauf wurde am 05.10.2026 am Mac erfolgreich durchgeführt: F3-Bitstream geschrieben und verifiziert, BL616 vollständig wiederhergestellt, USB-Tastatur und DOS.COM-Start per F3 anschließend vom Nutzer bestätigt.

Der veröffentlichte [USB-Bitstream mit F3/DOS-Unterstützung](../release/z1013_usb_v3923.fs) wurde von **[Denny (OE4DEA)](https://github.com/OE4DEA)** mit Gowin V1.9.12.04 aus Commit `4eda812087e03296a27be9ea01363c4e4dd3c907` gebaut und auf Tang Nano 20K v3923 getestet: USB-Tastatur, F1/F2/F3 und F9 bis F12, zuerst in SRAM und danach dauerhaft im externen Flash. Beitrag: [PR #2](https://github.com/TobyB-QLB/Z1013-Tang-Nano-20K/pull/2).

Für einen eigenen Build dessen Pfad unten als `BITSTREAM` einsetzen. openFPGALoader überträgt fertige Bitstreams; Gowin EDA erzeugt sie. Die bekannten T80-Timing-Hinweise bleiben bestehen.

Während eines Schreibvorgangs weder Stromversorgung noch USB-Verbindung trennen. Bei einer Fehlermeldung abbrechen und Ursache prüfen.

## Vorbereitung

Die folgenden Variablen an die eigenen Verzeichnisse anpassen:

```sh
REPO="/Pfad/zu/Z1013-Tang-Nano-20K"
BLFLASH="/Pfad/zu/BLFlashCommand-macos"
OPENFPGALOADER="/Pfad/zu/openFPGALoader"
BACKUP_DIR="$HOME/Documents/VHDL"
BITSTREAM="$REPO/release/z1013_usb_v3923.fs"
# Für einen neuen Build den vollständigen Pfad zur neuen .fs-Datei einsetzen.
```

Die Befehle im selben Terminal ausführen, damit die Variablen erhalten bleiben. `BLFLASH` und `OPENFPGALOADER` müssen vollständige Pfade sein. Für die Rückprüfung wird `python3` benötigt. BLFlashCommand-macos kann auf Apple Silicon Rosetta benötigen. Seine zugehörigen Werkzeugdateien, insbesondere `chips/`, müssen vorhanden sein.

FPGA-Konfigurationsflash und BL616-Flash sind getrennte Speicher. Ein FPGA-Update überschreibt keine BL616-Firmware. Der BL616 muss jedoch als Programmieradapter starten, damit das FPGA erreichbar ist.

## 1. BL616-Firmware für die USB-Tastatur

Wenn die passende Z1013-Companion-Firmware bereits installiert ist, kann dieser Abschnitt übersprungen werden.

### Downloadmodus und Port

1. Tang Nano 20K abziehen.
2. Den mit **UPDATE** beschrifteten BL616-Taster gedrückt halten.
3. Das Board direkt per USB-Datenkabel mit dem Mac verbinden.
4. UPDATE loslassen. Nicht den FPGA-Benutzertaster verwenden.
5. Den neu erschienenen Bootloader-Port anzeigen:

   ```sh
   ls /dev/cu.usbmodem*
   ```

Den zum Tang gehörenden Port einsetzen. `/dev/cu.usbmodem3101` ist nur ein Beispiel. Keine `usbserial`-Schnittstelle wählen.

```sh
BL616_PORT="/dev/cu.usbmodem3101"
```

### Vollständige Sicherung

Vor dem ersten Schreiben auf einem Board den kompletten 4-MiB-BL616-Flash sichern:

```sh
mkdir -p "$BACKUP_DIR"
"$BLFLASH" \
  --interface=uart \
  --baudrate=2000000 \
  --port="$BL616_PORT" \
  --chipname=bl616 \
  --flash --read \
  --start=0x0 \
  --len=0x400000 \
  --file="$BACKUP_DIR/BL616_Backup_$(date +%Y%m%d_%H%M%S).bin"
```

Nur nach erfolgreicher Sicherung fortfahren. Antwortet der Bootloader nicht mehr, das Board erneut mit gedrücktem UPDATE-Taster anschließen und den Port kontrollieren.

### Companion-Firmware schreiben

Die Repository-Konfiguration schreibt ausschließlich die Companion-Firmware ab Adresse `0x40000`. Dazu in das Release-Verzeichnis wechseln, damit `secondary_only.ini` die nebenliegende Datei `companion_z1013_v3923.bin` findet:

```sh
cd "$REPO/release"
"$BLFLASH" \
  --interface=uart \
  --baudrate=2000000 \
  --port="$BL616_PORT" \
  --chipname=bl616 \
  --cpu_id= \
  --config="secondary_only.ini"
```

**Kein `--whole_chip` verwenden.** Der ursprüngliche BL616-Bereich unterhalb `0x40000` muss erhalten bleiben. Erfolgreiche Programmierung und SHA-Prüfung im Protokoll abwarten. Danach das Board abziehen und ohne UPDATE wieder verbinden.

SHA-256 der vorgesehenen v3923-Companion-Firmware:

```text
79c05c7b2260a70897cba16da0e03695e2c12516dc461178006604ca7f1f8441  companion_z1013_v3923.bin
```

## 2. FPGA-Bitstream mit USB-Tastatur

Das Tang Nano 20K normal und ohne UPDATE-Taster mit dem Mac verbinden. Gowin Programmer schließen, damit nur ein Programm auf den Adapter zugreift.

Tastatur und Host-Hub vorher abziehen; ein USB-Datenkabel direkt zum Mac verwenden. Zuerst Adapter und FPGA erkennen:

```sh
"$OPENFPGALOADER" --scan-usb
"$OPENFPGALOADER" -b tangnano20k --detect
```

Erwartet werden `SIPEED USB Debugger` / FTDI2232 (USB-ID `0403:6010`) und das FPGA `GW2A(R)-18(C)`. Bei `No USB devices found`, `device not found` oder `JTAG init failed` zuerst Kabel und Anschluss prüfen. Funktioniert nur der UPDATE-Modus, mit **Abschnitt 3** fortfahren.

Nur wenn das passende FPGA erkannt wurde, den ausgewählten Bitstream dauerhaft schreiben und prüfen:

```sh
"$OPENFPGALOADER" \
  -b tangnano20k \
  -f --external-flash --verify \
  --offset 0x000000 \
  "$BITSTREAM"
```

SHA-256 des derzeit veröffentlichten USB-Bitstreams:

```text
676545961a05d6fdcdf27b33f1a96df643bdd4cb425922d05cdc95f4870d9626  z1013_usb_v3923.fs
```

Nach erfolgreichem Schreiben **und** erfolgreicher Verifikation mit Abschnitt 4 fortfahren. Falls der USB-Host vorübergehend deaktiviert wurde, zuerst Abschnitt 3 bis zur Wiederherstellung vollständig abschließen.

## 3. Wenn der USB-Host den Programmieradapter blockiert

**Symptom:** Normal am Mac angeschlossen erscheint kein Programmieradapter. Mit gedrücktem UPDATE erscheint dagegen ein `/dev/cu.usbmodem…`-Port. Auf dem getesteten Board startete die Zusatzfirmware weiterhin als USB-Host. Ihre Bytes waren korrekt; die originale BL616-Software musste nicht ersetzt werden.

Der bewährte Ablauf ist: **sichern → nur den Host-Startsektor deaktivieren → FPGA flashen → Host-Startsektor wiederherstellen → vollständig vergleichen**. Bis zur Wiederherstellung ist die USB-Tastatur deaktiviert. Die originale BL616-Software unter `0x40000` bleibt erhalten. Dieses Verfahren gilt für den hier beschriebenen v3923-Stand mit Companion ab `0x40000`.

### 3.1 UPDATE-Modus und aktuelle Sicherung

Board vollständig stromlos machen, UPDATE beim Anschließen gedrückt halten, dann loslassen. Port wie in Abschnitt 1 prüfen und `BL616_PORT` gegebenenfalls neu setzen. Der folgende Lesevorgang muss erfolgreich sein.

Für jedes Update einen neuen Sicherungsordner erstellen:

```sh
mkdir -p "$BACKUP_DIR"
UPDATE_DIR="$(mktemp -d "$BACKUP_DIR/BL616_FPGA_Update_XXXXXX")"
export UPDATE_DIR
cd "$(dirname "$BLFLASH")"

"$BLFLASH" --interface=uart --baudrate=2000000 \
  --port="$BL616_PORT" --chipname=bl616 \
  --flash --read --start=0x0 --len=0x400000 \
  --file="$UPDATE_DIR/before_4MiB.bin"
```

Nur nach erfolgreichem Auslesen fortfahren. Sicherung auf 4 MiB prüfen und den exakt zu diesem Board gehörenden Startsektor samt Wiederherstellungskonfiguration erzeugen:

```sh
python3 - <<'PY'
import os
from pathlib import Path
p = Path(os.environ["UPDATE_DIR"])
backup = (p / "before_4MiB.bin").read_bytes()
assert len(backup) == 0x400000, "Sicherung unvollständig: STOPP"
header = backup[0x40000:0x41000]
assert header != b"\xff" * 4096, "Host-Startsektor bereits leer: STOPP"
(p / "host_header.bin").write_bytes(header)
(p / "restore_header.ini").write_text(
    "[cfg]\nerase = 1\nskip_mode = 0x0, 0x0\nboot2_isp_mode = 0\n"
    "pre_program =\npre_program_args =\n\n[custom]\nfiledir = "
    + str((p / "host_header.bin").resolve()) + "\naddress = 0x40000\n"
)
print("Sicherung geprüft; Wiederherstellung vorbereitet:", p)
PY
```

Den ausgegebenen Ordnerpfad aufbewahren. Nach einem Terminal-Neustart `UPDATE_DIR` erneut auf **diesen Ordner** setzen und exportieren; keinen neuen leeren Ordner verwenden.

### 3.2 Nur den Host-Startsektor deaktivieren und prüfen

Ausschließlich die 4096 Bytes von `0x40000` bis einschließlich `0x40fff` löschen. **Kein Gesamtlöschen und keine Änderung an eFuses oder am Primary-Bereich.**

```sh
"$BLFLASH" --interface=uart --baudrate=2000000 \
  --port="$BL616_PORT" --chipname=bl616 \
  --flash --erase --start=0x40000 --end=0x40fff

"$BLFLASH" --interface=uart --baudrate=2000000 \
  --port="$BL616_PORT" --chipname=bl616 \
  --flash --read --start=0x0 --len=0x400000 \
  --file="$UPDATE_DIR/disabled_4MiB.bin"

python3 - <<'PY'
import os
from pathlib import Path
p = Path(os.environ["UPDATE_DIR"])
a = (p / "before_4MiB.bin").read_bytes()
b = (p / "disabled_4MiB.bin").read_bytes()
assert len(a) == len(b) == 0x400000
assert a[:0x40000] == b[:0x40000], "Primary verändert: STOPP"
assert b[0x40000:0x41000] == b"\xff" * 4096, "Startsektor nicht leer: STOPP"
assert a[0x41000:] == b[0x41000:], "Weitere Bereiche verändert: STOPP"
print("OK: Nur der Host-Startsektor wurde gelöscht.")
PY
```

Bei einem Fehler nicht mit dem FPGA-Update fortfahren. Die gesicherte Wiederherstellung aus Abschnitt 3.4 bleibt erforderlich, falls der Startsektor schon gelöscht wurde.

### 3.3 Normal starten und FPGA flashen

Tang abziehen, kurz warten und **ohne UPDATE** direkt am Mac anschließen. Abschnitt 2 erneut ausführen: Adapter erkennen, FPGA erkennen, `BITSTREAM` schreiben und verifizieren. Beim bestätigten Versuch erschien der Sipeed-Debugger nach dieser Deaktivierung wieder.

Bleibt er unsichtbar oder scheitert das FPGA-Update, zuerst den gesicherten Host-Startsektor wie unten wiederherstellen. Keine andere BL616-Firmware auf Verdacht installieren.

### 3.4 USB-Host wiederherstellen – auch nach einem fehlgeschlagenen FPGA-Update

Tang wieder abziehen und **mit gedrücktem UPDATE** am Mac anschließen. UPDATE loslassen, Bootloader-Port erneut prüfen und `BL616_PORT` gegebenenfalls korrigieren.

```sh
cd "$(dirname "$BLFLASH")"
"$BLFLASH" --interface=uart --baudrate=2000000 \
  --port="$BL616_PORT" --chipname=bl616 \
  --config="$UPDATE_DIR/restore_header.ini"
```

`Verification succeeded` und `Flash writing succeeded` abwarten. Danach den vollständigen BL616 zurücklesen und bytegenau mit der Sicherung vergleichen:

```sh
"$BLFLASH" --interface=uart --baudrate=2000000 \
  --port="$BL616_PORT" --chipname=bl616 \
  --flash --read --start=0x0 --len=0x400000 \
  --file="$UPDATE_DIR/restored_4MiB.bin"

python3 - <<'PY'
import os
from pathlib import Path
p = Path(os.environ["UPDATE_DIR"])
a = (p / "before_4MiB.bin").read_bytes()
b = (p / "restored_4MiB.bin").read_bytes()
assert len(a) == len(b) == 0x400000
assert a == b, "BL616 stimmt nicht mit der Sicherung überein: STOPP"
print("OK: Gesamter BL616 wiederhergestellt; USB-Host und Primary unverändert.")
PY
```

Erst nach dieser Erfolgsmeldung ist die Wiederherstellung abgeschlossen. Sicherungsordner behalten. Der FPGA-Bitstream liegt in einem anderen Flash und bleibt beim Wiederherstellen des BL616 erhalten.

## 4. Starten und Funktionstasten testen

Tang stromlos machen. SD-Karte und HDMI anschließen, dann über den geeigneten, versorgten USB-C-Hub mit Tastatur **ohne UPDATE** starten.

- F1: `@DD` und Enter – Verzeichnis anzeigen.
- F2: `@DL` und Enter – Datei laden.
- F3: `@DL` und Enter, 520 ms Pause, `DOS.COM` und Enter – DOS laden und starten. Im eingabebereiten Monitor auslösen; `DOS.COM` muss im FAT32-Wurzelverzeichnis liegen und einen gültigen Z1013-Dateikopf besitzen.
- F9 bis F12: CPU-Geschwindigkeit.

Auf dem v3923-Testgerät wurde am 05.10.2026 der neue F3-Build erfolgreich geflasht und verifiziert. Nach Wiederherstellung war der gesamte 4-MiB-BL616-Flash bytegleich zur Sicherung. Der Nutzer bestätigte anschließend den einwandfreien Betrieb einschließlich F3. Dies ist ein Hardwaretest dieses Aufbaus, keine allgemeine Timingfreigabe oder Bestätigung aller Boardrevisionen.

## Weitere Informationen

- [Ausführliche BL616-Anleitung](README.md)
- [USB-Tastatur und Einschränkungen](../docs/USB_KEYBOARD.md)
- [BL616-Companion-Anpassungen](../docs/BL616_COMPANION.md)
- [openFPGALoader-Anleitung](../docs/OPENFPGALOADER.md)
- [Wiederherstellung](recovery/README.md)
