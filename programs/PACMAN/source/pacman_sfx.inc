; Deutliches zweistimmiges TA-TAA fuer ein neues Leben.
SOUND_LIFE_TABLE:
        DB      0E5h,02h, 02Ch,03h, 037h ; TA: G4 und C5
        DB      0E5h,02h, 02Ch,03h, 030h ; kurze Pause
        DB      058h,03h, 073h,03h, 03Ah ; TAA: E5 und G5
        DB      058h,03h, 073h,03h, 03Ah ; TAA halten
        DB      058h,03h, 073h,03h, 037h ; TAA ausklingen
        DB      000h,00h, 000h,00h, 000h ; Ende

; Lauter Schrei: schneller Anstieg, rauer Hoehepunkt, tiefer Abbruch.
; Jeder Schritt dauert ein FRAME_PAUSE (ungefaehr 39 ms).
SOUND_SCREAM_TABLE:
        DB      008h,02h, 024h,02h, 038h, 1 ; Anstieg 1
        DB      070h,02h, 087h,02h, 038h, 1 ; Anstieg 2
        DB      0C2h,02h, 0D4h,02h, 038h, 1 ; Anstieg 3
        DB      004h,03h, 012h,03h, 038h, 1 ; Anstieg 4
        DB      038h,03h, 043h,03h, 038h, 1 ; Anstieg 5
        DB      058h,03h, 0E8h,03h, 058h, 1 ; rauer Hoehepunkt 1
        DB      073h,03h, 0E0h,03h, 058h, 1 ; rauer Hoehepunkt 2
        DB      061h,03h, 0D4h,03h, 058h, 1 ; rauer Hoehepunkt 3
        DB      038h,03h, 02Ch,03h, 038h, 1 ; Abfall 1
        DB      004h,03h, 0F5h,02h, 038h, 1 ; Abfall 2
        DB      0B0h,02h, 09Ch,02h, 038h, 1 ; Abfall 3
        DB      03Fh,02h, 008h,02h, 038h, 1 ; Abbruch
        DB      000h,00h, 000h,00h, 000h, 0 ; Ende
