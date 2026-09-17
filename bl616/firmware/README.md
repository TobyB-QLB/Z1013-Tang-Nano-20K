# BL616-Firmware für Nachbauer

| Boardrevision | Datei | BL616-Adresse | Status |
|---|---|---|---|
| 3921, Partner-kompatibel | [z1013-usb-keyboard-3921.bin](z1013-usb-keyboard-3921.bin) | `0x40000` | **Experimentell: gebaut und statisch geprüft, Hardwaretest ausstehend** |
| 3923 | `z1013-usb-keyboard-3923.bin` | `0x40000` | Neuer Name weiterhin als kommendes Release-Artefakt vorgesehen |

Die 3921-Datei ist ein echter Build mit Ziel `nano20k`, kein umbenanntes 3923-Image. Sie ist noch keine auf Hardware freigegebene Nachbauversion. Prüfsumme: [SHA256SUMS](SHA256SUMS); genaue Build-Daten: [BUILD_STATUS_3921.json](BUILD_STATUS_3921.json); [Quellpatch und Build-Anleitung](../source/README.md).

**Nicht jedes 3921-Board unterstützt Secondary Boot.** Dieses Image setzt eine funktionierende Sipeed-Partner-Firmware ab Version `2025030317` voraus. Ältere 3921-Boards ohne passende werkseitige Verschlüsselung können die verschlüsselte Partner-Firmware nicht starten. Die Platinenaufschrift allein unterscheidet diese Varianten nicht. Für solche Boards ist dieses Paket nicht geeignet. Es enthält kein Primary-Ersatzimage; nicht nach `0x00000` schreiben und keine eFuses ändern. Siehe [Upstream-Boardvarianten](https://github.com/MiSTle-Dev/.github/wiki/Versions_TangNano20k).

Der vorhandene 3923-Stand bleibt unter [release/companion_z1013_v3923.bin](../../release/companion_z1013_v3923.bin) verfügbar. Er ist kein 3921-Image. Die vorhandene [secondary_only.ini](../../release/secondary_only.ini) verwendet weiterhin den 3923-Dateinamen und darf nicht unverändert für die 3921-Datei übernommen werden.

Für den 3921-Test ist zusätzlich ein kompatibler USB-fähiger Z1013-FPGA-Bitstream nötig. Der vorhandene [z1013_usb_v3923.fs](../../release/z1013_usb_v3923.fs) ist der bisherige 3923-Prüfstand; seine Verwendung zusammen mit dieser Firmware auf 3921 muss auf Hardware verifiziert werden. Hier wird weder ein neuer FPGA-Bitstream noch eine behauptete 3921-FPGA-Freigabe ausgeliefert.

Die 3921-BIN nur als Secondary-Image ab `0x40000` programmieren, den Primary-Bereich erhalten und den Download gegen die Prüfsumme kontrollieren. Weitere Schritte in der [Installationsanleitung](../README.md) und unter [Recovery](../recovery/README.md).

## English

The 3921 binary is a real `nano20k` build, **experimental and not hardware-tested**. It requires a 3921 board that already supports the encrypted Sipeed Partner firmware (version `2025030317` or later). Some older 3921 boards do not. Flash this secondary image only at `0x40000`; never at `0x00000`. A compatible USB-enabled FPGA bitstream and physical validation are still required. The existing 3923 binary remains available under its original name linked above.
