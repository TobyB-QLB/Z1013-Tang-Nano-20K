# Fremdkomponenten, Lizenzen und offene Rechtefragen

Dieses Projekt integriert Fremdkomponenten und historisches Binärmaterial. Ihre Urheberschaft und Lizenz bleiben vollständig erhalten. Ein öffentlich auffindbares Ursprungsrepository ersetzt keine ausdrückliche Lizenz.

## T80 Z80-kompatibler Prozessorkern

- Verzeichnis: `src/t80/`
- ursprünglicher Autor: Daniel Wallner
- Ursprung: [OpenCores T80](https://opencores.org/projects/t80/overview)
- Lizenz: BSD-artige 3-Klausel-Lizenz in den Kopfzeilen und in `src/t80/LICENSE`

Der T80-Kern ist keine Entwicklung dieses Projektautors; er wurde als unveränderter Prozessorkern integriert. Die Lizenz verlangt bei synthetisierten Formen die Wiedergabe von Copyright-Hinweis, Bedingungen und Haftungsausschluss in der Dokumentation oder in anderem Begleitmaterial. Deshalb muss `src/t80/LICENSE` auch mit Bitstream-Veröffentlichungen ausgeliefert werden.

## HDMI mit Audio

- Verzeichnis: `src/hdmi_audio/`
- Ursprung: [hdl-util/hdmi](https://github.com/hdl-util/hdmi), Copyright 2019 Sameer Puri und Mitwirkende
- Lizenzwahl für diese Distribution: MIT
- vollständige Texte: `src/hdmi_audio/LICENSE-MIT` und `src/hdmi_audio/LICENSE-APACHE`

Die Dateien `audio_clock_regeneration_packet.sv`, `packet_picker.sv` und `serializer.sv` wurden gegenüber dem Upstream-Stand angepasst. `ted_sound_core.sv` und `z1013_hdmi_audio_tx.sv` sind projektspezifische Ergänzungen. Die übrigen gleichnamigen SystemVerilog-Dateien entsprechen beim Vergleich dem Upstream-Stand `83b1c9543a91b776671a44e68e130f81cae437b7`. Der HDMI-Grundkern wird nicht als eigene Entwicklung ausgegeben.

## Sipeed-/Gowin-HDMI-Beispiel und Gowin-IP — vor Veröffentlichung zu klären

Mehrere Dateien stammen ganz oder teilweise aus dem öffentlichen Repository [sipeed/TangNano-20K-example](https://github.com/sipeed/TangNano-20K-example):

- `src/gowin_rpll/TMDS_rPLL.v`: unverändert; Copyright Gowin Semiconductor, „All rights reserved“
- `src/nano_20k_video.sdc`: unverändert
- `src/video_top.v`: projektspezifisch geändert, mit Gowin-Copyright-Kopf „All rights reserved“
- `src/hdmi.cst`: projektspezifisch geändert
- `src/gowin_rom/gowin_z1013_rom.vhd`: mit Gowin EDA erzeugte ROM-IP, Copyright Gowin Semiconductor, „All rights reserved“

Im Stamm des überprüften Sipeed-Beispielrepositorys wurde keine allgemeine Lizenz gefunden. Vor öffentlicher Weitergabe ist deshalb entweder eine einschlägige Erlaubnis aus den Gowin-/Sipeed-Lizenzbedingungen zu dokumentieren oder diese Dateien sind durch selbst geschriebene, funktional gleichwertige Dateien zu ersetzen. Die öffentliche Auffindbarkeit der Beispiele genügt dafür nicht.

## Historisches Z1013-ROM und Zeichensatz von Robotron

- Boot-ROM und Zeichengenerator stammen von Robotron aus der DDR. Die historischen Daten sind derzeit über öffentlich zugängliche Quellen im Internet frei abrufbar.
- `src/gowin_rom/z1013_boot_rom.bin` enthält wiederhergestellte historische Monitor-, `COMMAND.COM`- und weitere ROM-Inhalte von Robotron sowie projektspezifische FAT32-Erweiterungen.
- `src/gowin_rom/gowin_z1013_rom.vhd` bettet diese Daten in VHDL-Initialisierungswerte ein.
- `src/font_rom.vhd` enthält den originalen Z1013-Zeichengenerator von Robotron aus `Z1013.bin`.
- `release/hdmi.bin` und `release/hdmi.fs` enthalten diese Bestandteile in synthetisierter Form.

Öffentlich zugängliche Archivnachweise sind beispielsweise die [Z1013-Software-Datenbank](https://www.z1013.mrboot.de/software-database/db/index.html) mit dem Robotron-Monitor 2.02 sowie das [Z1013-ROM-Archiv bei Planet Emulation](https://www.planetemu.net/rom/mame-roms/z1013), das unter anderem `mon_202.bin` und `z1013font.bin` aufführt. Diese Links belegen die öffentliche Verfügbarkeit, aber nicht zwingend die Herkunft exakt der im Projekt verwendeten Binärdatei.

Die freie Zugänglichkeit im Internet belegt die Herkunft und praktische Verfügbarkeit, ist aber nicht automatisch mit einer ausdrücklichen Lizenz zur Weiterverbreitung gleichzusetzen. Eine solche Lizenz oder Freigabe ist im Repository derzeit nicht dokumentiert. Vor einer öffentlichen Distribution sollte deshalb entweder eine belastbare Quelle mit ihren Nutzungsbedingungen angegeben oder das historische Material vom Download getrennt werden.

## Programme PACMAN, KIKSTART und PUNIVERS

Copyright © Tobias Bremer.

Die Programme in `programs/PACMAN/`, `programs/KIKSTART/` und `programs/PUNIVERS/` stammen vollständig von Tobias Bremer. Dies umfasst Programmcode, Darstellung, Grafik, Sound, Leveldaten und Ausführung. Es wurden keine Programmteile, Grafiken oder Sounddaten aus den historischen Spielen übernommen. Die Programme wurden eigens für den Z1013 neu entwickelt und sind in Spielidee und Bezeichnung lediglich an historische Programme angelehnt.

Die Namen PACMAN und KIKSTART dienen der Beschreibung dieser Neuimplementierungen. Das Projekt ist nicht mit den ursprünglichen Rechteinhabern verbunden und wird von ihnen nicht unterstützt. Der Lizenzstatus dieser Eigenentwicklungen richtet sich nach `LICENSE.md`; weitere Angaben stehen in `programs/README.md`.

## Projektspezifische Werkzeuge und Firmware

Die FAT32-Firmware, die Z1013-Integration, der Klangkern und `tools/at-ds/` besitzen derzeit nur den eingeschränkten Lizenzstatus aus `LICENSE.md`. Die beiden vorkompilierten `@DS`-Programme wurden gegen die dortigen Prüfsummen kontrolliert; die Reproduzierbarkeit aus `tools/at-ds/src/at_ds.c` sollte vor einem Release zusätzlich auf beiden Zielplattformen dokumentiert werden.
