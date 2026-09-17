# DEMO.COM – Concept-Demo für Z1013

Veröffentlichte Datei: [DEMO.COM](DEMO.COM), unverändert aus dem letzten lokalen Stand `CONCEPT6.COM` vom 16.09.2026 (farbiger Lauftext). Kein neuer Build und keine Änderung am Programmcode.

## Auf der FAT32-Karte verwenden

1. `DEMO.COM` unverändert in das Wurzelverzeichnis der FAT32-microSD-Karte kopieren. **Keinen weiteren Dateikopf hinzufügen und nicht erneut mit dem Werkzeug @DS verpacken.**
2. Im Z1013 mit F12 den Takt 8,25 MHz wählen.
3. Mit F2 (`@DL`) laden und `DEMO.COM` als Dateinamen eingeben. Der COM-Lader startet bei `0100h`.
4. ESC pausiert/setzt fort; Reset beendet das Demo.

Benötigt den erweiterten Z1013-Stand dieses Projekts mit Vollgrafik, Farbattributen und TED-inspiriertem Sound. Der Lauftext lautet „Z1013 TED Color DEMO by (c) Tobias Bremer“; die Farben wandern mit dem Text. Farbattribute gelten für Gruppen von acht horizontalen Pixeln.

## Bereits enthaltener 9-Byte-Z1013-Dateikopf

Dieser Kopf gehört zum Z1013-Ladeformat auf der FAT32-Karte, nicht zu den FAT32-Dateisystem-Metadaten.

| Bytes | Bedeutung |
|---|---|
| `40 44 44` | Kennung `@DD` |
| `00 01` | Ladeadresse `0100h`, Little Endian |
| `57 A8` | Endadresse `A857h`, einschließlich |
| `00 01` | Startadresse `0100h`, Little Endian |

42.840 Nutzbytes + 9 Kopfbytes = **42.849 Bytes**. Downloadprüfung: [SHA256SUMS](SHA256SUMS).

## Prüfstand und Herkunft

Dateikopf, Nutzdatenidentität zur vorhandenen Rohdatei, Speichergrenzen, alle 24 Grafik-Dekompressionssegmente, 4.992 Musikereignisse samt Umlauf sowie Text- und Farbumlauf wurden mit den vorhandenen Prüfprogrammen geprüft. Der lokale Ausgangsstand vermerkt einen ausstehenden Hardwaretest; diese Veröffentlichung behauptet keinen zusätzlichen Hardwaretest.

Die Z1013-Umsetzung ist vom Amiga-Intro **3D Editor Intro** der Gruppe **Concept** (1990) inspiriert. Die Musikdaten wurden aus dessen Musik für die Z1013-Wiedergabe umgesetzt. Der [Herkunftsnachweis bei Demozoo](https://demozoo.org/productions/229393/) nennt **Zzzax** für Musik und **Performer** für Code, Grafik und Text des Amiga-Originals. Diese Credits beziehen sich auf das Original; für dessen Musik wird keine eigene Urheberschaft oder zusätzliche Lizenz beansprucht. Die Erklärung zu vollständig selbst erstellten Musikdaten der drei Spiele gilt nicht für dieses Demo.

## English

Copy `DEMO.COM` unchanged to the FAT32 card root. The required 9-byte `@DD` header is already included; do not add it again. Select 8.25 MHz with F12, load using F2 / `@DL`, and enter `DEMO.COM`. Load/start: `0100h`; inclusive end: `A857h`. ESC pauses/resumes; reset exits. This is the unchanged final local `CONCEPT6.COM` version from 2026-09-16. Automated data/player checks passed; hardware validation remains unconfirmed. Original Amiga inspiration: Concept's *3D Editor Intro* (1990), with music credited to Zzzax, as linked above.
