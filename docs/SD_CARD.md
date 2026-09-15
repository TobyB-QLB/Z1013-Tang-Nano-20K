# FAT32-microSD und Z1013-Dateien

Die Karte benötigt eine MBR-Partitionstabelle und eine FAT32-Partition. Dateien liegen ohne Unterverzeichnisse im Wurzelverzeichnis. Kurze FAT-Namen im Format 8.3 sind am zuverlässigsten.

## 9-Byte-Kopf

Vor den eigentlichen Nutzdaten steht:

| Byte | Inhalt |
|---|---|
| 0–2 | ASCII `@DD` (`40 44 44`) |
| 3–4 | Anfangsadresse, Low-Byte zuerst |
| 5–6 | Endadresse einschließlich, Low-Byte zuerst |
| 7–8 | Startadresse, Low-Byte zuerst |
| ab 9 | Nutzdaten |

Der Z1013 zeigt den Namen aus dem FAT32-Verzeichniseintrag an. Nur `.COM`-Dateien werden nach dem Laden automatisch gestartet; andere Dateiendungen dürfen auch ohne ausführbare Startadresse verwendet werden.

## Monitorbefehle

- `@DD` – Verzeichnis anzeigen
- `@DL` – Datei laden; `.COM` wird automatisch gestartet
- `@DS ANFANG ENDE START` – Speicherbereich als Datei sichern
- `@DK` – Datei nach Sicherheitsabfrage löschen

Die Verzeichnisanzeige pausiert passend zum 32×32-Zeichenbild und kann mit Enter fortgesetzt oder mit Esc beendet werden.

