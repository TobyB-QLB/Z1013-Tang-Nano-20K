# Z1013 FAT-@DS V1.0

Das Werkzeug erzeugt aus einer rohen Z1013-Binärdatei eine FAT-Datei mit dem 9-Byte-Z1013-Kopf. Die Quelldatei muss im selben Ordner wie `@DS` beziehungsweise `@DS.exe` liegen.

## macOS

```text
./@DS 100 2000 103
Datei Name > TEST.COM
Ziel Ordner > /Volumes/SDKARTE
```

Der Zielordner kann als vierter Parameter angegeben werden:

```text
./@DS 100 2000 103 /Volumes/SDKARTE
```

## Windows

```text
@DS.exe 100 2000 103
Datei Name > TEST.COM
Ziel Ordner > E:\
```

In PowerShell wird `./@DS.exe` beziehungsweise `.\@DS.exe` verwendet.

Alle Adressen sind hexadezimal. Die Endadresse gehört zum Bereich; die Quelldatei muss deshalb genau `ENDE - ANFANG + 1` Byte groß sein. Der Name muss das FAT-Format 8.3 erfüllen. Der portable Quelltext liegt in `src/at_ds.c`.

