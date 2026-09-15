# Hardwareanschlüsse

## PS/2-Tastatur

Die Tastatur wird nur empfangen; der FPGA sendet keine Befehle an sie.

| PS/2-Signal | Tang Nano 20K | FPGA-Pin |
|---|---|---|
| DATA | J5.6 | 41 |
| CLOCK | J5.5 | 42 |
| +5 V | 5-V-Anschluss | – |
| GND | GND | – |

PS/2 arbeitet mit 5 V, die FPGA-Eingänge mit 3,3 V. CLOCK und DATA dürfen deshalb nicht direkt angeschlossen werden. Je Signal genügt für diesen reinen Empfangsbetrieb ein passiver Spannungsteiler, beispielsweise 3,3 kOhm von der Tastaturleitung zum FPGA-Eingang und 6,8 kOhm vom FPGA-Eingang nach GND. Tastatur und Board müssen eine gemeinsame Masse haben.

## microSD

Der eingebaute Steckplatz wird im SPI-Modus verwendet:

| microSD | FPGA-Pin |
|---|---|
| DAT3 / CS | 81 |
| CMD / MOSI | 82 |
| CLK | 83 |
| DAT0 / MISO | 84 |

Die vollständige Belegung einschließlich HDMI, Tasten und LEDs steht in `src/hdmi.cst`.

