; Automatisch erzeugte 120-BPM-Tabelle.
; 035h = beide Rechteckstimmen, 055h = Stimme 1 plus Rauschen.
PACMAN_MUSIC_TABLE:
        ; Takt 1
        DB      004h,03h, 0CBh,00h, 037h, 1 ; 1.1 Bassdrum
        DB      004h,03h, 085h,01h, 034h, 5 ; Begleitung
        DB      02Ch,03h, 085h,01h, 035h, 7 ; 1.2
        DB      061h,03h, 0E8h,03h, 055h, 1 ; 1.3 Snare
        DB      061h,03h, 058h,02h, 034h, 5 ; Begleitung
        DB      082h,03h, 058h,02h, 035h, 7 ; 1.4
        DB      073h,03h, 0CBh,00h, 037h, 1 ; 1.5 Bassdrum
        DB      073h,03h, 085h,01h, 034h, 5 ; Begleitung
        DB      058h,03h, 085h,01h, 035h, 7 ; 1.6
        DB      02Ch,03h, 0E8h,03h, 055h, 1 ; 1.7 Snare
        DB      02Ch,03h, 058h,02h, 034h, 5 ; Begleitung
        DB      004h,03h, 058h,02h, 035h, 7 ; 1.8
        ; Takt 2
        DB      020h,03h, 0CBh,00h, 037h, 1 ; 2.1 Bassdrum
        DB      020h,03h, 0CAh,01h, 034h, 5 ; Begleitung
        DB      043h,03h, 0CAh,01h, 035h, 7 ; 2.2
        DB      073h,03h, 0E8h,03h, 055h, 1 ; 2.3 Snare
        DB      073h,03h, 087h,02h, 034h, 5 ; Begleitung
        DB      090h,03h, 087h,02h, 035h, 7 ; 2.4
        DB      082h,03h, 0CBh,00h, 037h, 1 ; 2.5 Bassdrum
        DB      082h,03h, 0CAh,01h, 034h, 5 ; Begleitung
        DB      073h,03h, 0CAh,01h, 035h, 7 ; 2.6
        DB      043h,03h, 0E8h,03h, 055h, 1 ; 2.7 Snare
        DB      043h,03h, 087h,02h, 034h, 5 ; Begleitung
        DB      020h,03h, 064h,01h, 035h, 7 ; 2.8 Tom
        ; Takt 3
        DB      058h,03h, 0CBh,00h, 037h, 1 ; 3.1 Bassdrum
        DB      058h,03h, 0B1h,00h, 034h, 5 ; Begleitung
        DB      073h,03h, 0B1h,00h, 035h, 7 ; 3.2
        DB      096h,03h, 0E8h,03h, 055h, 1 ; 3.3 Snare
        DB      096h,03h, 0CAh,01h, 034h, 5 ; Begleitung
        DB      073h,03h, 064h,01h, 035h, 7 ; 3.4 Tom
        DB      058h,03h, 0CBh,00h, 037h, 1 ; 3.5 Bassdrum
        DB      058h,03h, 058h,02h, 034h, 5 ; Begleitung
        DB      043h,03h, 058h,02h, 035h, 7 ; 3.6
        DB      02Ch,03h, 0E8h,03h, 055h, 1 ; 3.7 Snare
        DB      02Ch,03h, 0CAh,01h, 034h, 5 ; Begleitung
        DB      0E5h,02h, 0CAh,01h, 035h, 7 ; 3.8
        ; Takt 4
        DB      004h,03h, 0CBh,00h, 037h, 1 ; 4.1 Bassdrum
        DB      004h,03h, 010h,00h, 034h, 5 ; Begleitung
        DB      02Ch,03h, 010h,00h, 035h, 7 ; 4.2
        DB      058h,03h, 0E8h,03h, 055h, 1 ; 4.3 Snare
        DB      058h,03h, 05Fh,01h, 034h, 5 ; Begleitung
        DB      082h,03h, 05Fh,01h, 035h, 7 ; 4.4
        DB      073h,03h, 0CBh,00h, 037h, 1 ; 4.5 Bassdrum
        DB      073h,03h, 008h,02h, 034h, 5 ; Begleitung
        DB      058h,03h, 008h,02h, 035h, 7 ; 4.6
        DB      02Ch,03h, 0E8h,03h, 055h, 1 ; 4.7 Snare
        DB      02Ch,03h, 05Fh,01h, 034h, 5 ; Begleitung
        DB      004h,03h, 064h,01h, 035h, 7 ; 4.8 Tom
        ; Takt 5
        DB      004h,03h, 0CBh,00h, 037h, 1 ; 5.1 Bassdrum
        DB      004h,03h, 085h,01h, 034h, 5 ; Begleitung
        DB      02Ch,03h, 085h,01h, 035h, 7 ; 5.2
        DB      061h,03h, 0E8h,03h, 055h, 1 ; 5.3 Snare
        DB      061h,03h, 058h,02h, 034h, 5 ; Begleitung
        DB      082h,03h, 058h,02h, 035h, 7 ; 5.4
        DB      096h,03h, 0CBh,00h, 037h, 1 ; 5.5 Bassdrum
        DB      096h,03h, 085h,01h, 034h, 5 ; Begleitung
        DB      082h,03h, 0DBh,01h, 035h, 7 ; 5.6 Tom
        DB      073h,03h, 0E8h,03h, 055h, 1 ; 5.7 Snare
        DB      073h,03h, 058h,02h, 034h, 5 ; Begleitung
        DB      061h,03h, 064h,01h, 035h, 7 ; 5.8 Tom
        ; Takt 6
        DB      020h,03h, 0CBh,00h, 037h, 1 ; 6.1 Bassdrum
        DB      020h,03h, 0CAh,01h, 034h, 5 ; Begleitung
        DB      043h,03h, 0CAh,01h, 035h, 7 ; 6.2
        DB      073h,03h, 0E8h,03h, 055h, 1 ; 6.3 Snare
        DB      073h,03h, 087h,02h, 034h, 5 ; Begleitung
        DB      090h,03h, 087h,02h, 035h, 7 ; 6.4
        DB      082h,03h, 0CBh,00h, 037h, 1 ; 6.5 Bassdrum
        DB      082h,03h, 0CAh,01h, 034h, 5 ; Begleitung
        DB      073h,03h, 0DBh,01h, 035h, 7 ; 6.6 Tom
        DB      043h,03h, 0E8h,03h, 055h, 1 ; 6.7 Snare
        DB      043h,03h, 087h,02h, 034h, 5 ; Begleitung
        DB      073h,03h, 064h,01h, 035h, 7 ; 6.8 Tom
        DB      000h,00h, 000h,00h, 000h, 0 ; Schleifenende
