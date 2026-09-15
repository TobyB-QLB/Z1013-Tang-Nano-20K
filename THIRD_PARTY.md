# Fremdkomponenten und Danksagung

Dieses Projekt integriert Fremdkomponenten. Ihre Urheberschaft und Lizenz bleiben vollständig erhalten.

## T80 Z80-kompatibler Prozessorkern

- Verzeichnis: `src/t80/`
- ursprünglicher Autor: Daniel Wallner
- öffentlich verbreitet unter anderem über OpenCores
- Lizenz: BSD-artige Lizenz in den Kopfzeilen der T80-Quelldateien

Der T80-Kern ist keine Entwicklung dieses Projektautors; er wurde als unveränderter Prozessorkern integriert.

## HDMI mit Audio

- Verzeichnis: `src/hdmi_audio/`
- Ursprung: hdl-util/hdmi, Copyright 2019 Sameer Puri und Mitwirkende
- Lizenz: wahlweise MIT oder Apache License 2.0
- vollständige Texte: `src/hdmi_audio/LICENSE-MIT` und `src/hdmi_audio/LICENSE-APACHE`

Die projektbezogene Anbindung, Bildlogik und Audio-Peripherie liegen um diese Komponente herum; der HDMI-Grundkern wird nicht als eigene Entwicklung ausgegeben.

## Gowin Semiconductor

Das Projekt enthält für den Tang Nano 20K erzeugte Gowin-IP und Projektdateien, darunter die TMDS-PLL. In den betreffenden Dateien gelten die jeweiligen Hinweise von Gowin Semiconductor.

## Historische Software und Namen

Boot-ROM, Zeichensatz und mitgelieferte Demonstrationsprogramme können historische Bestandteile, Nachbildungen oder von klassischen Spielen inspirierte Namen und Konzepte enthalten. Die Namen PACMAN und KIKSTART werden hier ausschließlich zur Identifikation der mit diesem privaten Entwicklungsstand getesteten Dateien verwendet. Dieses Projekt ist nicht mit den ursprünglichen Rechteinhabern verbunden oder von ihnen unterstützt.

