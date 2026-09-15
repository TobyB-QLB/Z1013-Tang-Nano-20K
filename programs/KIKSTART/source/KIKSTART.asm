; -----------------------------------------------------------------------------
; KIKSTART.COM - farbiges Trial-Spiel fuer Z1013 HDMI FULL8K COLOR
; Copyright (c) Tobias Bremer.
; Eigenentwicklung fuer den Z1013; keine historischen Programmteile oder Assets.
; STUFE 9: freie Pixel-Sprinter-Adaption mit 140-BPM-TED-Schlagzeug
;
; Start: 0100h, Vollgrafik: OUT 18h, VRAM B000h-CFFFh
; Steuerung: Cursor links/rechts = bremsen/beschleunigen
;             Cursor hoch        = springen
;             Cursor runter      = Wheelie
;             ESC                = neues Spiel
;
; Diese SOUND-Fassung steuert den im FPGA nachgebildeten Audio-Teil des
; MOS 7360/8360 TED ueber die Z1013-I/O-Ports 30h..34h. Motordrehzahl,
; Sprung, Sturz und Ziel besitzen getrennte, programmgesteuerte Klaenge.
;
; Die Strecke scrollt byteweise. Da oberhalb von Pixelzeile 136 nur schwarzer
; Himmel liegt, werden pro Schritt lediglich 88*31 Byte je Speicherbank
; verschoben. Danach zeichnet der Z80 nur eine neue 8-Pixel-Spalte.
; -----------------------------------------------------------------------------

        ORG     0100h

VRAM            EQU     0B000h
STATUS_VRAM     EQU     0B000h
PLAY_VRAM       EQU     0B400h
STATUS_BOTTOM   EQU     0CC00h
PLAY_ROWS       EQU     192
SCROLL_VRAM     EQU     0C100h       ; y=136: oberhalb liegen nur schwarze Pixel
SCROLL_ROWS     EQU     88           ; y=136..223 statt aller 192 Spielfeldzeilen
; Wie in der Plus/4-Vorlage liegt das 24 Pixel breite Motorrad nahezu mittig.
; Die Spritekante bleibt bytegenau ausgerichtet; Mittelpunkt: Pixel 124.
BIKE_X          EQU     112
BIKE_COLUMN     EQU     16          ; Vorderrad / rechte Sprite-Spalte
BIKE_REAR_COLUMN EQU    14          ; Hinterrad / linke Sprite-Spalte
COURSE_COUNT    EQU     10
SKY_CLOUD1_Y    EQU     48
SKY_CLOUD2_Y    EQU     72
SKY_BALLOON_Y0  EQU     92
SKY_LIGHTNING_Y EQU     56
SKY_CLOUD_ROWS  EQU     8
SKY_BALLOON_ROWS EQU    16
SKY_LIGHTNING_ROWS EQU  128

KEY_LEFT        EQU     0
KEY_RIGHT       EQU     1
KEY_UP          EQU     2
KEY_DOWN        EQU     3
KEY_ESC         EQU     4

T_FLAT          EQU     0
T_GAP           EQU     1
T_UP            EQU     2
T_HIGH          EQU     3
T_DOWN          EQU     4
T_HEDGE         EQU     5
T_BUS           EQU     6
T_SPRING        EQU     7
T_ROUGH         EQU     8
T_FINISH        EQU     9
T_FINISH_END    EQU     10
T_CROSS         EQU     11              ; Plus/4-Kreuz, zwei Byte-Spalten
T_GATE          EQU     12              ; Tor/Telefonzelle, drei Spalten
T_TYRES         EQU     13              ; zweireihiger Reifenstapel, vier Spalten
T_BRICK         EQU     14              ; hohe Ziegelmauer, vier Spalten

PORT_TED_V1_LO  EQU     030h
PORT_TED_V2_LO  EQU     031h
PORT_TED_V2_HI  EQU     032h
PORT_TED_CTRL   EQU     033h
PORT_TED_V1_HI  EQU     034h

START:
        DI
        CALL    SOUND_SILENCE
        XOR     A
        OUT     (2Ch),A             ; Farbausgabe waehrend Bildaufbau aus
        OUT     (20h),A             ; normaler Pixel-VRAM fuer die CPU
        OUT     (18h),A
        LD      HL,BILD_INTRO
        CALL    VOLLBILD_KOPIEREN
        CALL    FARB_INTRO_AUFBAUEN
        CALL    SOUND_TITLE_WAIT_ESC

NEUES_SPIEL:
        CALL    SOUND_SILENCE
        LD      A,5
        LD      (BIKES),A
        XOR     A
        LD      (COURSE),A
        LD      HL,0
        LD      (SCORE),HL
        CALL    NEUE_STRECKE

HAUPTSCHLEIFE:
        CALL    FRAME_PAUSE
        CALL    SOUND_SERVICE
        CALL    TASTATUR_LESEN
        LD      A,(KEYS)
        BIT     KEY_ESC,A
        JP      NZ,NEUES_SPIEL
        ; Das Motorrad bleibt waehrend Pause und Tastaturabfrage sichtbar.
        ; Vor einer Zustandsaenderung muss noch exakt das alte Sprite geloescht
        ; werden; danach folgen Steuerung, Physik und der optimierte Bildlauf.
        CALL    BIKE_LOESCHEN
        CALL    HIMMEL_SERVICE
        CALL    STEUERUNG
        CALL    PHYSIK
        CALL    SCROLL_SERVICE
        CALL    STRECKE_PRUEFEN
        JP      C,STURZ
        LD      A,(COURSE_DONE)
        OR      A
        JP      NZ,STRECKE_GESCHAFFT
        CALL    ZEIT_AKTUALISIEREN
        JP      C,STURZ
        CALL    BIKE_ZEICHNEN
        JP      HAUPTSCHLEIFE

STURZ:
        LD      A,(LIGHTNING_HIT)
        OR      A
        CALL    Z,SOUND_CRASH_START
        CALL    NZ,SOUND_LIGHTNING_CRASH_START
        CALL    EXPLOSION_ABSPIELEN
        CALL    SOUND_CRASH_END
        LD      A,(BIKES)
        DEC     A
        LD      (BIKES),A
        CALL    STATUS_AKTUALISIEREN
        LD      A,(BIKES)
        OR      A
        JP      Z,SPIEL_ENDE
        CALL    STRECKE_LADEN          ; gleiche Strecke von vorn
        JP      HAUPTSCHLEIFE

STRECKE_GESCHAFFT:
        ; Die Hauptschleife hat das alte Sprite vor der letzten Bewegung
        ; geloescht. Fuer die Auswertung wird das Motorrad wieder sichtbar
        ; zwischen die beiden Zielmarken gestellt.
        CALL    BIKE_ZEICHNEN
        CALL    ZIELAUSWERTUNG
        CALL    SOUND_COURSE_MELODY
        LD      A,(COURSE)
        INC     A
        CP      COURSE_COUNT
        JP      Z,SPIEL_GEWONNEN
        LD      (COURSE),A
        LD      A,(BIKES)
        CP      5
        JR      NC,.KEIN_EXTRA
        INC     A
        LD      (BIKES),A
.KEIN_EXTRA:
        CALL    NAECHSTER_KURS_ANZEIGEN
        CALL    NEUE_STRECKE
        JP      HAUPTSCHLEIFE

SPIEL_ENDE:
        LD      HL,BILD_GAME_OVER
        CALL    VOLLBILD_KOPIEREN
        LD      A,0Ch               ; GAME OVER in Hellrot
        CALL    FARBBILD_FUELLEN
        CALL    SOUND_TITLE_WAIT_ESC
        JP      NEUES_SPIEL

SPIEL_GEWONNEN:
        LD      HL,BILD_WINNER
        CALL    VOLLBILD_KOPIEREN
        LD      A,0Ah               ; Gewinnerbild in Hellgruen
        CALL    FARBBILD_FUELLEN
        CALL    SOUND_TITLE_WAIT_ESC
        JP      NEUES_SPIEL

AUF_ESC_NEUSTART:
        CALL    AUF_ESC_DRUCK_WARTEN
        JP      NEUES_SPIEL

AUF_ESC_DRUCK_WARTEN:
        LD      A,8
        OUT     (08h),A
        IN      A,(04h)
        BIT     1,A
        JR      Z,AUF_ESC_DRUCK_WARTEN
.LOSLASSEN:
        LD      A,8
        OUT     (08h),A
        IN      A,(04h)
        BIT     1,A
        JR      NZ,.LOSLASSEN
        RET

VOLLBILD_KOPIEREN:
        LD      DE,VRAM
        LD      BC,02000h
        LDIR
        RET

; -----------------------------------------------------------------------------
; Neue Strecke und Streckengenerator
; -----------------------------------------------------------------------------

NEUE_STRECKE:
        LD      A,60
        LD      (TIME_LEFT),A
STRECKE_LADEN:
        XOR     A
        OUT     (2Ch),A             ; Strecke unsichtbar und rueckstandsfrei bauen
        OUT     (20h),A
        CALL    SPIELFELD_LOESCHEN
        LD      HL,STATUS_BILD
        LD      DE,STATUS_VRAM
        LD      BC,0400h
        LDIR
        LD      HL,STATUS_UNTEN_BILD
        LD      DE,STATUS_BOTTOM
        LD      BC,0400h
        LDIR
        CALL    FARBSPEICHER_LOESCHEN
        CALL    GENERATOR_RESET
        LD      B,0
.SPALTEN:
        PUSH    BC
        CALL    NEUE_SPALTE
        POP     BC
        CALL    SPALTE_SPEICHERN
        CALL    SPALTE_ZEICHNEN
        CALL    SPALTE_FARBE_ZEICHNEN
        INC     B
        LD      A,B
        CP      32
        JR      NZ,.SPALTEN

        XOR     A
        LD      (SPEED),A
        LD      (SCROLL_TIMER),A
        LD      (FRAME_COUNT),A
        LD      (KEY_LOCK),A
        LD      (JUMP_LOCK),A
        LD      (WHEELIE),A
        LD      (AUTO_RAMP),A
        LD      (VY),A
        LD      (COURSE_DONE),A
        LD      (FINISH_ROLLING),A
        LD      (FINISH_BRAKE_TIMER),A
        LD      (SFX_TIMER),A
        LD      (ENGINE_PHASE),A
        LD      (ENGINE_RPM_STEP),A
        LD      A,1
        LD      (ON_GROUND),A
        CALL    FAHRER_AUF_BODEN
        CALL    FARBSTATUS_AUFBAUEN
        CALL    STATUS_AKTUALISIEREN
        CALL    HIMMEL_RESET
        XOR     A
        OUT     (20h),A
        OUT     (28h),A             ; Farbausgabe erst nach komplettem Aufbau
        CALL    BIKE_ZEICHNEN
        CALL    SOUND_ENGINE_START
        RET

SPIELFELD_LOESCHEN:
        LD      HL,PLAY_VRAM
        LD      DE,PLAY_VRAM+1
        LD      BC,017FFh
        XOR     A
        LD      (HL),A
        LDIR
        RET

GENERATOR_RESET:
        LD      A,(COURSE)
        ADD     A,A
        LD      E,A
        LD      D,0
        LD      HL,COURSE_POINTERS
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        LD      (COURSE_PTR),HL
        XOR     A
        LD      (SEG_REMAIN),A
        LD      (SEG_PHASE),A
        RET

; Ergebnis: A=Hoehe in 8-Pixel-Zeilen (FF=Luecke), C=Typ.
NEUE_SPALTE:
        LD      A,(SEG_REMAIN)
        OR      A
        JR      NZ,.DATEN_OK
        LD      HL,(COURSE_PTR)
        LD      A,(HL)
        OR      A
        JR      NZ,.NEUES_SEGMENT
        LD      A,80                  ; nach Tabellenende sicherer Auslauf
        LD      (SEG_REMAIN),A
        XOR     A
        LD      (SEG_TYPE),A
        LD      (SEG_PHASE),A
        JR      .DATEN_OK
.NEUES_SEGMENT:
        LD      (SEG_REMAIN),A
        INC     HL
        LD      A,(HL)
        LD      (SEG_TYPE),A
        INC     HL
        LD      (COURSE_PTR),HL
        XOR     A
        LD      (SEG_PHASE),A
.DATEN_OK:
        LD      A,(SEG_PHASE)
        LD      (NEW_PHASE),A
        LD      C,A
        LD      A,(SEG_TYPE)
        CP      T_GAP
        JR      Z,.GAP
        CP      T_UP
        JR      Z,.UP
        CP      T_HIGH
        JR      Z,.HIGH
        CP      T_DOWN
        JR      Z,.DOWN
        LD      A,23
        JR      .ERGEBNIS
.GAP:
        LD      A,0FFh
        JR      .ERGEBNIS
.UP:
        LD      A,23
        SUB     C
        JR      .ERGEBNIS
.HIGH:
        LD      A,19
        JR      .ERGEBNIS
.DOWN:
        LD      A,20
        ADD     A,C
.ERGEBNIS:
        LD      (NEW_HEIGHT),A
        LD      A,(SEG_TYPE)
        LD      (NEW_TYPE),A
        LD      C,A
        LD      A,(SEG_PHASE)
        INC     A
        LD      (SEG_PHASE),A
        LD      A,(SEG_REMAIN)
        DEC     A
        LD      (SEG_REMAIN),A
        LD      A,(NEW_HEIGHT)
        RET

; B=Spaltenindex, A=Hoehe, C=Typ
SPALTE_SPEICHERN:
        PUSH    AF
        LD      HL,COL_HEIGHT
        LD      E,B
        LD      D,0
        ADD     HL,DE
        POP     AF
        LD      (HL),A
        LD      HL,COL_TYPE
        ADD     HL,DE
        LD      (HL),C
        RET

; B=Byte-x. NEW_HEIGHT und NEW_TYPE beschreiben die neue Spalte.
SPALTE_ZEICHNEN:
        PUSH    BC
        LD      A,(NEW_HEIGHT)
        CP      0FFh
        JR      Z,.OBJEKT
        LD      A,(NEW_TYPE)
        CP      T_UP
        JR      Z,.RAMP_UP
        CP      T_DOWN
        JR      Z,.RAMP_DOWN
        LD      D,0B0h
        LD      A,(NEW_HEIGHT)
        ADD     A,D
        LD      D,A
        LD      E,B
        LD      A,(NEW_PHASE)
        AND     1
        LD      HL,TILE_GROUND0
        JR      Z,.GROUND_READY
        LD      HL,TILE_GROUND1
.GROUND_READY:
        LD      C,8
        CALL    DRAW_COLUMN_PATTERN
        JR      .OBJEKT
.RAMP_UP:
        LD      A,(NEW_HEIGHT)
        ADD     A,A
        ADD     A,A
        ADD     A,A
        SUB     7                           ; Diagonale beginnt 7 Pixel hoeher
        CALL    VRAM_ZEILENADRESSE_DE
        LD      HL,TILE_RAMP_UP
        LD      C,8
        CALL    DRAW_COLUMN_PATTERN
        JR      .OBJEKT
.RAMP_DOWN:
        LD      A,(NEW_HEIGHT)
        ADD     A,A
        ADD     A,A
        ADD     A,A
        SUB     8                           ; Anschluss an das Hochplateau
        CALL    VRAM_ZEILENADRESSE_DE
        LD      HL,TILE_RAMP_DOWN
        LD      C,8
        CALL    DRAW_COLUMN_PATTERN

.OBJEKT:
        LD      A,(NEW_TYPE)
        CP      T_HEDGE
        JR      Z,.HEDGE
        CP      T_BUS
        JR      Z,.BUS
        CP      T_SPRING
        JR      Z,.SPRING
        CP      T_ROUGH
        JR      Z,.ROUGH
        CP      T_CROSS
        JP      Z,.CROSS
        CP      T_GATE
        JP      Z,.GATE
        CP      T_TYRES
        JP      Z,.TYRES
        CP      T_BRICK
        JP      Z,.BRICK
        CP      T_FINISH
        JP      Z,.FINISH
        CP      T_FINISH_END
        JP      Z,.FINISH_END
        POP     BC
        RET
.HEDGE:
        LD      A,(NEW_PHASE)
        AND     1
        LD      HL,TILE_TREE0
        JR      Z,.TREE_READY
        LD      HL,TILE_TREE1
.TREE_READY:
        LD      D,0C4h               ; Baum: y=160..183
        LD      E,B
        LD      C,24
        CALL    DRAW_COLUMN_PATTERN
        POP     BC
        RET
.BUS:
        LD      A,(NEW_PHASE)
        OR      A
        LD      HL,TILE_BUS0
        JR      Z,.BUS_READY
        DEC     A
        LD      HL,TILE_BUS1
        JR      Z,.BUS_READY
        DEC     A
        LD      HL,TILE_BUS2
        JR      Z,.BUS_READY
        DEC     A
        LD      HL,TILE_BUS3
        JR      Z,.BUS_READY
        LD      HL,TILE_BUS4
.BUS_READY:
        LD      D,0C4h               ; Bus: y=160..183
        LD      E,B
        LD      C,24
        CALL    DRAW_COLUMN_PATTERN
        POP     BC
        RET
.SPRING:
        LD      A,(NEW_PHASE)
        AND     1
        LD      HL,TILE_SPRING0
        JR      Z,.SPRING_READY
        LD      HL,TILE_SPRING1
.SPRING_READY:
        LD      D,0C6h
        LD      E,B
        LD      C,8
        CALL    DRAW_COLUMN_PATTERN
        POP     BC
        RET
.ROUGH:
        LD      A,(NEW_PHASE)
        AND     3
        LD      HL,TILE_STONE0
        JR      Z,.ROUGH_READY
        DEC     A
        LD      HL,TILE_STONE1
        JR      Z,.ROUGH_READY
        DEC     A
        LD      HL,TILE_STONE2
        JR      Z,.ROUGH_READY
        LD      HL,TILE_STONE3
.ROUGH_READY:
        LD      D,0C6h
        LD      E,B
        LD      C,8
        CALL    DRAW_COLUMN_PATTERN
        POP     BC
        RET
.CROSS:
        LD      A,(NEW_PHASE)
        AND     1
        LD      HL,TILE_CROSS0
        JR      Z,.CROSS_READY
        LD      HL,TILE_CROSS1
.CROSS_READY:
        LD      D,0C4h               ; y=160..183
        LD      E,B
        LD      C,24
        CALL    DRAW_COLUMN_PATTERN
        POP     BC
        RET
.GATE:
        LD      A,(NEW_PHASE)
        CP      1
        LD      HL,TILE_GATE0
        JR      C,.GATE_READY
        LD      HL,TILE_GATE1
        JR      Z,.GATE_READY
        LD      HL,TILE_GATE2
.GATE_READY:
        LD      D,0C3h               ; y=152..183
        LD      E,B
        LD      C,32
        CALL    DRAW_COLUMN_PATTERN
        POP     BC
        RET
.TYRES:
        LD      A,(NEW_PHASE)
        AND     3
        LD      HL,TILE_TYRES0
        JR      Z,.TYRES_READY
        DEC     A
        LD      HL,TILE_TYRES1
        JR      Z,.TYRES_READY
        DEC     A
        LD      HL,TILE_TYRES2
        JR      Z,.TYRES_READY
        LD      HL,TILE_TYRES3
.TYRES_READY:
        LD      D,0C4h               ; y=160..183
        LD      E,B
        LD      C,24
        CALL    DRAW_COLUMN_PATTERN
        POP     BC
        RET
.BRICK:
        LD      A,(NEW_PHASE)
        AND     3
        LD      HL,TILE_BRICK0
        JR      Z,.BRICK_READY
        DEC     A
        LD      HL,TILE_BRICK1
        JR      Z,.BRICK_READY
        DEC     A
        LD      HL,TILE_BRICK2
        JR      Z,.BRICK_READY
        LD      HL,TILE_BRICK3
.BRICK_READY:
        LD      D,0C3h               ; y=152..183
        LD      E,B
        LD      C,32
        CALL    DRAW_COLUMN_PATTERN
        POP     BC
        RET
.FINISH:
        LD      A,(NEW_PHASE)
        AND     1
        LD      HL,TILE_FINISH0
        JR      Z,.FINISH_READY
        LD      HL,TILE_FINISH1
        JR      .FINISH_READY
.FINISH_END:
        LD      A,(NEW_PHASE)
        AND     1
        LD      HL,TILE_FINISH2
        JR      Z,.FINISH_READY
        LD      HL,TILE_FINISH3
.FINISH_READY:
        LD      D,0C1h               ; einzelne Zielmarke bei y=136
        LD      E,B
        LD      C,8
        CALL    DRAW_COLUMN_PATTERN
        POP     BC
        RET

DRAW_COLUMN_PATTERN:
.LOOP:
        LD      A,(HL)
        LD      (DE),A
        INC     HL
        LD      A,E
        ADD     A,32
        LD      E,A
        JR      NC,.NO_CARRY
        INC     D
.NO_CARRY:
        DEC     C
        JR      NZ,.LOOP
        RET

; A=Pixelzeile, B=Byte-Spalte. Liefert die lineare VRAM-Adresse in DE.
VRAM_ZEILENADRESSE_DE:
        PUSH    BC
        LD      L,A
        LD      H,0
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        LD      C,B
        LD      B,0
        ADD     HL,BC
        LD      DE,VRAM
        ADD     HL,DE
        EX      DE,HL
        POP     BC
        RET

; B=Byte-x. Erzeugt parallel zur monochromen Pixelspalte die zugehoerigen
; Farbattribute. Der Boden und die Hindernisse erhalten bewusst verschiedene
; Farben, der leere Himmel bleibt schwarz.
SPALTE_FARBE_ZEICHNEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      A,B
        LD      (TEMP_FARB_SPALTE),A
        XOR     A
        OUT     (24h),A

        ; Der Farbspeicher ist beim Streckenaufbau bereits geloescht; beim
        ; Scrollen loescht FARBBILD_SCROLL_LINKS die neue rechte Spalte.
        ; Ein zweites Loeschen aller 192 Zeilen wuerde nur Rechenzeit kosten.
        LD      DE,32

        ; Acht Pixel hohe Fahrbahn mit feinen Rampendiagonalen.
        LD      A,(NEW_HEIGHT)
        CP      0FFh
        JR      Z,.OBJEKT
        LD      A,(NEW_TYPE)
        CP      T_UP
        JR      Z,.RAMPE_AUF
        CP      T_DOWN
        JR      Z,.RAMPE_AB
        LD      A,(NEW_HEIGHT)
        ADD     A,0B0h
        LD      H,A
        LD      A,(TEMP_FARB_SPALTE)
        LD      L,A
        ; Auf waagerechter Strecke bilden die gesetzten Pixel eine weisse
        ; Kontur bzw. helle Sprenkel; der Hintergrund des Attributes ist
        ; gruen. Das entspricht der gefuellten Plus/4-Fahrbahn wesentlich
        ; besser als einzelne gruene Z1013-Pixel.
        LD      A,0Fh                       ; obere Kontur: Weiss auf Schwarz
        LD      C,1
        CALL    FARBSPALTEN_BLOCK
        LD      A,0AFh                      ; Weiss auf hellgruenem Grund
        LD      C,7
        CALL    FARBSPALTEN_BLOCK
        JR      .OBJEKT
.RAMPE_AUF:
        LD      A,(NEW_HEIGHT)
        ADD     A,A
        ADD     A,A
        ADD     A,A
        SUB     7
        JR      .RAMPE_ADRESSE
.RAMPE_AB:
        LD      A,(NEW_HEIGHT)
        ADD     A,A
        ADD     A,A
        ADD     A,A
        SUB     8
.RAMPE_ADRESSE:
        LD      C,A
        LD      A,(TEMP_FARB_SPALTE)
        LD      B,A
        LD      A,C
        CALL    VRAM_ZEILENADRESSE_DE
        EX      DE,HL
        LD      A,0Ah                       ; gefuellte gruene Rampenkontur
        LD      C,8
        CALL    FARBSPALTEN_BLOCK

.OBJEKT:
        LD      A,(NEW_TYPE)
        CP      T_HEDGE
        JR      Z,.HECKE
        CP      T_BUS
        JR      Z,.BUS
        CP      T_SPRING
        JR      Z,.FEDER
        CP      T_ROUGH
        JR      Z,.STEINE
        CP      T_CROSS
        JR      Z,.KREUZ
        CP      T_GATE
        JR      Z,.TOR
        CP      T_TYRES
        JR      Z,.REIFEN
        CP      T_BRICK
        JR      Z,.MAUER
        CP      T_FINISH
        JR      Z,.ZIEL
        CP      T_FINISH_END
        JR      Z,.ZIEL
        JR      .FERTIG
.HECKE:
        LD      H,0C4h
        LD      A,0Ah                       ; Baum/Hecke: Hellgruen
        LD      C,24
        JR      .BLOCK
.BUS:
        LD      H,0C4h
        LD      A,0Bh                       ; Bus: Hellcyan
        LD      C,24
        JR      .BLOCK
.FEDER:
        LD      H,0C6h
        LD      A,0Dh                       ; Sprungfeder: Hellmagenta
        LD      C,8
        JR      .BLOCK
.STEINE:
        LD      H,0C6h
        LD      A,07h                       ; Steine: Hellgrau
        LD      C,8
        JR      .BLOCK
.KREUZ:
        LD      H,0C4h
        LD      A,0Ch                       ; gefaehrliches Kreuz: Rot
        LD      C,24
        JR      .BLOCK
.TOR:
        LD      H,0C3h
        LD      A,0Fh                       ; Tor/Telefonzelle: Weiss
        LD      C,32
        JR      .BLOCK
.REIFEN:
        LD      H,0C4h
        LD      A,07h                       ; Reifen: Grau
        LD      C,24
        JR      .BLOCK
.MAUER:
        LD      H,0C3h
        LD      A,09h                       ; Ziegel: Braun/Orange
        LD      C,32
        JR      .BLOCK
.ZIEL:
        LD      H,0C1h
        LD      A,0Eh                       ; Zielflaggen: Gelb
        LD      C,8
.BLOCK:
        PUSH    AF
        LD      A,(TEMP_FARB_SPALTE)
        LD      L,A
        POP     AF
        CALL    FARBSPALTEN_BLOCK
.FERTIG:
        XOR     A
        OUT     (20h),A
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; HL=erste Farbadresse, C=Zeilen, A=Farbattribut.
FARBSPALTEN_BLOCK:
        LD      DE,32
.ZEILE:
        LD      (HL),A
        ADD     HL,DE
        DEC     C
        JR      NZ,.ZEILE
        RET

; -----------------------------------------------------------------------------
; Bildlauf
; -----------------------------------------------------------------------------

SCROLL_SERVICE:
        LD      A,(SPEED)
        OR      A
        RET     Z
        LD      B,A
        LD      A,7
        SUB     B                    ; Schwelle: Speed 1..4 -> 6..3 Frames
        LD      B,A
        LD      A,(SCROLL_TIMER)
        INC     A
        CP      B
        JR      C,.NUR_TIMER
        XOR     A
        LD      (SCROLL_TIMER),A
        CALL    BILD_SCROLL_LINKS
        CALL    FARBBILD_SCROLL_LINKS
        CALL    KARTEN_SCROLL_LINKS
        LD      B,31
        CALL    NEUE_SPALTE
        CALL    SPALTE_SPEICHERN
        CALL    SPALTE_ZEICHNEN
        CALL    SPALTE_FARBE_ZEICHNEN
        LD      HL,(SCORE)
        LD      DE,9999
        OR      A
        SBC     HL,DE
        JR      NC,.SCORE_FERTIG
        LD      HL,(SCORE)
        INC     HL
        LD      (SCORE),HL
.SCORE_FERTIG:
        CALL    STATUS_AKTUALISIEREN
        RET
.NUR_TIMER:
        LD      (SCROLL_TIMER),A
        RET

BILD_SCROLL_LINKS:
        LD      HL,SCROLL_VRAM+1
        LD      DE,SCROLL_VRAM
        LD      B,SCROLL_ROWS
.ROW:
        PUSH    BC
        LD      BC,31
        LDIR
        XOR     A
        LD      (DE),A               ; neue rechte Spalte gleich loeschen
        INC     HL
        INC     DE
        POP     BC
        DJNZ    .ROW
        RET

; Der Farbspeicher scrollt exakt parallel zum Pixelbild. So bleibt jede
; Streckenspalte auch nach langer Fahrt ihrer Farbe zugeordnet.
FARBBILD_SCROLL_LINKS:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        XOR     A
        OUT     (24h),A
        LD      HL,SCROLL_VRAM+1
        LD      DE,SCROLL_VRAM
        LD      B,SCROLL_ROWS
.ROW:
        PUSH    BC
        LD      BC,31
        LDIR
        XOR     A
        LD      (DE),A
        INC     HL
        INC     DE
        POP     BC
        DJNZ    .ROW
        XOR     A
        OUT     (20h),A
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

KARTEN_SCROLL_LINKS:
        LD      HL,COL_HEIGHT+1
        LD      DE,COL_HEIGHT
        LD      BC,31
        LDIR
        LD      HL,COL_TYPE+1
        LD      DE,COL_TYPE
        LD      BC,31
        LDIR
        RET

; -----------------------------------------------------------------------------
; Tastatur, Steuerung und Physik
; -----------------------------------------------------------------------------

TASTATUR_LESEN:
        XOR     A
        LD      (KEYS),A
        OUT     (08h),A
        IN      A,(04h)
        BIT     0,A
        JR      Z,.NO_LEFT
        LD      A,(KEYS)
        SET     KEY_LEFT,A
        LD      (KEYS),A
.NO_LEFT:
        LD      A,2
        OUT     (08h),A
        IN      A,(04h)
        BIT     0,A
        JR      Z,.NO_UP
        LD      A,(KEYS)
        SET     KEY_UP,A
        LD      (KEYS),A
.NO_UP:
        LD      A,8
        OUT     (08h),A
        IN      A,(04h)
        LD      B,A
        BIT     2,B
        JR      Z,.NO_RIGHT
        LD      A,(KEYS)
        SET     KEY_RIGHT,A
        LD      (KEYS),A
.NO_RIGHT:
        BIT     3,B
        JR      Z,.NO_DOWN
        LD      A,(KEYS)
        SET     KEY_DOWN,A
        LD      (KEYS),A
.NO_DOWN:
        BIT     1,B
        RET     Z
        LD      A,(KEYS)
        SET     KEY_ESC,A
        LD      (KEYS),A
        RET

STEUERUNG:
        LD      A,(FINISH_ROLLING)
        OR      A
        JP      NZ,ZIEL_AUSROLLEN
        LD      A,(KEYS)
        LD      B,A
        BIT     KEY_LEFT,B
        JR      NZ,.SPEED_KEY
        BIT     KEY_RIGHT,B
        JR      NZ,.SPEED_KEY
        XOR     A
        LD      (KEY_LOCK),A
        JR      .JUMP
.SPEED_KEY:
        LD      A,(KEY_LOCK)
        OR      A
        JR      NZ,.JUMP
        LD      A,1
        LD      (KEY_LOCK),A
        BIT     KEY_RIGHT,B
        JR      Z,.SLOWER
        LD      A,(SPEED)
        CP      4
        JR      NC,.JUMP
        INC     A
        LD      (SPEED),A
        CALL    STATUS_AKTUALISIEREN
        JR      .JUMP
.SLOWER:
        LD      A,(SPEED)
        OR      A
        JR      Z,.JUMP
        DEC     A
        LD      (SPEED),A
        CALL    STATUS_AKTUALISIEREN
.JUMP:
        LD      A,(KEYS)
        BIT     KEY_UP,A
        JR      Z,.JUMP_FREE
        LD      A,(JUMP_LOCK)
        OR      A
        JR      NZ,.WHEELIE
        LD      A,1
        LD      (JUMP_LOCK),A
        LD      A,(ON_GROUND)
        OR      A
        JR      Z,.WHEELIE
        ; Je hoeher die Fahrgeschwindigkeit, desto groesser der Absprung:
        ; Speed 0..4 ergibt VY -11..-15. Damit waechst neben der horizontalen
        ; Reichweite auch die Hoehe der Flugkurve.
        LD      A,(SPEED)
        LD      B,A
        LD      A,0F5h               ; -11
        SUB     B
        LD      (VY),A
        XOR     A
        LD      (ON_GROUND),A
        CALL    SOUND_JUMP_START
        JR      .WHEELIE
.JUMP_FREE:
        XOR     A
        LD      (JUMP_LOCK),A
.WHEELIE:
        LD      A,(KEYS)
        AND     1 << KEY_DOWN
        JR      Z,.NO_WHEELIE
        LD      A,1
.NO_WHEELIE:
        LD      (WHEELIE),A
        RET

; Nach der ersten Zielmarke ist die Fahrereingabe gesperrt. Die sichtbare
; Geschwindigkeit sinkt in ruhigen Stufen bis auf Fahrstufe 1, damit die
; Strecke weiterrollt. Die Motordrehzahl faellt parallel bis zum Standgas.
ZIEL_AUSROLLEN:
        XOR     A
        LD      (KEY_LOCK),A
        LD      (JUMP_LOCK),A
        LD      (WHEELIE),A
        LD      A,(FINISH_BRAKE_TIMER)
        INC     A
        CP      8
        JR      NC,.ABBREMSEN
        LD      (FINISH_BRAKE_TIMER),A
        RET
.ABBREMSEN:
        XOR     A
        LD      (FINISH_BRAKE_TIMER),A
        LD      A,(SPEED)
        CP      2
        RET     C
        DEC     A
        LD      (SPEED),A
        JP      STATUS_AKTUALISIEREN

PHYSIK:
        LD      A,(ON_GROUND)
        OR      A
        JR      NZ,.GROUND_CHECK
        LD      A,(VY)
        LD      E,A
        LD      A,(BIKE_Y)
        ADD     A,E
        LD      (BIKE_Y),A
        LD      A,(VY)
        CP      6
        JR      Z,.GROUND_CHECK
        INC     A
        LD      (VY),A
.GROUND_CHECK:
        RET

; Carry=Sturz. Passt Bodenhoehe an, prueft Hindernisse und Ziel.
STRECKE_PRUEFEN:
        CALL    HIMMEL_KOLLISION
        RET     C
        CALL    RAMPENSTATUS_AKTUALISIEREN
        LD      A,(COL_TYPE+BIKE_COLUMN)
        CP      T_FINISH
        JR      NZ,.FINISH_ENDE_PRUEFEN
        LD      A,1
        LD      (FINISH_ROLLING),A
        OR      A
        JR      .GROUND
.FINISH_ENDE_PRUEFEN:
        CP      T_FINISH_END
        JR      NZ,.NOT_FINISH
        LD      A,1
        LD      (COURSE_DONE),A
        OR      A
        RET
.NOT_FINISH:
        CP      T_HEDGE
        JR      Z,.HEDGE
        CP      T_BUS
        JR      Z,.BUS
        CP      T_ROUGH
        JR      Z,.ROUGH
        CP      T_CROSS
        JR      Z,.OBSTACLE24
        CP      T_GATE
        JR      Z,.OBSTACLE32
        CP      T_TYRES
        JR      Z,.OBSTACLE24
        CP      T_BRICK
        JR      Z,.OBSTACLE32
        JR      .GROUND
.HEDGE:
        LD      B,24
        JR      .OBSTACLE
.BUS:
        LD      B,24
.OBSTACLE:
        CALL    SURFACE_PIXEL
        SUB     B
        LD      B,A
        LD      A,(BIKE_Y)
        ADD     A,15
        CP      B
        JP      NC,.CRASH
        JR      .GROUND
.OBSTACLE24:
        LD      B,24
        JR      .OBSTACLE
.OBSTACLE32:
        LD      B,32
        JR      .OBSTACLE
.ROUGH:
        LD      A,(SPEED)
        CP      3
        JP      NC,.CRASH
.GROUND:
        LD      A,(AUTO_RAMP)
        OR      A
        JR      Z,.NORMALE_RADPRUEFUNG
        ; Auf der Auffahrt bestimmt das Hinterrad die Fahrzeughoehe. Das
        ; automatisch gewaehlte Wheelie-Sprite hebt gleichzeitig das
        ; Vorderrad an und verhindert ein schwebendes Hinterrad.
        LD      A,(COL_HEIGHT+BIKE_REAR_COLUMN)
        CP      0FFh
        JR      NZ,.HOEHE_BEREIT
        ; Direkt am Rampenanfang kann das Hinterrad noch ueber einer Luecke
        ; stehen. Dann darf ausnahmsweise das Vorderrad tragen.
        LD      A,(COL_HEIGHT+BIKE_COLUMN)
        JR      .HOEHE_BEREIT
.NORMALE_RADPRUEFUNG:
        ; Zuerst traegt das Vorderrad. Haengt es bereits ueber dem Loch,
        ; pruefen wir auch das Hinterrad: Eine Kante darf kurz ueberbrueckt
        ; werden, aber das Motorrad darf nicht vorzeitig als Sprung gelten.
        LD      A,(COL_HEIGHT+BIKE_COLUMN)
        CP      0FFh
        JR      NZ,.HOEHE_BEREIT
        LD      A,(COL_HEIGHT+BIKE_REAR_COLUMN)
.HOEHE_BEREIT:
        CP      0FFh
        JR      NZ,.HAS_GROUND
        ; Fehlt unter beiden Raedern der Boden und das Motorrad war zuvor auf
        ; der Fahrbahn, ist es ohne Absprung in das Loch gefahren: Sturz.
        ; Ein echter Sprung hat ON_GROUND bereits in STEUERUNG geloescht und
        ; darf die Luecke weiterhin ueberfliegen.
        LD      A,(ON_GROUND)
        OR      A
        JR      NZ,.CRASH
        XOR     A
        LD      (ON_GROUND),A
        LD      A,(BIKE_Y)
        CP      208
        JR      NC,.CRASH
        OR      A
        RET
.HAS_GROUND:
        CALL    SURFACE_PIXEL
        LD      B,A
        LD      A,(ON_GROUND)
        OR      A
        JR      Z,.LANDING
        LD      A,B
        SUB     16
        LD      (BIKE_Y),A
        JR      .SPRING
.LANDING:
        LD      A,(VY)
        BIT     7,A
        JR      NZ,.SAFE
        LD      A,(BIKE_Y)
        ADD     A,15
        CP      B
        JR      C,.SAFE
        LD      A,B
        SUB     16
        LD      (BIKE_Y),A
        XOR     A
        LD      (VY),A
        LD      A,1
        LD      (ON_GROUND),A
.SPRING:
        LD      A,(COL_TYPE+BIKE_COLUMN)
        CP      T_SPRING
        JR      NZ,.SAFE
        LD      A,0F0h               ; -16, besonders hoher Federsprung
        LD      (VY),A
        XOR     A
        LD      (ON_GROUND),A
        CALL    SOUND_JUMP_START
.SAFE:
        OR      A
        RET
.CRASH:
        SCF
        RET

; AUTO_RAMP ist aktiv, solange Vorder- oder Hinterrad auf einem ansteigenden
; Rampensegment stehen. In der Luft bleibt ausschliesslich das Sprungsprite.
RAMPENSTATUS_AKTUALISIEREN:
        XOR     A
        LD      (AUTO_RAMP),A
        LD      A,(ON_GROUND)
        OR      A
        RET     Z
        LD      A,(COL_TYPE+BIKE_COLUMN)
        CP      T_UP
        JR      Z,.AKTIV
        LD      A,(COL_TYPE+BIKE_REAR_COLUMN)
        CP      T_UP
        RET     NZ
.AKTIV:
        LD      A,1
        LD      (AUTO_RAMP),A
        RET

SURFACE_PIXEL:
        LD      A,(COL_HEIGHT+BIKE_COLUMN)
        ADD     A,A
        ADD     A,A
        ADD     A,A
        RET

FAHRER_AUF_BODEN:
        CALL    SURFACE_PIXEL
        SUB     16
        LD      (BIKE_Y),A
        RET

; -----------------------------------------------------------------------------
; Motorrad-Sprites
; -----------------------------------------------------------------------------

BIKE_LOESCHEN:
        CALL    BIKE_SPRITE_ADRESSE
        CALL    BIKE_SPRITE_XOR
        JP      BIKE_FARBE_WIEDERHERSTELLEN

BIKE_ZEICHNEN:
        CALL    BIKE_SPRITE_ADRESSE
        CALL    BIKE_FARBE_SICHERN_UND_SETZEN
        JP      BIKE_SPRITE_XOR

CRASH_ZEICHNEN:
        LD      HL,SPRITE_CRASH
        LD      DE,SPRITE_FARBE_CRASH
        LD      (BIKE_FARB_PTR),DE
        CALL    BIKE_FARBE_SICHERN_UND_SETZEN
        JP      BIKE_SPRITE_XOR

CRASH_LOESCHEN:
        LD      HL,SPRITE_CRASH
        CALL    BIKE_SPRITE_XOR
        JP      BIKE_FARBE_WIEDERHERSTELLEN

; Liefert in HL exakt dieselbe Animationsmaske, die anschliessend per XOR
; gezeichnet oder geloescht wird.
BIKE_SPRITE_ADRESSE:
        LD      A,(ON_GROUND)
        OR      A
        JR      Z,.JUMP
        LD      A,(WHEELIE)
        OR      A
        JR      NZ,.WHEELIE
        LD      A,(AUTO_RAMP)
        OR      A
        JR      NZ,.WHEELIE
        LD      A,(FRAME_COUNT)
        AND     4
        JR      NZ,.RIDE1
        LD      HL,SPRITE_RIDE0
        LD      DE,SPRITE_FARBE_RIDE0
        JR      .MERKE
.RIDE1:
        LD      HL,SPRITE_RIDE1
        LD      DE,SPRITE_FARBE_RIDE1
        JR      .MERKE
.JUMP:
        LD      HL,SPRITE_JUMP
        LD      DE,SPRITE_FARBE_JUMP
        JR      .MERKE
.WHEELIE:
        LD      HL,SPRITE_WHEELIE
        LD      DE,SPRITE_FARBE_WHEELIE
.MERKE:
        LD      (BIKE_FARB_PTR),DE
        RET

BIKE_SPRITE_XOR:
        PUSH    HL
        POP     IX
        LD      A,(BIKE_Y)
        LD      L,A
        LD      H,0
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        LD      DE,VRAM+(BIKE_X/8)
        ADD     HL,DE
        ; Das Motorrad ist 24 Pixel bzw. drei Bytes breit. Nach dem dritten
        ; Byte steht HL zwei Bytes hinter dem Zeilenanfang; weitere 30 Byte
        ; fuehren zur gleichen Spalte der naechsten Bildschirmzeile.
        LD      DE,30
        LD      B,16
.ROW:
        LD      A,(IX+0)
        XOR     (HL)
        LD      (HL),A
        INC     HL
        LD      A,(IX+1)
        XOR     (HL)
        LD      (HL),A
        INC     HL
        LD      A,(IX+2)
        XOR     (HL)
        LD      (HL),A
        ADD     HL,DE
        INC     IX
        INC     IX
        INC     IX
        DJNZ    .ROW
        RET

; Sichert die 3x16 Farbattribute unter dem Motorrad und setzt danach die zum
; aktuellen Sprite gehoerende 3x16-Farbmaske. FF in der Farbmaske bedeutet,
; dass die darunterliegende Streckenfarbe erhalten bleibt. HL (Spriteadresse)
; und alle weiteren Register bleiben fuer die XOR-Ausgabe erhalten.
BIKE_FARBE_SICHERN_UND_SETZEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        PUSH    IX
        XOR     A
        OUT     (24h),A
        CALL    BIKE_FARB_ZIELADRESSE
        LD      DE,BIKE_FARB_BACKUP
        LD      B,16
.SICHER_ZEILE:
        LD      A,(HL)
        LD      (DE),A
        INC     HL
        INC     DE
        LD      A,(HL)
        LD      (DE),A
        INC     HL
        INC     DE
        LD      A,(HL)
        LD      (DE),A
        INC     HL
        INC     DE
        PUSH    DE
        LD      DE,29
        ADD     HL,DE
        POP     DE
        DJNZ    .SICHER_ZEILE

        CALL    BIKE_FARB_ZIELADRESSE
        LD      IX,(BIKE_FARB_PTR)
        LD      DE,29
        LD      B,16
.SETZ_ZEILE:
        LD      A,(IX+0)
        CP      0FFh
        JR      Z,.SPALTE1
        LD      (HL),A
.SPALTE1:
        INC     HL
        LD      A,(IX+1)
        CP      0FFh
        JR      Z,.SPALTE2
        LD      (HL),A
.SPALTE2:
        INC     HL
        LD      A,(IX+2)
        CP      0FFh
        JR      Z,.ZEILE_WEITER
        LD      (HL),A
.ZEILE_WEITER:
        INC     HL
        INC     IX
        INC     IX
        INC     IX
        ADD     HL,DE
        DJNZ    .SETZ_ZEILE
        XOR     A
        OUT     (20h),A
        POP     IX
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; Spielt nach dem XOR-Loeschen exakt die zuvor gesicherten Streckenfarben ein.
; Dadurch hinterlassen weder Motorrad noch Sturzsprite farbige Spuren.
BIKE_FARBE_WIEDERHERSTELLEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        XOR     A
        OUT     (24h),A
        CALL    BIKE_FARB_ZIELADRESSE
        LD      DE,BIKE_FARB_BACKUP
        LD      B,16
.ZEILE:
        LD      A,(DE)
        LD      (HL),A
        INC     HL
        INC     DE
        LD      A,(DE)
        LD      (HL),A
        INC     HL
        INC     DE
        LD      A,(DE)
        LD      (HL),A
        INC     HL
        INC     DE
        PUSH    DE
        LD      DE,29
        ADD     HL,DE
        POP     DE
        DJNZ    .ZEILE
        XOR     A
        OUT     (20h),A
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; Zieladresse im parallel eingeblendeten 8-KiB-Farbspeicher.
BIKE_FARB_ZIELADRESSE:
        LD      A,(BIKE_Y)
        LD      L,A
        LD      H,0
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        LD      DE,VRAM+(BIKE_X/8)
        ADD     HL,DE
        RET

; -----------------------------------------------------------------------------
; Explosionsartiger Sturz
; -----------------------------------------------------------------------------

; Sechs Bilder zeigen, wie sich 4x4-Pixelteile des Motorrads voneinander
; entfernen. Jedes Bild ist 48x32 Pixel bzw. 6x32 Bytes gross.
EXPLOSION_ABSPIELEN:
        XOR     A
        LD      (EXPLOSION_FRAME),A
.BILD:
        CALL    EXPLOSION_ADRESSE
        CALL    EXPLOSION_FARBE_SICHERN_UND_SETZEN
        CALL    EXPLOSION_XOR
        CALL    SOUND_CRASH_STEP
        CALL    FRAME_PAUSE
        CALL    EXPLOSION_ADRESSE
        CALL    EXPLOSION_XOR
        CALL    EXPLOSION_FARBE_WIEDERHERSTELLEN
        LD      A,(EXPLOSION_FRAME)
        INC     A
        LD      (EXPLOSION_FRAME),A
        CP      6
        JR      C,.BILD
        RET

; Liefert das aktuelle 192-Byte-Bild in HL und merkt die Adresse fuer die
; Farbsteuerung.
EXPLOSION_ADRESSE:
        LD      HL,EXPLOSION_DATEN
        LD      A,(EXPLOSION_FRAME)
        OR      A
        JR      Z,.FERTIG
        LD      DE,192
.WEITER:
        ADD     HL,DE
        DEC     A
        JR      NZ,.WEITER
.FERTIG:
        LD      (EXPLOSION_PTR),HL
        RET

; XOR-Ausgabe eines 48x32-Bildes. Der Ausschnitt beginnt acht Pixel links und
; acht Pixel oberhalb des normalen Motorrads.
EXPLOSION_XOR:
        PUSH    HL
        POP     IX
        CALL    EXPLOSION_ZIELADRESSE
        LD      DE,26                       ; 32 - 6 Bytes Bildbreite
        LD      B,32
.ZEILE:
        LD      C,6
.SPALTE:
        LD      A,(IX+0)
        XOR     (HL)
        LD      (HL),A
        INC     IX
        INC     HL
        DEC     C
        JR      NZ,.SPALTE
        ADD     HL,DE
        DJNZ    .ZEILE
        RET

; Sichert die 6x32 Farbattribute und faerbt nur Bytefelder rot, in denen im
; aktuellen Explosionsbild mindestens ein Partikel gesetzt ist.
EXPLOSION_FARBE_SICHERN_UND_SETZEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        PUSH    IX
        XOR     A
        OUT     (24h),A
        CALL    EXPLOSION_ZIELADRESSE
        LD      DE,EXPLOSION_FARB_BACKUP
        LD      B,32
.SICHER_ZEILE:
        LD      C,6
.SICHER_SPALTE:
        LD      A,(HL)
        LD      (DE),A
        INC     HL
        INC     DE
        DEC     C
        JR      NZ,.SICHER_SPALTE
        PUSH    DE
        LD      DE,26
        ADD     HL,DE
        POP     DE
        DJNZ    .SICHER_ZEILE

        CALL    EXPLOSION_ZIELADRESSE
        LD      IX,(EXPLOSION_PTR)
        LD      DE,26
        LD      B,32
.SETZ_ZEILE:
        LD      C,6
.SETZ_SPALTE:
        LD      A,(IX+0)
        OR      A
        JR      Z,.KEIN_PARTIKEL
        LD      A,0Ch                       ; Explosionspartikel: Hellrot
        LD      (HL),A
.KEIN_PARTIKEL:
        INC     IX
        INC     HL
        DEC     C
        JR      NZ,.SETZ_SPALTE
        ADD     HL,DE
        DJNZ    .SETZ_ZEILE
        XOR     A
        OUT     (20h),A
        POP     IX
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

EXPLOSION_FARBE_WIEDERHERSTELLEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        XOR     A
        OUT     (24h),A
        CALL    EXPLOSION_ZIELADRESSE
        LD      DE,EXPLOSION_FARB_BACKUP
        LD      B,32
.ZEILE:
        LD      C,6
.SPALTE:
        LD      A,(DE)
        LD      (HL),A
        INC     DE
        INC     HL
        DEC     C
        JR      NZ,.SPALTE
        PUSH    DE
        LD      DE,26
        ADD     HL,DE
        POP     DE
        DJNZ    .ZEILE
        XOR     A
        OUT     (20h),A
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

EXPLOSION_ZIELADRESSE:
        LD      A,(BIKE_Y)
        SUB     8
        LD      L,A
        LD      H,0
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        LD      DE,VRAM+(BIKE_X/8)-1
        ADD     HL,DE
        RET

; -----------------------------------------------------------------------------
; Allgemeiner Farbspeicher
; -----------------------------------------------------------------------------

; A=Vordergrundfarbe. Fuellt alle 8192 Attribute, schaltet danach wieder auf
; Pixel-VRAM und aktiviert die Farbausgabe.
FARBBILD_FUELLEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      D,A
        XOR     A
        OUT     (24h),A
        LD      HL,VRAM
        LD      BC,02000h
        LD      A,D
        CALL    FARBBEREICH_FUELLEN
        XOR     A
        OUT     (20h),A
        OUT     (28h),A
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; Mehrfarbige Titelaufteilung nach dem Vorbild klassischer Plus/4-Spiele.
; Es werden nur horizontale Farbzonen erzeugt; der monochrome Titel bestimmt
; weiterhin pixelgenau, an welchen Stellen die Farben sichtbar sind.
FARB_INTRO_AUFBAUEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        XOR     A
        OUT     (24h),A
        LD      HL,VRAM
        LD      BC,02000h
        XOR     A
        CALL    FARBBEREICH_FUELLEN
        LD      HL,0B500h                    ; oberer Teil des KIKSTART-Logos
        LD      BC,0160h
        LD      A,0Eh                        ; Gelb
        CALL    FARBBEREICH_FUELLEN
        LD      HL,0B660h                    ; unterer Teil des Logos
        LD      BC,0140h
        LD      A,0Ch                        ; Hellrot
        CALL    FARBBEREICH_FUELLEN
        LD      HL,0BC00h                    ; Untertitel
        LD      BC,0200h
        LD      A,0Bh                        ; Hellcyan
        CALL    FARBBEREICH_FUELLEN
        LD      HL,0BFC0h                    ; Titel-Motorrad
        LD      BC,0680h                     ; bis unmittelbar vor die Fahrbahn
        LD      A,0Fh                        ; Weiss
        CALL    FARBBEREICH_FUELLEN
        LD      HL,0C640h                    ; Dekorative Fahrbahn ab Bildzeile 178
        LD      BC,0220h
        LD      A,0Ah                        ; Hellgruen
        CALL    FARBBEREICH_FUELLEN
        LD      HL,0C980h                    ; Steuerungshinweis
        LD      BC,0180h
        LD      A,07h                        ; Hellgrau
        CALL    FARBBEREICH_FUELLEN
        LD      HL,0CC00h                    ; ESC START
        LD      BC,0200h
        LD      A,0Eh
        CALL    FARBBEREICH_FUELLEN
        XOR     A
        OUT     (20h),A
        OUT     (28h),A
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; Loescht den Farbspeicher waehrend des Streckenaufbaus. Die Farbausgabe wird
; hier absichtlich noch nicht aktiviert.
FARBSPEICHER_LOESCHEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        XOR     A
        OUT     (24h),A
        LD      HL,VRAM
        LD      BC,02000h
        XOR     A
        CALL    FARBBEREICH_FUELLEN
        XOR     A
        OUT     (20h),A
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; Oberer Plus/4-artiger Kopf und untere Motorrad-/Fortschrittsanzeige.
FARBSTATUS_AUFBAUEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        XOR     A
        OUT     (24h),A
        LD      HL,STATUS_VRAM
        LD      BC,0100h
        XOR     A                           ; obere Leerzeile
        CALL    FARBBEREICH_FUELLEN
        LD      BC,0100h
        LD      A,0Eh                       ; Zeit/Punkte/High: Gelb
        CALL    FARBBEREICH_FUELLEN
        LD      BC,0100h
        LD      A,0Bh                       ; Strecke/Tempo/Motorrad: Hellcyan
        CALL    FARBBEREICH_FUELLEN
        LD      BC,0100h
        XOR     A
        CALL    FARBBEREICH_FUELLEN

        ; Die einzige obere Statuszeile folgt dem Original: TIME gelb,
        ; SCORE gruen und HIGH violett. Die zweite Textzeile bleibt leer.
        LD      HL,0B108h                    ; SCORE, Spalten 8..17
        LD      B,8
        LD      C,10
        LD      A,0Ah
        CALL    FARBRECHTECK_FUELLEN
        LD      HL,0B113h                    ; HIGH, Spalten 19..27
        LD      B,8
        LD      C,9
        LD      A,0Dh
        CALL    FARBRECHTECK_FUELLEN

        LD      HL,STATUS_BOTTOM
        LD      BC,0100h
        LD      A,0Fh                       ; Motorrad-Symbole: Weiss
        CALL    FARBBEREICH_FUELLEN
        LD      BC,0100h
        LD      A,0Eh                       ; verbleibende Motorrader: Gelb
        CALL    FARBBEREICH_FUELLEN
        LD      BC,0100h
        LD      A,0Dh                       ; Streckenmarken: Magenta
        CALL    FARBBEREICH_FUELLEN
        LD      BC,0100h
        LD      A,07h                       ; kleine Legende: Hellgrau
        CALL    FARBBEREICH_FUELLEN
        XOR     A
        OUT     (20h),A
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; HL=Ziel, BC=Anzahl, A=Attribut. Gibt HL hinter dem Bereich zurueck.
FARBBEREICH_FUELLEN:
        LD      D,A
.LOOP:
        LD      A,D
        LD      (HL),A
        INC     HL
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,.LOOP
        RET

; HL=linke obere Ecke, B=Hoehe, C=Breite, A=Farbattribut.
FARBRECHTECK_FUELLEN:
        LD      D,A
.ZEILE:
        PUSH    BC
        PUSH    HL
.SPALTE:
        LD      A,D
        LD      (HL),A
        INC     HL
        DEC     C
        JR      NZ,.SPALTE
        POP     HL
        LD      BC,32
        ADD     HL,BC
        POP     BC
        DJNZ    .ZEILE
        RET

; -----------------------------------------------------------------------------
; Plus/4-artiger Himmel: zwei Wolken, Ballon und Gewitter
; -----------------------------------------------------------------------------

; Der Himmel liegt vollstaendig oberhalb der ab Zeile 136 gescrollten
; Fahrbahn. Seine Objekte bewegen sich deshalb als langsamere Parallaxebene.
; Eine Wolke wird erst dunkel und warnt damit vor dem kurzen Blitzfenster.
HIMMEL_RESET:
        LD      A,30
        LD      (SKY_CLOUD1_X),A
        LD      A,17
        LD      (SKY_CLOUD2_X),A
        LD      A,8
        LD      (SKY_BALLOON_X),A
        LD      A,SKY_BALLOON_Y0
        LD      (SKY_BALLOON_Y),A
        XOR     A
        LD      (SKY_FRAME),A
        LD      (SKY_MOVE_ACC),A
        LD      (SKY_PARALLAX),A
        LD      (SKY_WEATHER),A
        LD      (SKY_LIGHTNING_ACTIVE),A
        LD      (SKY_MODE),A
        LD      (SKY_BALLOON_VISIBLE),A
        LD      (SKY_STRIKE_DONE),A

        ; Kursnummer ist intern nullbasiert:
        ; Kurs 1: leerer Himmel, Kurs 2: nur Bonusballon,
        ; ab Kurs 3: nur Gewitterwolken, niemals Ballon und Wolke gemeinsam.
        LD      A,(COURSE)
        OR      A
        JR      Z,.MODUS_FERTIG
        CP      1
        JR      NZ,.GEWITTER
        LD      A,1                    ; ausschliesslich Kurs 2
        LD      (SKY_MODE),A
        LD      (SKY_BALLOON_VISIBLE),A
        JR      .MODUS_FERTIG
.GEWITTER:
        LD      A,2                    ; Gewitter ab Kurs 3
        LD      (SKY_MODE),A
.MODUS_FERTIG:
        JP      HIMMEL_ALLES_ZEICHNEN

; Wird einmal pro Bild aufgerufen, nachdem das Motorrad geloescht wurde.
; Wolken und Ballon bewegen sich unabhaengig von Motorrad und Fahrstufe
; kontinuierlich nach links. In einem Gewitterkurs wird die Wolke einige
; Spalten vor dem Motorrad dunkel und wirft beim Vorbeiziehen den Blitz.
HIMMEL_SERVICE:
        CALL    HIMMEL_ALLES_LOESCHEN

        LD      A,(SKY_FRAME)
        INC     A
        LD      (SKY_FRAME),A
        AND     10h
        LD      A,SKY_BALLOON_Y0
        JR      Z,.BALLON_Y
        INC     A
.BALLON_Y:
        LD      (SKY_BALLOON_Y),A

        LD      A,(SKY_LIGHTNING_ACTIVE)
        OR      A
        JR      Z,.BEWEGUNG
        DEC     A
        LD      (SKY_LIGHTNING_ACTIVE),A

.BEWEGUNG:
        LD      A,(SKY_MOVE_ACC)
        INC     A
        CP      8                       ; alle acht Bilder eine 8-Pixel-Stufe
        JR      C,.ACC_SPEICHERN
        XOR     A
        LD      (SKY_MOVE_ACC),A
        LD      A,(SKY_MODE)
        CP      1
        JR      Z,.NUR_BALLON
        CP      2
        JR      NZ,.ZEICHNEN
        CALL    HIMMEL_CLOUD1_LINKS
        CALL    HIMMEL_BLITZ_START_PRUEFEN
        LD      A,(SKY_PARALLAX)
        INC     A
        LD      (SKY_PARALLAX),A
        AND     1
        CALL    Z,HIMMEL_CLOUD2_LINKS
        JR      .ZEICHNEN
.NUR_BALLON:
        LD      A,(SKY_BALLOON_VISIBLE)
        OR      A
        CALL    NZ,HIMMEL_BALLON_LINKS
        JR      .ZEICHNEN
.ACC_SPEICHERN:
        LD      (SKY_MOVE_ACC),A
.ZEICHNEN:
        JP      HIMMEL_ALLES_ZEICHNEN

; Nur die Gewitterkurse koennen einen Blitz starten. Eine dunkle Wolke darf
; pro Bildschirmdurchlauf genau einmal werfen. Der Einschlagspunkt wird mit
; einem 8-Bit-LFSR bestimmt und ist nicht mehr an das Motorrad gekoppelt.
HIMMEL_BLITZ_START_PRUEFEN:
        LD      A,(SKY_MODE)
        CP      2
        RET     NZ
        LD      A,(SKY_LIGHTNING_ACTIVE)
        OR      A
        RET     NZ
        LD      A,(SKY_STRIKE_DONE)
        OR      A
        RET     NZ
        LD      A,(SKY_CLOUD1_X)
        CP      21                     ; erst nach dem Dunkelwerden
        RET     NC
        CP      2                      ; spaetestens kurz vor dem linken Rand
        JR      Z,.START
        CALL    HIMMEL_ZUFALL
        AND     7                       ; je Bewegungsschritt 1:8 Chance
        RET     NZ
.START:
        LD      A,1                    ; exakt ein sichtbares Bild
        LD      (SKY_LIGHTNING_ACTIVE),A
        LD      A,1
        LD      (SKY_STRIKE_DONE),A
        CALL    SOUND_LIGHTNING_START
        RET

; Maximallaengiges 8-Bit-Galois-LFSR. Der Zustand bleibt auch nach einem
; Sturz erhalten, damit ein neuer Versuch nicht dieselbe Blitzfolge erhaelt.
HIMMEL_ZUFALL:
        LD      A,(SKY_RNG)
        RRCA
        JR      NC,.OHNE_XOR
        XOR     0B8h
.OHNE_XOR:
        LD      (SKY_RNG),A
        RET

HIMMEL_CLOUD1_LINKS:
        LD      A,(SKY_CLOUD1_X)
        OR      A
        JR      Z,.NEUER_DURCHLAUF
        DEC     A
        LD      (SKY_CLOUD1_X),A
        RET
.NEUER_DURCHLAUF:
        LD      A,30
        LD      (SKY_CLOUD1_X),A
        XOR     A
        LD      (SKY_STRIKE_DONE),A
        RET
HIMMEL_CLOUD2_LINKS:
        LD      HL,SKY_CLOUD2_X
        JP      HIMMEL_X_LINKS
HIMMEL_BALLON_LINKS:
        LD      HL,SKY_BALLOON_X
HIMMEL_X_LINKS:
        LD      A,(HL)
        OR      A
        JR      Z,.RECHTS
        DEC     A
        LD      (HL),A
        RET
.RECHTS:
        LD      (HL),30
        RET

HIMMEL_ALLES_LOESCHEN:
        LD      A,(SKY_MODE)
        CP      2
        JR      NZ,.KEINE_WOLKEN
        LD      HL,SKY_CLOUD
        LD      A,(SKY_CLOUD1_X)
        LD      C,A
        LD      A,SKY_CLOUD1_Y
        LD      B,SKY_CLOUD_ROWS
        LD      D,0
        CALL    SKY_SPRITE_2BYTE
        LD      HL,SKY_CLOUD
        LD      A,(SKY_CLOUD2_X)
        LD      C,A
        LD      A,SKY_CLOUD2_Y
        LD      B,SKY_CLOUD_ROWS
        LD      D,0
        CALL    SKY_SPRITE_2BYTE
.KEINE_WOLKEN:
        LD      A,(SKY_BALLOON_VISIBLE)
        OR      A
        CALL    NZ,HIMMEL_BALLON_LOESCHEN
        LD      A,(SKY_LIGHTNING_ACTIVE)
        OR      A
        RET     Z
        LD      HL,SKY_LIGHTNING
        LD      A,(SKY_CLOUD1_X)
        LD      C,A
        INC     C
        LD      A,SKY_LIGHTNING_Y
        LD      B,SKY_LIGHTNING_ROWS
        LD      D,0
        JP      SKY_SPRITE_2BYTE

HIMMEL_ALLES_ZEICHNEN:
        LD      A,(SKY_MODE)
        CP      2
        JR      NZ,.KEINE_WOLKEN
        LD      D,0Fh                  ; helle Wolke
        LD      A,(SKY_CLOUD1_X)
        CP      21                     ; sieben Spalten Vorwarnung
        JR      NC,.CLOUD1
        LD      D,08h                  ; dunkle Gewitterwolke
.CLOUD1:
        LD      HL,SKY_CLOUD
        LD      A,(SKY_CLOUD1_X)
        LD      C,A
        LD      A,SKY_CLOUD1_Y
        LD      B,SKY_CLOUD_ROWS
        CALL    SKY_SPRITE_2BYTE

        LD      HL,SKY_CLOUD
        LD      A,(SKY_CLOUD2_X)
        LD      C,A
        LD      A,SKY_CLOUD2_Y
        LD      B,SKY_CLOUD_ROWS
        LD      D,07h                  ; entferntere graue Wolke
        CALL    SKY_SPRITE_2BYTE
.KEINE_WOLKEN:
        LD      A,(SKY_BALLOON_VISIBLE)
        OR      A
        JR      Z,.KEIN_BALLON
        LD      HL,SKY_BALLOON
        LD      A,(SKY_BALLOON_X)
        LD      C,A
        LD      A,(SKY_BALLOON_Y)
        LD      B,SKY_BALLOON_ROWS
        LD      D,0Eh                  ; gelber Ballon
        CALL    SKY_SPRITE_2BYTE
.KEIN_BALLON:

        LD      A,(SKY_LIGHTNING_ACTIVE)
        OR      A
        RET     Z
        LD      HL,SKY_LIGHTNING
        LD      A,(SKY_CLOUD1_X)
        LD      C,A
        INC     C
        LD      A,SKY_LIGHTNING_Y
        LD      B,SKY_LIGHTNING_ROWS
        LD      D,0Fh
        JP      SKY_SPRITE_2BYTE

HIMMEL_BALLON_LOESCHEN:
        LD      HL,SKY_BALLOON
        LD      A,(SKY_BALLOON_X)
        LD      C,A
        LD      A,(SKY_BALLOON_Y)
        LD      B,SKY_BALLOON_ROWS
        LD      D,0
        JP      SKY_SPRITE_2BYTE

; HL=2 Bytes breite Spritezeilen, A=y, C=Byte-x, B=Hoehe, D=Farbattribut.
; Die Routine XORt die Pixelmaske und setzt danach die beiden zugehoerigen
; Farbattribute. Mit D=0 wird ein zuvor gezeichnetes Objekt sauber geloescht.
SKY_SPRITE_2BYTE:
        LD      (SKY_TEMP_Y),A
        LD      A,C
        LD      (SKY_TEMP_X),A
        LD      A,B
        LD      (SKY_TEMP_H),A
        LD      A,D
        LD      (SKY_TEMP_COLOR),A
        PUSH    HL
        POP     IX
        LD      A,(SKY_TEMP_Y)
        LD      B,C
        CALL    VRAM_ZEILENADRESSE_DE
        EX      DE,HL
        LD      A,(SKY_TEMP_H)
        LD      B,A
.PIXELZEILE:
        LD      A,(IX+0)
        XOR     (HL)
        LD      (HL),A
        INC     HL
        LD      A,(IX+1)
        XOR     (HL)
        LD      (HL),A
        INC     HL
        LD      DE,30
        ADD     HL,DE
        INC     IX
        INC     IX
        DJNZ    .PIXELZEILE

        XOR     A
        OUT     (24h),A
        LD      A,(SKY_TEMP_Y)
        PUSH    AF
        LD      A,(SKY_TEMP_X)
        LD      B,A
        POP     AF
        CALL    VRAM_ZEILENADRESSE_DE
        EX      DE,HL
        LD      A,(SKY_TEMP_H)
        LD      B,A
        LD      A,(SKY_TEMP_COLOR)
        LD      C,A
.FARBZEILE:
        LD      A,C
        LD      (HL),A
        INC     HL
        LD      (HL),A
        INC     HL
        LD      DE,30
        ADD     HL,DE
        DJNZ    .FARBZEILE
        XOR     A
        OUT     (20h),A
        RET

; Ballon und Blitz sind durch SKY_MODE gegenseitig ausgeschlossen. Der Ballon
; bringt bei einer echten Spriteueberdeckung 100 Punkte und verschwindet. Der
; Blitz kollidiert nur, wenn seine aktuelle sichtbare Zwei-Byte-Maske das
; Motorrad tatsaechlich ueberdeckt. Einschlaege davor oder dahinter sind harmlos.
HIMMEL_KOLLISION:
        XOR     A
        LD      (LIGHTNING_HIT),A
        LD      A,(SKY_MODE)
        CP      1
        JR      Z,.BALLON
        CP      2
        JR      NZ,.KEIN_TREFFER
        LD      A,(SKY_LIGHTNING_ACTIVE)
        OR      A
        JR      Z,.KEIN_TREFFER
        LD      A,(SKY_CLOUD1_X)
        INC     A                       ; Blitz beginnt ein Byte in der Wolke
        CP      BIKE_COLUMN+1
        JR      NC,.KEIN_TREFFER
        INC     A                       ; rechte Blitzspalte
        CP      BIKE_REAR_COLUMN
        JR      C,.KEIN_TREFFER
        LD      A,1
        LD      (LIGHTNING_HIT),A
        SCF
        RET
.BALLON:
        LD      A,(SKY_BALLOON_VISIBLE)
        OR      A
        JR      Z,.KEIN_TREFFER
        ; Horizontale Ueberdeckung der zwei Ballonbytes mit Byte 14..16.
        LD      A,(SKY_BALLOON_X)
        CP      BIKE_COLUMN+1
        JR      NC,.KEIN_TREFFER
        INC     A
        CP      BIKE_REAR_COLUMN
        JR      C,.KEIN_TREFFER
        ; Vertikale Ueberdeckung der beiden 16-Pixel-Sprites.
        LD      A,(BIKE_Y)
        LD      B,A
        LD      A,(SKY_BALLOON_Y)
        ADD     A,15
        CP      B
        JR      C,.KEIN_TREFFER
        LD      A,B
        ADD     A,15
        LD      B,A
        LD      A,(SKY_BALLOON_Y)
        CP      B
        JR      C,.EINSAMMELN
        JR      Z,.EINSAMMELN
        JR      .KEIN_TREFFER
.EINSAMMELN:
        CALL    HIMMEL_BALLON_LOESCHEN
        XOR     A
        LD      (SKY_BALLOON_VISIBLE),A
        CALL    SOUND_BALLOON_START
        LD      HL,(SCORE)
        LD      DE,100
        ADD     HL,DE
        LD      DE,10000
        OR      A
        SBC     HL,DE
        JR      NC,.MAXIMUM
        ADD     HL,DE
        JR      .SPEICHERN
.MAXIMUM:
        LD      HL,9999
.SPEICHERN:
        LD      (SCORE),HL
        CALL    STATUS_AKTUALISIEREN
        OR      A
        RET
.KEIN_TREFFER:
        OR      A                       ; Carry zwingend loeschen
        RET

; -----------------------------------------------------------------------------
; Status und Zeit
; -----------------------------------------------------------------------------

ZEIT_AKTUALISIEREN:
        LD      A,(FRAME_COUNT)
        INC     A
        LD      (FRAME_COUNT),A
        CP      50
        JR      C,.OK
        XOR     A
        LD      (FRAME_COUNT),A
        LD      A,(TIME_LEFT)
        OR      A
        JR      Z,.TIMEOUT
        DEC     A
        LD      (TIME_LEFT),A
        CALL    STATUS_AKTUALISIEREN
        OR      A
        RET     NZ
.TIMEOUT:
        SCF
        RET
.OK:
        OR      A
        RET

STATUS_AKTUALISIEREN:
        CALL    HIGH_SCORE_AKTUALISIEREN
        LD      A,(TIME_LEFT)
        LD      B,5
        LD      C,1
        CALL    U8_ZWEI_STELLEN
        LD      HL,(SCORE)
        LD      B,14
        LD      C,1
        CALL    U16_VIER_STELLEN
        LD      HL,(HIGH_SCORE)
        LD      B,24
        LD      C,1
        CALL    U16_VIER_STELLEN
        JP      HUD_AKTUALISIEREN

HIGH_SCORE_AKTUALISIEREN:
        LD      HL,(HIGH_SCORE)
        EX      DE,HL
        LD      HL,(SCORE)
        OR      A
        SBC     HL,DE
        RET     C
        RET     Z
        LD      HL,(SCORE)
        LD      (HIGH_SCORE),HL
        RET

; -----------------------------------------------------------------------------
; Zieleinfahrt nach dem Vorbild des C16/Plus-4-Originals
; -----------------------------------------------------------------------------

; Die Strecke und das Motorrad bleiben stehen. Nur der schwarze Himmel wird
; fuer die weisse Bonusanzeige geleert. Restzeit und Motorradbonus laufen
; sichtbar gegen Null, waehrend SCORE um den Kursfaktor steigt.
ZIELAUSWERTUNG:
        CALL    SOUND_SILENCE
        CALL    ERGEBNISFELD_LOESCHEN
        XOR     A
        LD      (BONUS_TICK_PHASE),A

        LD      HL,TEXT_TIME_BONUS
        LD      B,4
        LD      C,5
        CALL    TEXT_ZEICHNEN
        LD      HL,TEXT_BIKE_BONUS
        LD      B,4
        LD      C,6
        CALL    TEXT_ZEICHNEN
        LD      A,(BIKES)
        CP      5
        JR      NZ,.BIKES_ZAHL
        LD      HL,TEXT_FIVE_BIKES_STILL
        LD      B,4
        LD      C,7
        CALL    TEXT_ZEICHNEN
        JR      .BIKES_TEXT_FERTIG
.BIKES_ZAHL:
        LD      A,(BIKES)
        ADD     A,'0'
        LD      B,4
        LD      C,7
        CALL    ZEICHEN_ZEICHNEN
        LD      HL,TEXT_BIKES_STILL
        LD      B,6
        LD      C,7
        CALL    TEXT_ZEICHNEN
.BIKES_TEXT_FERTIG:

        ; Wie im Original wird aus der Restzeit ein Zehntelsekundenwert:
        ; 17 Sekunden erscheinen zum Beispiel als Bonus 170.
        LD      A,(TIME_LEFT)
        LD      L,A
        LD      H,0
        ADD     HL,HL                   ; x2
        LD      D,H
        LD      E,L
        ADD     HL,HL                   ; x4
        ADD     HL,HL                   ; x8
        ADD     HL,DE                   ; x10
        LD      (TIME_BONUS),HL

        ; 1..5 Motorraeder ergeben 019,039,059,079,099 Bonuspunkte.
        LD      A,(BIKES)
        LD      B,A
        LD      HL,0
        LD      DE,20
.BIKE_BONUS_AUFBAUEN:
        ADD     HL,DE
        DJNZ    .BIKE_BONUS_AUFBAUEN
        DEC     HL
        LD      A,L
        LD      (BIKE_BONUS),A

        ; Kurs 1..5 verwendet x1..x5, spaetere Kurse bleiben bei x5.
        LD      A,(COURSE)
        INC     A
        CP      6
        JR      C,.FAKTOR_OK
        LD      A,5
.FAKTOR_OK:
        LD      (BONUS_FACTOR),A
        ADD     A,'0'
        LD      B,30
        LD      C,5
        CALL    ZEICHEN_ZEICHNEN
        LD      A,'X'
        LD      B,29
        LD      C,5
        CALL    ZEICHEN_ZEICHNEN
        CALL    BONUS_SCHRITT_BERECHNEN
        CALL    BONUSWERTE_ZEICHNEN
        CALL    BONUS_LESEPAUSE

.ZEIT_HERUNTER:
        LD      HL,(TIME_BONUS)
        LD      A,H
        OR      L
        JR      Z,.ZEIT_FERTIG
        ; Pro sichtbarem/hoerbarem Impuls werden je nach Gesamtbonus 1..9
        ; Einheiten uebertragen. Der letzte Schritt wird exakt begrenzt.
        LD      A,(BONUS_STEP)
        LD      E,A
        LD      D,0
        OR      A
        SBC     HL,DE
        JR      NC,.ZEIT_SCHRITT_OK
        ADD     HL,DE                   ; alten Restwert wiederherstellen
        LD      A,L                     ; dieser Rest ist der letzte Schritt
        LD      E,A
        LD      HL,0
.ZEIT_SCHRITT_OK:
        LD      (TIME_BONUS),HL
        LD      A,E
        CALL    BONUS_MEHRFACH_ZUM_SCORE
        LD      HL,(TIME_BONUS)
        LD      B,24
        LD      C,5
        CALL    U16_DREI_STELLEN
        CALL    SCORE_VIERSTELLIG_ZEICHNEN
        CALL    SOUND_BONUS_TICK
        CALL    BONUS_KURZ_PAUSE
        JR      .ZEIT_HERUNTER

.ZEIT_FERTIG:
        CALL    SOUND_SILENCE
        CALL    BONUS_LESEPAUSE

.BIKES_HERUNTER:
        LD      A,(BIKE_BONUS)
        OR      A
        JR      Z,.ABRECHNUNG_FERTIG
        LD      B,A                     ; alter Restwert
        LD      A,(BONUS_STEP)
        LD      C,A
        LD      A,B
        CP      C
        JR      C,.BIKE_LETZTER_SCHRITT
        SUB     C
        LD      (BIKE_BONUS),A
        LD      A,C
        JR      .BIKE_SCORE
.BIKE_LETZTER_SCHRITT:
        XOR     A
        LD      (BIKE_BONUS),A
        LD      A,B
.BIKE_SCORE:
        CALL    BONUS_MEHRFACH_ZUM_SCORE
        LD      A,(BIKE_BONUS)
        LD      L,A
        LD      H,0
        LD      B,24
        LD      C,6
        CALL    U16_DREI_STELLEN
        CALL    SCORE_VIERSTELLIG_ZEICHNEN
        CALL    SOUND_BONUS_TICK
        CALL    BONUS_KURZ_PAUSE
        JR      .BIKES_HERUNTER
.ABRECHNUNG_FERTIG:
        CALL    SOUND_SILENCE
        JP      BONUS_LESEPAUSE

BONUSWERTE_ZEICHNEN:
        LD      HL,(TIME_BONUS)
        LD      B,24
        LD      C,5
        CALL    U16_DREI_STELLEN
        LD      A,(BIKE_BONUS)
        LD      L,A
        LD      H,0
        LD      B,24
        LD      C,6
        JP      U16_DREI_STELLEN

; Gesamtbonus 1..699 wird auf hoechstens etwa 80 sichtbare Zaehlschritte
; verteilt. Damit bleibt die reine Zaehldauer sicher unter vier Sekunden.
; Bei kleinem Bonus bleibt die Einzelschrittzaehlung erhalten.
BONUS_SCHRITT_BERECHNEN:
        LD      HL,(TIME_BONUS)
        LD      A,(BIKE_BONUS)
        LD      E,A
        LD      D,0
        ADD     HL,DE
        LD      B,1
        LD      DE,80
.ACHTZIG:
        OR      A
        SBC     HL,DE
        JR      C,.FERTIG
        JR      Z,.FERTIG
        INC     B
        JR      .ACHTZIG
.FERTIG:
        LD      A,B
        LD      (BONUS_STEP),A
        RET

; A=Anzahl der in diesem sichtbaren Schritt uebertragenen Bonuseinheiten.
BONUS_MEHRFACH_ZUM_SCORE:
        LD      B,A
.ADD:
        PUSH    BC
        CALL    BONUS_ZUM_SCORE
        POP     BC
        DJNZ    .ADD
        RET

; Addiert den Kursfaktor und begrenzt die vierstellige Anzeige auf 9999.
BONUS_ZUM_SCORE:
        LD      HL,(SCORE)
        LD      A,(BONUS_FACTOR)
        LD      E,A
        LD      D,0
        ADD     HL,DE
        LD      DE,10000
        OR      A
        SBC     HL,DE
        JR      NC,.MAXIMUM
        ADD     HL,DE
        LD      (SCORE),HL
        RET
.MAXIMUM:
        LD      HL,9999
        LD      (SCORE),HL
        RET

SCORE_VIERSTELLIG_ZEICHNEN:
        CALL    HIGH_SCORE_AKTUALISIEREN
        LD      HL,(SCORE)
        LD      B,14
        LD      C,1
        CALL    U16_VIER_STELLEN
        LD      HL,(HIGH_SCORE)
        LD      B,24
        LD      C,1
        JP      U16_VIER_STELLEN

; y=32..127 wird geloescht und im Attributspeicher weiss vorbereitet.
ERGEBNISFELD_LOESCHEN:
        XOR     A
        OUT     (20h),A
        LD      HL,0B400h
        LD      DE,0B401h
        LD      BC,00BFFh
        LD      (HL),A
        LDIR
        XOR     A
        OUT     (24h),A
        LD      HL,0B400h
        LD      BC,00C00h
        LD      A,0Fh
        CALL    FARBBEREICH_FUELLEN
        XOR     A
        OUT     (20h),A
        RET

BONUS_KURZ_PAUSE:
        PUSH    BC
        ; Etwa 40 ms bei 8 MHz. Damit dauert die im Originalvideo sichtbare
        ; Abrechnung von 171+099 Einheiten ungefaehr zehn Sekunden.
        LD      BC,03000h
.PAUSE:
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,.PAUSE
        POP     BC
        RET

; Startwert, Phasenwechsel und Endstand bleiben kurz lesbar stehen.
BONUS_LESEPAUSE:
        PUSH    AF
        LD      A,32
.FRAME:
        PUSH    AF
        CALL    FRAME_PAUSE
        POP     AF
        DEC     A
        JR      NZ,.FRAME
        POP     AF
        RET

; Das Original begleitet die herunterlaufenden Zahlen mit einer gepulsten,
; vollen TED-Zaehlimpulsfolge. Zwei leicht versetzte Stimmen ersetzen den
; zuvor zu duennen, Z1013-artigen Einzelton.
SOUND_BONUS_TICK:
        PUSH    AF
        PUSH    DE
        PUSH    HL
        LD      A,(BONUS_TICK_PHASE)
        INC     A
        AND     7
        LD      (BONUS_TICK_PHASE),A
        BIT     0,A
        JR      NZ,.STUMM
        SRL     A
        ADD     A,A
        LD      E,A
        LD      D,0
        LD      HL,SOUND_BONUS_TABLE
        ADD     HL,DE
        LD      A,(HL)
        OUT     (PORT_TED_V1_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V1_HI),A
        LD      HL,SOUND_BONUS_TABLE_V2
        ADD     HL,DE
        LD      A,(HL)
        OUT     (PORT_TED_V2_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V2_HI),A
        LD      A,0B3h                  ; Reload + beide Stimmen, Pegel 3
        OUT     (PORT_TED_CTRL),A
        LD      A,033h
        OUT     (PORT_TED_CTRL),A
        JR      .FERTIG
.STUMM:
        XOR     A
        OUT     (PORT_TED_CTRL),A
.FERTIG:
        POP     HL
        POP     DE
        POP     AF
        RET

; Zeigt vor dem Neuaufbau der Strecke die naechste Kursnummer gross an.
NAECHSTER_KURS_ANZEIGEN:
        CALL    ERGEBNISFELD_LOESCHEN
        LD      HL,TEXT_COURSE
        LD      B,13
        LD      C,5
        CALL    TEXT_ZEICHNEN
        LD      A,(COURSE)
        LD      E,A
        LD      D,0
        LD      HL,ROMAN_POSITIONEN
        ADD     HL,DE
        LD      B,(HL)
        LD      A,E
        ADD     A,A
        LD      E,A
        LD      D,0
        LD      HL,ROMAN_POINTER
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        LD      C,8
        CALL    TEXT_GROSS_ZEICHNEN
        LD      A,24
.WARTEN:
        PUSH    AF
        CALL    FRAME_PAUSE
        POP     AF
        DEC     A
        JR      NZ,.WARTEN
        RET

; Die obere Haelfte der unteren Statuszeile wird dynamisch aufgebaut:
; links bis zu fuenf exakte 24x16-Fahrsprites, rechts die bereits gewonnenen
; Kursfaehnchen. Die Beschriftungen BIKES und COURSE bleiben entfernt.
; Nach jedem Sturz verschwindet ein Motorrad, nach jedem Ziel kommt eine
; Flagge hinzu. COURSE ist nullbasiert und entspricht nach dem Kurswechsel
; genau der Anzahl der bereits abgeschlossenen Strecken.
HUD_AKTUALISIEREN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL

        XOR     A
        OUT     (20h),A
        CALL    HUD_OBERHAELFTE_LOESCHEN
        CALL    HUD_BIKES_PIXEL
        CALL    HUD_COURSES_PIXEL

        XOR     A
        OUT     (24h),A
        CALL    HUD_OBERHAELFTE_LOESCHEN
        CALL    HUD_BIKES_FARBE
        CALL    HUD_COURSES_FARBE

        XOR     A
        OUT     (20h),A
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; A muss beim Eintritt Null sein. Es werden nur die oberen 16 Zeilen des
; unteren Statusfelds geloescht; die Beschriftungen darunter bleiben erhalten.
HUD_OBERHAELFTE_LOESCHEN:
        LD      HL,STATUS_BOTTOM
        LD      B,16
.ZEILE:
        LD      C,32
.BYTE:
        LD      (HL),A
        INC     HL
        DEC     C
        JR      NZ,.BYTE
        DJNZ    .ZEILE
        RET

HUD_BIKES_PIXEL:
        LD      A,(BIKES)
        OR      A
        RET     Z
        LD      B,A
        LD      DE,STATUS_BOTTOM
.BIKE:
        PUSH    BC
        PUSH    DE
        LD      HL,SPRITE_RIDE0
        CALL    HUD_BIKE_PIXEL_BLIT
        POP     DE
        INC     DE
        INC     DE
        INC     DE
        POP     BC
        DJNZ    .BIKE
        RET

HUD_BIKES_FARBE:
        LD      A,(BIKES)
        OR      A
        RET     Z
        LD      B,A
        LD      DE,STATUS_BOTTOM
.BIKE:
        PUSH    BC
        PUSH    DE
        LD      HL,SPRITE_FARBE_RIDE0
        CALL    HUD_BIKE_FARB_BLIT
        POP     DE
        INC     DE
        INC     DE
        INC     DE
        POP     BC
        DJNZ    .BIKE
        RET

; HL zeigt auf 3 x 16 Spritebytes, DE auf die linke obere Zielposition.
HUD_BIKE_PIXEL_BLIT:
        LD      B,16
.ZEILE:
        LD      A,(HL)
        LD      (DE),A
        INC     HL
        INC     DE
        LD      A,(HL)
        LD      (DE),A
        INC     HL
        INC     DE
        LD      A,(HL)
        LD      (DE),A
        INC     HL
        INC     DE
        PUSH    HL
        LD      HL,29
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        DJNZ    .ZEILE
        RET

; Wie der Pixel-Blitter, jedoch wird FFh aus der Sprite-Farbmaske in schwarzen
; Hintergrund umgesetzt. Sichtbare Teile behalten damit exakt die Farben des
; grossen Motorrads.
HUD_BIKE_FARB_BLIT:
        LD      B,16
.ZEILE:
        LD      C,3
.BYTE:
        LD      A,(HL)
        CP      0FFh
        JR      NZ,.FARBE
        XOR     A
.FARBE:
        LD      (DE),A
        INC     HL
        INC     DE
        DEC     C
        JR      NZ,.BYTE
        PUSH    HL
        LD      HL,29
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        DJNZ    .ZEILE
        RET

HUD_COURSES_PIXEL:
        LD      A,(COURSE)
        OR      A
        RET     Z
        LD      B,A
        LD      DE,STATUS_BOTTOM+21
.FLAGGE:
        PUSH    BC
        PUSH    DE
        LD      HL,HUD_FLAGGE
        CALL    HUD_FLAG_PIXEL_BLIT
        POP     DE
        INC     DE
        POP     BC
        DJNZ    .FLAGGE
        RET

HUD_COURSES_FARBE:
        LD      A,(COURSE)
        OR      A
        RET     Z
        LD      B,A
        LD      DE,STATUS_BOTTOM+21
.FLAGGE:
        PUSH    BC
        PUSH    DE
        CALL    HUD_FLAG_FARB_BLIT
        POP     DE
        INC     DE
        POP     BC
        DJNZ    .FLAGGE
        RET

; Eine 8 x 16-Pixel-Flagge; zwischen den Flaggen bleibt im Byte selbst eine
; schmale schwarze Trennlinie bestehen.
HUD_FLAG_PIXEL_BLIT:
        LD      B,16
.ZEILE:
        LD      A,(HL)
        LD      (DE),A
        INC     HL
        PUSH    HL
        LD      HL,32
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        DJNZ    .ZEILE
        RET

HUD_FLAG_FARB_BLIT:
        LD      B,16
.ZEILE:
        LD      A,0Eh
        LD      (DE),A
        LD      HL,32
        ADD     HL,DE
        EX      DE,HL
        DJNZ    .ZEILE
        RET

U8_ZWEI_STELLEN:
        LD      D,'0'
.TEN:
        CP      10
        JR      C,.TEN_DONE
        SUB     10
        INC     D
        JR      .TEN
.TEN_DONE:
        LD      E,A
        LD      A,D
        PUSH    DE
        PUSH    BC
        CALL    ZEICHEN_ZEICHNEN
        POP     BC
        POP     DE
        INC     B
        LD      A,E
        ADD     A,'0'
        JP      ZEICHEN_ZEICHNEN

U16_DREI_STELLEN:
        LD      DE,100
        CALL    U16_ZIFFER
        INC     B
        LD      DE,10
        CALL    U16_ZIFFER
        INC     B
        LD      A,L
        ADD     A,'0'
        JP      ZEICHEN_ZEICHNEN

U16_VIER_STELLEN:
        LD      DE,1000
        CALL    U16_ZIFFER
        INC     B
        LD      DE,100
        CALL    U16_ZIFFER
        INC     B
        LD      DE,10
        CALL    U16_ZIFFER
        INC     B
        LD      A,L
        ADD     A,'0'
        JP      ZEICHEN_ZEICHNEN

U16_ZIFFER:
        LD      A,'0'
.LOOP:
        OR      A
        SBC     HL,DE
        JR      C,.DONE
        INC     A
        JR      .LOOP
.DONE:
        ADD     HL,DE
        PUSH    HL
        PUSH    BC
        CALL    ZEICHEN_ZEICHNEN
        POP     BC
        POP     HL
        RET

; A=ASCII, B=Zeichenspalte, C=Zeichenzeile
ZEICHEN_ZEICHNEN:
        PUSH    BC
        LD      L,A
        LD      H,0
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        LD      DE,ZEICHEN_FONT
        ADD     HL,DE
        PUSH    HL
        POP     IX
        POP     BC
        LD      A,0B0h
        ADD     A,C
        LD      D,A
        LD      E,B
        LD      B,8
.GLYPH:
        LD      A,(IX+0)
        LD      (DE),A
        INC     IX
        LD      A,E
        ADD     A,32
        LD      E,A
        JR      NC,.NO_CARRY
        INC     D
.NO_CARRY:
        DJNZ    .GLYPH
        RET

; HL=Null-terminierter Text, B=Spalte, C=Zeile.
TEXT_ZEICHNEN:
        LD      A,(HL)
        OR      A
        RET     Z
        PUSH    HL
        PUSH    BC
        CALL    ZEICHEN_ZEICHNEN
        POP     BC
        POP     HL
        INC     HL
        INC     B
        JR      TEXT_ZEICHNEN

; Wie TEXT_ZEICHNEN, aber jedes Pixel wird auf 2x2 Bildpunkte vergroessert.
; Ein Zeichen belegt dadurch zwei Byte-Spalten und 16 Pixelzeilen.
TEXT_GROSS_ZEICHNEN:
        LD      A,(HL)
        OR      A
        RET     Z
        PUSH    HL
        PUSH    BC
        CALL    ZEICHEN_GROSS_ZEICHNEN
        POP     BC
        POP     HL
        INC     HL
        INC     B
        INC     B
        JR      TEXT_GROSS_ZEICHNEN

; A=ASCII, B=Byte-Spalte, C=Zeichenzeile.
ZEICHEN_GROSS_ZEICHNEN:
        PUSH    IX
        PUSH    IY
        PUSH    BC
        LD      L,A
        LD      H,0
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        LD      DE,ZEICHEN_FONT
        ADD     HL,DE
        PUSH    HL
        POP     IX
        POP     BC
        LD      A,0B0h
        ADD     A,C
        LD      D,A
        LD      E,B
        PUSH    DE
        POP     IY
        LD      C,8
.GROSS_ZEILE:
        LD      A,(IX+0)
        LD      B,A
        RRCA
        RRCA
        RRCA
        RRCA
        AND     0Fh
        CALL    NIBBLE_DOPPELN
        LD      D,A
        LD      A,B
        AND     0Fh
        CALL    NIBBLE_DOPPELN
        LD      E,A
        LD      (IY+0),D
        LD      (IY+1),E
        LD      (IY+32),D
        LD      (IY+33),E
        INC     IX
        PUSH    DE
        LD      DE,64
        ADD     IY,DE
        POP     DE
        DEC     C
        JR      NZ,.GROSS_ZEILE
        POP     IY
        POP     IX
        RET

; A=4-Bit-Muster, A=horizontal auf acht Bits verdoppeltes Muster.
NIBBLE_DOPPELN:
        PUSH    DE
        PUSH    HL
        LD      L,A
        LD      H,0
        LD      DE,DOPPEL_NIBBLE
        ADD     HL,DE
        LD      A,(HL)
        POP     HL
        POP     DE
        RET

; -----------------------------------------------------------------------------
; TED-Sound
; -----------------------------------------------------------------------------

; Wird einmal pro Hauptschleife aufgerufen. Im Normalbetrieb bilden beide
; leicht gegeneinander verstimmten Stimmen einen lebendig knatternden Motor.
; Beim Sprung ersetzt eine ansteigende Tonfolge kurz die zweite Motorstimme.
; Alle Register werden gesichert, damit Grafik und Physik unbeeinflusst bleiben.
SOUND_SERVICE:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        ; Acht Phasen bilden die Zuendfolge. Die spaetere Pegeltabelle enthaelt
        ; je Fahrstufe immer dichtere Pulse, ohne bei einer Stufe durch eine
        ; unguenstige Teilung in einem monotonen Zustand stehenzubleiben.
        LD      A,(ENGINE_PHASE)
        INC     A
        AND     7
        LD      (ENGINE_PHASE),A
        CALL    SOUND_ENGINE_RPM_UPDATE
        CALL    SOUND_ENGINE_FREQUENCY
        LD      A,(SFX_TIMER)
        OR      A
        JP      Z,.NUR_MOTOR
        LD      B,A
        LD      A,(SFX_KIND)
        CP      2
        JR      Z,.BALLON
        CP      3
        JR      Z,.BLITZ
        ; SFX_KIND=1: bisheriger Sprung-Chirp.
        LD      A,12
        SUB     B
        ADD     A,A
        LD      E,A
        LD      D,0
        LD      HL,SOUND_JUMP_TABLE
        ADD     HL,DE
        LD      A,(HL)
        OUT     (PORT_TED_V2_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V2_HI),A
        LD      A,B
        DEC     A
        LD      (SFX_TIMER),A
        LD      A,035h                  ; Motor + Sprung-Chirp, Lautstaerke 5
        OUT     (PORT_TED_CTRL),A
        JR      .FERTIG

.BALLON:
        LD      A,8
        SUB     B
        ADD     A,A
        LD      E,A
        LD      D,0
        LD      HL,SOUND_BALLOON_V1_TABLE
        ADD     HL,DE
        LD      A,(HL)
        OUT     (PORT_TED_V1_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V1_HI),A
        LD      HL,SOUND_BALLOON_NOISE_TABLE
        ADD     HL,DE
        LD      A,(HL)
        OUT     (PORT_TED_V2_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V2_HI),A
        SRL     E
        LD      HL,SOUND_BALLOON_CTRL
        ADD     HL,DE
        LD      A,(HL)
        OUT     (PORT_TED_CTRL),A
        AND     7Fh
        OUT     (PORT_TED_CTRL),A
        DEC     B
        LD      A,B
        LD      (SFX_TIMER),A
        JR      .FERTIG

.BLITZ:
        LD      A,12
        SUB     B
        ADD     A,A
        LD      E,A
        LD      D,0
        LD      HL,SOUND_LIGHTNING_V1_TABLE
        ADD     HL,DE
        LD      A,(HL)
        OUT     (PORT_TED_V1_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V1_HI),A
        LD      HL,SOUND_LIGHTNING_NOISE_TABLE
        ADD     HL,DE
        LD      A,(HL)
        OUT     (PORT_TED_V2_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V2_HI),A
        SRL     E
        LD      HL,SOUND_LIGHTNING_CTRL
        ADD     HL,DE
        LD      A,(HL)
        OUT     (PORT_TED_CTRL),A
        AND     7Fh
        OUT     (PORT_TED_CTRL),A
        DEC     B
        LD      A,B
        LD      (SFX_TIMER),A
        JR      .FERTIG
.NUR_MOTOR:
        LD      A,(SPEED)
        CP      5
        JR      C,.PULS_SPEED_OK
        LD      A,4
.PULS_SPEED_OK:
        ADD     A,A
        ADD     A,A
        ADD     A,A                  ; Fahrstufe * 8
        LD      E,A
        LD      A,(ENGINE_PHASE)
        ADD     A,E
        LD      E,A
        LD      D,0
        LD      HL,SOUND_ENGINE_PULSE_TABLE
        ADD     HL,DE
        LD      A,(HL)                  ; fahrstufenabhaengige Zuendimpulse
        OUT     (PORT_TED_CTRL),A
.FERTIG:
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; Die fuenf Fahrstufen liefern nur den Sollwert. ENGINE_RPM_STEP gleitet in
; 64 kleinen Schritten von 800 bis 4000 U/min, sodass die Drehzahl nach dem
; Gasgeben oder Bremsen kontinuierlich steigt bzw. faellt. Der hoerbare
; Grundbereich 110..424 Hz ist am oberen Ende eine halbe Oktave abgesenkt.
; Der zweite Kanal ist absichtlich kein exakter Oktavton.
SOUND_ENGINE_RPM_UPDATE:
        LD      A,(FINISH_ROLLING)
        OR      A
        JR      Z,.NORMALE_DREHZAHL
        LD      B,0                  ; Zieleinfahrt: Sollwert Standgas
        JR      .SOLLWERT_BEREIT
.NORMALE_DREHZAHL:
        LD      A,(SPEED)
        CP      5
        JR      C,.SPEED_OK
        LD      A,4
.SPEED_OK:
        ADD     A,A
        ADD     A,A
        ADD     A,A
        ADD     A,A                  ; Sollwert 0,16,32,48,64
        LD      B,A
.SOLLWERT_BEREIT:
        LD      A,(ENGINE_RPM_STEP)
        CP      B
        RET     Z
        JR      C,.HOCH
        DEC     A
        LD      (ENGINE_RPM_STEP),A
        RET
.HOCH:
        INC     A
        LD      (ENGINE_RPM_STEP),A
        RET

SOUND_ENGINE_FREQUENCY:
        LD      A,(ENGINE_RPM_STEP)
        ADD     A,A
        LD      E,A
        LD      D,0
        LD      HL,SOUND_ENGINE_TABLE
        ADD     HL,DE
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        LD      A,(ENGINE_PHASE)
        AND     3
        LD      E,A
        LD      D,0
        LD      HL,SOUND_ENGINE_WOBBLE_V1
        ADD     HL,DE
        LD      A,(HL)
        ADD     A,C
        OUT     (PORT_TED_V1_LO),A
        LD      A,B
        ADC     A,0
        OUT     (PORT_TED_V1_HI),A
        LD      A,(ENGINE_RPM_STEP)
        ADD     A,A
        LD      E,A
        LD      D,0
        LD      HL,SOUND_ENGINE_OVERTONE_TABLE
        ADD     HL,DE
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        LD      A,(ENGINE_PHASE)
        AND     3
        LD      E,A
        LD      D,0
        LD      HL,SOUND_ENGINE_WOBBLE_V2
        ADD     HL,DE
        LD      A,(HL)
        ADD     A,C
        OUT     (PORT_TED_V2_LO),A
        LD      A,B
        ADC     A,0
        OUT     (PORT_TED_V2_HI),A
        RET

SOUND_ENGINE_START:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        XOR     A
        LD      (SFX_TIMER),A
        LD      (SFX_KIND),A
        CALL    SOUND_ENGINE_FREQUENCY
        LD      A,0B2h                  ; Reload + beide Motorstimmen, Pegel 2
        OUT     (PORT_TED_CTRL),A
        LD      A,032h
        OUT     (PORT_TED_CTRL),A
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; Der nicht blockierende Timer laesst Stimme 2 in zwoelf Schritten nach oben
; gleiten. So entsteht beim Absprung ein kurzer, deutlich erkennbarer Chirp.
SOUND_JUMP_START:
        PUSH    AF
        LD      A,0D0h                  ; erster Wert aus SOUND_JUMP_TABLE
        OUT     (PORT_TED_V2_LO),A
        LD      A,002h
        OUT     (PORT_TED_V2_HI),A
        LD      A,12
        LD      (SFX_TIMER),A
        LD      A,1
        LD      (SFX_KIND),A
        LD      A,0B5h                  ; Reload + beide Stimmen, Pegel 5
        OUT     (PORT_TED_CTRL),A
        LD      A,035h
        OUT     (PORT_TED_CTRL),A
        POP     AF
        RET

; Beim Sturz laufen eine fallende Rechteckstimme und TED-Rauschen gemeinsam.
; SOUND_CRASH_STEP wird fuer jedes der sechs Explosionsbilder aufgerufen.
SOUND_CRASH_START:
        PUSH    AF
        XOR     A
        LD      (SFX_TIMER),A
        LD      (SFX_KIND),A
        LD      A,0D7h                  ; Stimme 1 + Rauschen, Reload, Pegel 7
        OUT     (PORT_TED_CTRL),A
        LD      A,057h
        OUT     (PORT_TED_CTRL),A
        POP     AF
        RET

SOUND_CRASH_STEP:
        LD      A,(LIGHTNING_HIT)
        OR      A
        JP      NZ,SOUND_LIGHTNING_CRASH_STEP
        PUSH    AF
        PUSH    DE
        PUSH    HL
        LD      A,(EXPLOSION_FRAME)
        ADD     A,A
        LD      E,A
        LD      D,0
        LD      HL,SOUND_CRASH_V1_TABLE
        ADD     HL,DE
        LD      A,(HL)
        OUT     (PORT_TED_V1_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V1_HI),A
        LD      HL,SOUND_CRASH_NOISE_TABLE
        ADD     HL,DE
        LD      A,(HL)
        OUT     (PORT_TED_V2_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V2_HI),A
        LD      A,0D7h
        OUT     (PORT_TED_CTRL),A
        LD      A,057h
        OUT     (PORT_TED_CTRL),A
        POP     HL
        POP     DE
        POP     AF
        RET

; Ein echter Blitztreffer verwendet waehrend der sechs Explosionsbilder den
; Donnerklang statt des normalen Motorrad-Sturzgeraeusches.
SOUND_LIGHTNING_CRASH_START:
        PUSH    AF
        XOR     A
        LD      (SFX_TIMER),A
        LD      (SFX_KIND),A
        POP     AF
        RET

SOUND_LIGHTNING_CRASH_STEP:
        PUSH    AF
        PUSH    DE
        PUSH    HL
        LD      A,(EXPLOSION_FRAME)
        ADD     A,A
        LD      E,A
        LD      D,0
        LD      HL,SOUND_LIGHTNING_V1_TABLE
        ADD     HL,DE
        LD      A,(HL)
        OUT     (PORT_TED_V1_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V1_HI),A
        LD      HL,SOUND_LIGHTNING_NOISE_TABLE
        ADD     HL,DE
        LD      A,(HL)
        OUT     (PORT_TED_V2_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V2_HI),A
        LD      A,(EXPLOSION_FRAME)
        LD      E,A
        LD      D,0
        LD      HL,SOUND_LIGHTNING_CTRL
        ADD     HL,DE
        LD      A,(HL)
        OUT     (PORT_TED_CTRL),A
        AND     7Fh
        OUT     (PORT_TED_CTRL),A
        POP     HL
        POP     DE
        POP     AF
        RET

SOUND_CRASH_END:
SOUND_SILENCE:
        XOR     A
        OUT     (PORT_TED_CTRL),A
        LD      (SFX_TIMER),A
        LD      (SFX_KIND),A
        RET

; Kurzer hoher Knall mit abfallendem Rauschanteil. Der Motor wird fuer acht
; Bilder ersetzt und danach automatisch wieder vom normalen Service erzeugt.
SOUND_BALLOON_START:
        PUSH    AF
        LD      A,8
        LD      (SFX_TIMER),A
        LD      A,2
        LD      (SFX_KIND),A
        POP     AF
        RET

; Markantes Gewitterkrachen: harter Rauschbeginn, tiefer Grundton und drei
; leiser werdende Echoimpulse. Die Grafik darf bereits im naechsten Bild weg.
SOUND_LIGHTNING_START:
        PUSH    AF
        LD      A,12
        LD      (SFX_TIMER),A
        LD      A,3
        LD      (SFX_KIND),A
        POP     AF
        RET

SOUND_COURSE_MELODY:
        LD      HL,SOUND_COURSE_NOTES
        JP      SOUND_PLAY_MELODY

SOUND_GAME_OVER_MELODY:
        LD      HL,SOUND_GAME_OVER_NOTES
        JP      SOUND_PLAY_MELODY

SOUND_WINNER_MELODY:
        LD      HL,SOUND_WINNER_NOTES

; HL zeigt auf Dreiergruppen aus Frequenz-Low, Frequenz-High und Dauer. Eine
; Dauer von Null beendet die Folge. Die kurze Melodie darf bewusst blockieren,
; weil zu diesem Zeitpunkt Strecke bzw. Endbild bereits stillstehen.
SOUND_PLAY_MELODY:
        CALL    SOUND_SILENCE
.NAECHSTE_NOTE:
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        INC     HL
        LD      B,(HL)
        INC     HL
        LD      A,B
        OR      A
        JR      Z,.ENDE
        LD      A,E
        OUT     (PORT_TED_V1_LO),A
        LD      A,D
        OUT     (PORT_TED_V1_HI),A
        LD      A,095h                  ; Reload + Stimme 1, Lautstaerke 5
        OUT     (PORT_TED_CTRL),A
        LD      A,015h
        OUT     (PORT_TED_CTRL),A
.NOTE_HALTEN:
        PUSH    BC
        PUSH    HL
        CALL    FRAME_PAUSE
        POP     HL
        POP     BC
        DJNZ    .NOTE_HALTEN
        JR      .NAECHSTE_NOTE
.ENDE:
        JP      SOUND_SILENCE

; Freie, eigenstaendige Adaption im treibenden Charakter von Pixel Sprinter.
; Die Musik ist in Sechzehntel aufgeteilt. Das Schlagzeug folgt einem festen
; 140-BPM-Raster: Bassdrum auf 1/3, Snare auf 2/4, Hi-Hat dazwischen und eine
; Doppel-Bassdrum am Ende jedes vierten Taktes. Stimme 2 wird waehrend der
; Rauschschlaege nur kurz unterbrochen. Die Folge laeuft auf Intro-,
; GAME-OVER- und WINNER-Bild, bis ESC gedrueckt wird.
;
; Tabelleneintrag: V1 low/high, V2 low/high, Dauer in FRAME_PAUSE-Einheiten.
SOUND_TITLE_WAIT_ESC:
        CALL    SOUND_SILENCE
.VON_VORN:
        XOR     A
        LD      (SOUND_TITLE_STEP),A
        LD      IX,SOUND_TITLE_NOTES
.NAECHSTER_SCHRITT:
        LD      E,(IX+0)
        LD      D,(IX+1)
        LD      C,(IX+2)
        LD      B,(IX+3)
        LD      A,E
        OR      D
        JR      Z,.VON_VORN
        LD      A,(IX+4)
        LD      (SOUND_TITLE_DURATION),A
        INC     IX
        INC     IX
        INC     IX
        INC     IX
        INC     IX

        ; Zunaechst beide Melodiestimmen auf die aktuelle Note stellen.
        LD      A,E
        OUT     (PORT_TED_V1_LO),A
        LD      A,D
        OUT     (PORT_TED_V1_HI),A
        LD      A,C
        OUT     (PORT_TED_V2_LO),A
        LD      A,B
        OUT     (PORT_TED_V2_HI),A
        LD      A,0B5h
        OUT     (PORT_TED_CTRL),A
        LD      A,035h
        OUT     (PORT_TED_CTRL),A

        ; Die beiden letzten Sechzehntel jedes vierten Taktes bilden den Fill.
        LD      A,(SOUND_TITLE_STEP)
        AND     03Fh
        CP      62
        JR      NC,.BASSDRUM

        LD      A,(SOUND_TITLE_STEP)
        AND     00Fh
        CP      0
        JR      Z,.BASSDRUM
        CP      8
        JR      Z,.BASSDRUM
        CP      4
        JR      Z,.SNARE
        CP      12
        JR      Z,.SNARE
        CP      2
        JR      Z,.HIHAT
        CP      6
        JR      Z,.HIHAT
        CP      10
        JR      Z,.HIHAT
        CP      14
        JR      Z,.HIHAT
        JP      .REST_HALTEN

.BASSDRUM:
        PUSH    BC
        PUSH    DE
        LD      A,060h                 ; kurzer hoher Beginn des Kick-Tons
        OUT     (PORT_TED_V1_LO),A
        LD      A,001h
        OUT     (PORT_TED_V1_HI),A
        LD      A,050h                 ; grobes, kurzes Anschlagrauschen
        OUT     (PORT_TED_V2_LO),A
        LD      A,003h
        OUT     (PORT_TED_V2_HI),A
        LD      A,0D7h
        OUT     (PORT_TED_CTRL),A
        LD      A,057h
        OUT     (PORT_TED_CTRL),A
        CALL    FRAME_PAUSE
        LD      A,040h                 ; fallender zweiter Kick-Abschnitt
        OUT     (PORT_TED_V1_LO),A
        XOR     A
        OUT     (PORT_TED_V1_HI),A
        LD      A,080h
        OUT     (PORT_TED_V2_LO),A
        LD      A,002h
        OUT     (PORT_TED_V2_HI),A
        LD      A,0D6h
        OUT     (PORT_TED_CTRL),A
        LD      A,056h
        OUT     (PORT_TED_CTRL),A
        CALL    FRAME_PAUSE
        POP     DE
        POP     BC
        JR      .MELODIE_RESTORE

.SNARE:
        PUSH    BC
        PUSH    DE
        LD      A,0D8h
        OUT     (PORT_TED_V2_LO),A
        LD      A,003h
        OUT     (PORT_TED_V2_HI),A
        LD      A,0D6h
        OUT     (PORT_TED_CTRL),A
        LD      A,056h
        OUT     (PORT_TED_CTRL),A
        CALL    FRAME_PAUSE
        CALL    FRAME_PAUSE
        POP     DE
        POP     BC
        JR      .MELODIE_RESTORE

.HIHAT:
        PUSH    BC
        PUSH    DE
        LD      A,0F8h
        OUT     (PORT_TED_V2_LO),A
        LD      A,003h
        OUT     (PORT_TED_V2_HI),A
        LD      A,0D4h
        OUT     (PORT_TED_CTRL),A
        LD      A,054h
        OUT     (PORT_TED_CTRL),A
        CALL    FRAME_PAUSE
        CALL    FRAME_PAUSE
        POP     DE
        POP     BC

.MELODIE_RESTORE:
        LD      A,E
        OUT     (PORT_TED_V1_LO),A
        LD      A,D
        OUT     (PORT_TED_V1_HI),A
        LD      A,C
        OUT     (PORT_TED_V2_LO),A
        LD      A,B
        OUT     (PORT_TED_V2_HI),A
        LD      A,0B5h
        OUT     (PORT_TED_CTRL),A
        LD      A,035h
        OUT     (PORT_TED_CTRL),A
        LD      A,(SOUND_TITLE_DURATION)
        SUB     2
        LD      B,A
        CALL    SOUND_TITLE_DELAY
        JR      .SCHRITT_FERTIG

.REST_HALTEN:
        LD      A,(SOUND_TITLE_DURATION)
        LD      B,A
        CALL    SOUND_TITLE_DELAY

.SCHRITT_FERTIG:
        ; ESC wird nach hoechstens einem Sechzehntel erkannt.
        PUSH    BC
        LD      A,08h
        OUT     (08h),A
        IN      A,(04h)
        BIT     1,A
        POP     BC
        JR      NZ,.ESC_ERKANNT
        LD      A,(SOUND_TITLE_STEP)
        INC     A
        LD      (SOUND_TITLE_STEP),A
        JP      .NAECHSTER_SCHRITT

.ESC_ERKANNT:
        CALL    SOUND_SILENCE
.ESC_LOSLASSEN:
        LD      A,8
        OUT     (08h),A
        IN      A,(04h)
        BIT     1,A
        JR      NZ,.ESC_LOSLASSEN
        RET

SOUND_TITLE_DELAY:
        LD      A,B
        OR      A
        RET     Z
.LOOP:
        PUSH    BC
        CALL    FRAME_PAUSE
        POP     BC
        DJNZ    .LOOP
        RET

        INCLUDE "kikstart_engine_rpm.inc"
SOUND_ENGINE_WOBBLE_V1:
        DB      0,12,4,20
SOUND_ENGINE_WOBBLE_V2:
        DB      24,4,36,10
SOUND_ENGINE_PULSE_TABLE:
        ; Speed 0: langsames Standgas, danach zunehmend dichtere/kraeftigere
        ; Zuendimpulse. Bit 4/5 schalten beide Stimmen, Low-Nibble ist Pegel.
        DB      035h,031h,031h,031h, 034h,031h,031h,031h
        DB      035h,031h,033h,031h, 035h,031h,033h,031h
        DB      035h,032h,034h,032h, 035h,032h,034h,032h
        DB      035h,033h,035h,032h, 035h,033h,035h,032h
        DB      036h,034h,035h,034h, 036h,034h,035h,034h

; Zwoelf Werte von etwa 365 Hz bis gut 1 kHz.
SOUND_JUMP_TABLE:
        DW      02D0h,02E8h,0300h,0318h,0330h,0348h
        DW      035Ch,036Eh,037Eh,038Ch,0398h,03A2h

; Vier eng benachbarte Zaehlimpulse. Stimme 2 liegt leicht darueber und gibt
; dem Klang mehr Koerper als der fruehere einzelne Rechteckton.
SOUND_BONUS_TABLE:
        DW      02F0h,0308h,0320h,0338h
SOUND_BONUS_TABLE_V2:
        DW      0300h,0318h,0330h,0348h

; Fallender Ton und gleichzeitig grober werdendes Rauschen fuer sechs Bilder.
SOUND_CRASH_V1_TABLE:
        DW      0360h,0330h,02F0h,02A0h,0220h,0140h
SOUND_CRASH_NOISE_TABLE:
        DW      03F0h,03E8h,03D8h,03C0h,0390h,0340h

; Acht Bilder: kurzer hoher Membranknall, danach zwei kleine Nachimpulse.
SOUND_BALLOON_V1_TABLE:
        DW      03F0h,03B0h,0340h,02B0h,0220h,02E0h,01B0h,0120h
SOUND_BALLOON_NOISE_TABLE:
        DW      03FCh,03F4h,03E0h,03B0h,0360h,03C0h,02C0h,0200h
SOUND_BALLOON_CTRL:
        DB      0DFh,0D8h,0D5h,0D3h,0D1h,0D4h,0D2h,0D1h

; Zwoelf Bilder: harter Einschlag und tiefer Donner mit drei Echoauslaeufern.
SOUND_LIGHTNING_V1_TABLE:
        DW      0320h,0200h,0180h,0120h,00E0h,0180h
        DW      0100h,00C0h,0160h,00E0h,00A0h,0080h
SOUND_LIGHTNING_NOISE_TABLE:
        DW      03FCh,03F4h,03E0h,03B0h,0360h,03E8h
        DW      0380h,0300h,03D0h,0340h,0280h,0200h
SOUND_LIGHTNING_CTRL:
        DB      0DFh,0DCh,0D9h,0D6h,0D3h,0DAh
        DB      0D6h,0D3h,0D8h,0D5h,0D3h,0D1h

; C5, E5, G5; danach ein laengeres Ende bei der Winner-Folge.
SOUND_COURSE_NOTES:
        DB      02Ch,03h,8, 058h,03h,8, 073h,03h,14, 0,0,0
SOUND_GAME_OVER_NOTES:
        DB      0E5h,02h,10, 0B0h,02h,10, 059h,02h,18, 0,0,0
SOUND_WINNER_NOTES:
        DB      02Ch,03h,8, 058h,03h,8, 073h,03h,8, 096h,03h,20, 0,0,0

; Acht Takte der freien Pixel-Sprinter-Adaption. Sechs der 16 Schritte eines
; Taktes sind eine FRAME_PAUSE laenger; 86 Frames je Takt ergeben bei der
; vorhandenen 8-MHz-Zeitbasis etwa 139,5 BPM.
SOUND_TITLE_NOTES:
        ; Takt 1
        DB 43h,03h,0Dh,01h,5, 43h,03h,0Dh,01h,6, 43h,03h,0Dh,01h,5, 43h,03h,0Dh,01h,5
        DB 12h,03h,0Dh,01h,6, 12h,03h,0Dh,01h,5, 2Ch,03h,0Dh,01h,6, 2Ch,03h,0Dh,01h,5
        DB 43h,03h,0Dh,01h,5, 43h,03h,0Dh,01h,6, 61h,03h,0Dh,01h,5, 61h,03h,0Dh,01h,5
        DB 2Ch,03h,0Dh,01h,6, 2Ch,03h,0Dh,01h,5, 12h,03h,0Dh,01h,6, 12h,03h,0Dh,01h,5
        ; Takt 2
        DB 73h,03h,49h,00h,5, 73h,03h,49h,00h,6, 61h,03h,49h,00h,5, 61h,03h,49h,00h,5
        DB 43h,03h,49h,00h,6, 43h,03h,49h,00h,5, 2Ch,03h,49h,00h,6, 2Ch,03h,49h,00h,5
        DB 12h,03h,49h,00h,5, 12h,03h,49h,00h,6, 2Ch,03h,49h,00h,5, 2Ch,03h,49h,00h,5
        DB 43h,03h,49h,00h,6, 43h,03h,49h,00h,5, 61h,03h,49h,00h,6, 61h,03h,49h,00h,5
        ; Takt 3
        DB 73h,03h,0B1h,00h,5, 73h,03h,0B1h,00h,6, 73h,03h,0B1h,00h,5, 73h,03h,0B1h,00h,5
        DB 82h,03h,0B1h,00h,6, 82h,03h,0B1h,00h,5, 73h,03h,0B1h,00h,6, 73h,03h,0B1h,00h,5
        DB 61h,03h,0B1h,00h,5, 61h,03h,0B1h,00h,6, 43h,03h,0B1h,00h,5, 43h,03h,0B1h,00h,5
        DB 2Ch,03h,0B1h,00h,6, 2Ch,03h,0B1h,00h,5, 43h,03h,0B1h,00h,6, 43h,03h,0B1h,00h,5
        ; Takt 4
        DB 61h,03h,10h,00h,5, 61h,03h,10h,00h,6, 43h,03h,10h,00h,5, 43h,03h,10h,00h,5
        DB 2Ch,03h,10h,00h,6, 2Ch,03h,10h,00h,5, 12h,03h,10h,00h,6, 12h,03h,10h,00h,5
        DB 04h,03h,10h,00h,5, 04h,03h,10h,00h,6, 2Ch,03h,10h,00h,5, 2Ch,03h,10h,00h,5
        DB 43h,03h,10h,00h,6, 43h,03h,10h,00h,5, 04h,03h,10h,00h,6, 04h,03h,10h,00h,5
        ; Takt 5
        DB 58h,03h,5Fh,01h,5, 58h,03h,5Fh,01h,6, 58h,03h,5Fh,01h,5, 58h,03h,5Fh,01h,5
        DB 2Ch,03h,5Fh,01h,6, 2Ch,03h,5Fh,01h,5, 43h,03h,5Fh,01h,6, 43h,03h,5Fh,01h,5
        DB 58h,03h,5Fh,01h,5, 58h,03h,5Fh,01h,6, 73h,03h,5Fh,01h,5, 73h,03h,5Fh,01h,5
        DB 43h,03h,5Fh,01h,6, 43h,03h,5Fh,01h,5, 2Ch,03h,5Fh,01h,6, 2Ch,03h,5Fh,01h,5
        ; Takt 6
        DB 90h,03h,0B1h,00h,5, 90h,03h,0B1h,00h,6, 82h,03h,0B1h,00h,5, 82h,03h,0B1h,00h,5
        DB 73h,03h,0B1h,00h,6, 73h,03h,0B1h,00h,5, 58h,03h,0B1h,00h,6, 58h,03h,0B1h,00h,5
        DB 43h,03h,0B1h,00h,5, 43h,03h,0B1h,00h,6, 58h,03h,0B1h,00h,5, 58h,03h,0B1h,00h,5
        DB 73h,03h,0B1h,00h,6, 73h,03h,0B1h,00h,5, 82h,03h,0B1h,00h,6, 82h,03h,0B1h,00h,5
        ; Takt 7
        DB 82h,03h,0Dh,01h,5, 82h,03h,0Dh,01h,6, 73h,03h,0Dh,01h,5, 73h,03h,0Dh,01h,5
        DB 61h,03h,0Dh,01h,6, 61h,03h,0Dh,01h,5, 43h,03h,0Dh,01h,6, 43h,03h,0Dh,01h,5
        DB 2Ch,03h,0Dh,01h,5, 2Ch,03h,0Dh,01h,6, 43h,03h,0Dh,01h,5, 43h,03h,0Dh,01h,5
        DB 61h,03h,0Dh,01h,6, 61h,03h,0Dh,01h,5, 73h,03h,0Dh,01h,6, 73h,03h,0Dh,01h,5
        ; Takt 8
        DB 89h,03h,10h,00h,5, 89h,03h,10h,00h,6, 82h,03h,10h,00h,5, 82h,03h,10h,00h,5
        DB 73h,03h,10h,00h,6, 73h,03h,10h,00h,5, 61h,03h,10h,00h,6, 61h,03h,10h,00h,5
        DB 43h,03h,10h,00h,5, 43h,03h,10h,00h,6, 2Ch,03h,10h,00h,5, 2Ch,03h,10h,00h,5
        DB 04h,03h,10h,00h,6, 04h,03h,10h,00h,5, 43h,03h,10h,00h,6, 43h,03h,10h,00h,5
        DB 00h,00h,00h,00h,0

; -----------------------------------------------------------------------------
; Zeitbasis, Variablen und eigene Strecken
; -----------------------------------------------------------------------------

FRAME_PAUSE:
        LD      BC,01800h
.LOOP:
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,.LOOP
        RET

STURZ_PAUSE:
        LD      A,12
.LOOP:
        PUSH    AF
        CALL    FRAME_PAUSE
        POP     AF
        DEC     A
        JR      NZ,.LOOP
        RET

KEYS:           DB 0
KEY_LOCK:       DB 0
JUMP_LOCK:      DB 0
SFX_TIMER:      DB 0
SFX_KIND:       DB 0              ; 1=Sprung, 2=Ballon, 3=Blitz
SOUND_TITLE_STEP: DB 0
SOUND_TITLE_DURATION: DB 0
ENGINE_PHASE:    DB 0
ENGINE_RPM_STEP: DB 0
WHEELIE:        DB 0
AUTO_RAMP:      DB 0
SPEED:          DB 0
SCROLL_TIMER:   DB 0
FRAME_COUNT:    DB 0
BIKE_Y:         DB 0
VY:             DB 0
ON_GROUND:      DB 0
BIKES:          DB 0
COURSE:         DB 0
TIME_LEFT:      DB 0
COURSE_DONE:    DB 0
FINISH_ROLLING: DB 0
FINISH_BRAKE_TIMER: DB 0
TIME_BONUS:     DW 0
BIKE_BONUS:     DB 0
BONUS_FACTOR:   DB 0
BONUS_STEP:     DB 1
BONUS_TICK_PHASE: DB 0
SCORE:          DW 0
HIGH_SCORE:     DW 0
SKY_CLOUD1_X:  DB 30
SKY_CLOUD2_X:  DB 17
SKY_BALLOON_X: DB 8
SKY_BALLOON_Y: DB SKY_BALLOON_Y0
SKY_FRAME:     DB 0
SKY_MOVE_ACC:  DB 0
SKY_PARALLAX:  DB 0
SKY_WEATHER:   DB 0
SKY_MODE:      DB 0              ; 0=ruhig, 1=Ballon, 2=Gewitter
SKY_BALLOON_VISIBLE: DB 0
SKY_LIGHTNING_ACTIVE: DB 0
SKY_STRIKE_DONE: DB 0
SKY_RNG:       DB 0A7h
LIGHTNING_HIT: DB 0
SKY_TEMP_X:    DB 0
SKY_TEMP_Y:    DB 0
SKY_TEMP_H:    DB 0
SKY_TEMP_COLOR: DB 0
COURSE_PTR:     DW 0
SEG_REMAIN:     DB 0
SEG_TYPE:       DB 0
SEG_PHASE:      DB 0
NEW_HEIGHT:     DB 0
NEW_TYPE:       DB 0
NEW_PHASE:      DB 0
TEMP_FARBE:     DB 0
TEMP_FARB_SPALTE: DB 0
BIKE_FARB_PTR:  DW 0
BIKE_FARB_BACKUP: DS 48,0
EXPLOSION_FRAME: DB 0
EXPLOSION_PTR:   DW 0
EXPLOSION_FARB_BACKUP: DS 192,0
COL_HEIGHT:     DS 32,23
COL_TYPE:       DS 32,0

; Je zwei Bytes: Laenge in 8-Pixel-Spalten, Typ. Null beendet die Tabelle.
COURSE_POINTERS:
        DW COURSE1,COURSE2,COURSE3,COURSE4,COURSE5
        DW COURSE6,COURSE7,COURSE8,COURSE9,COURSE10

; Die Abfolge folgt der Plus/4-Dramaturgie: zuerst Gruben, Huegel, Hecken,
; Busse und Sprungbretter; danach Kreuze, Tore, Reifenstapel und schliesslich
; hohe, dicht kombinierte Ziegelhindernisse. Zwischen schweren Gruppen bleibt
; jeweils eine erkennbare Anfahr- und Landezone.
COURSE1:  DB 40,T_FLAT,3,T_GAP,14,T_FLAT,2,T_HEDGE,18,T_FLAT,4,T_UP,10,T_HIGH,4,T_DOWN,20,T_FLAT,2,T_FINISH,10,T_FLAT,2,T_FINISH_END,30,T_FLAT,0
COURSE2:  DB 36,T_FLAT,2,T_HEDGE,12,T_FLAT,5,T_BUS,12,T_FLAT,2,T_CROSS,10,T_FLAT,2,T_SPRING,4,T_GAP,20,T_FLAT,2,T_FINISH,10,T_FLAT,2,T_FINISH_END,30,T_FLAT,0
COURSE3:  DB 34,T_FLAT,4,T_UP,8,T_HIGH,4,T_DOWN,10,T_FLAT,3,T_GATE,12,T_FLAT,4,T_GAP,10,T_FLAT,5,T_BUS,18,T_FLAT,2,T_FINISH,10,T_FLAT,2,T_FINISH_END,30,T_FLAT,0
COURSE4:  DB 32,T_FLAT,2,T_SPRING,5,T_GAP,12,T_FLAT,4,T_TYRES,10,T_FLAT,2,T_HEDGE,10,T_FLAT,4,T_UP,12,T_HIGH,4,T_DOWN,16,T_FLAT,2,T_FINISH,10,T_FLAT,2,T_FINISH_END,30,T_FLAT,0
COURSE5:  DB 32,T_FLAT,5,T_BUS,8,T_FLAT,2,T_CROSS,7,T_FLAT,3,T_GATE,8,T_FLAT,2,T_SPRING,6,T_GAP,12,T_FLAT,4,T_ROUGH,12,T_FLAT,2,T_FINISH,10,T_FLAT,2,T_FINISH_END,30,T_FLAT,0
COURSE6:  DB 30,T_FLAT,4,T_UP,6,T_HIGH,4,T_DOWN,8,T_FLAT,4,T_BRICK,10,T_FLAT,5,T_BUS,8,T_FLAT,2,T_SPRING,7,T_GAP,12,T_FLAT,4,T_TYRES,14,T_FLAT,2,T_FINISH,10,T_FLAT,2,T_FINISH_END,30,T_FLAT,0
COURSE7:  DB 30,T_FLAT,2,T_HEDGE,6,T_FLAT,2,T_CROSS,7,T_FLAT,3,T_GATE,6,T_FLAT,4,T_GAP,8,T_FLAT,4,T_TYRES,8,T_FLAT,4,T_UP,8,T_HIGH,4,T_DOWN,12,T_FLAT,2,T_FINISH,10,T_FLAT,2,T_FINISH_END,30,T_FLAT,0
COURSE8:  DB 28,T_FLAT,2,T_SPRING,8,T_GAP,10,T_FLAT,5,T_BUS,7,T_FLAT,4,T_BRICK,8,T_FLAT,2,T_HEDGE,7,T_FLAT,3,T_GATE,8,T_FLAT,4,T_UP,6,T_HIGH,4,T_DOWN,12,T_FLAT,2,T_FINISH,10,T_FLAT,2,T_FINISH_END,30,T_FLAT,0
COURSE9:  DB 28,T_FLAT,4,T_TYRES,7,T_FLAT,2,T_CROSS,6,T_FLAT,5,T_BUS,6,T_FLAT,2,T_SPRING,9,T_GAP,9,T_FLAT,4,T_BRICK,7,T_FLAT,4,T_UP,10,T_HIGH,4,T_DOWN,12,T_FLAT,2,T_FINISH,10,T_FLAT,2,T_FINISH_END,30,T_FLAT,0
COURSE10: DB 26,T_FLAT,3,T_GATE,6,T_FLAT,4,T_TYRES,6,T_FLAT,3,T_GAP,7,T_FLAT,5,T_BUS,6,T_FLAT,2,T_SPRING,10,T_GAP,8,T_FLAT,4,T_BRICK,5,T_FLAT,4,T_UP,7,T_HIGH,4,T_DOWN,2,T_CROSS,10,T_FLAT,2,T_FINISH,10,T_FLAT,2,T_FINISH_END,30,T_FLAT,0

; 8 x 16-Pixel-Kursfaehnchen. Das niederwertige Bit bleibt frei und trennt
; zwei unmittelbar benachbarte Symbole optisch voneinander.
HUD_FLAGGE:
        DB 0FCh,0F8h,0F0h,0E0h,0F0h,0F8h,0FCh,080h
        DB 080h,080h,080h,080h,080h,0C0h,000h,000h

; Kleine Ergebnisbeschriftung und grosse roemische Kursnummern.
TEXT_TIME_BONUS:   DB "BONUS FOR TIME LEFT",0
TEXT_BIKE_BONUS:   DB "BIKES LEFT BONUS",0
TEXT_BIKES_STILL:  DB "BIKES LEFT STILL...",0
TEXT_FIVE_BIKES_STILL: DB "FIVE BIKES LEFT STILL...",0
TEXT_COURSE:       DB "COURSE",0

ROMAN_POINTER:
        DW ROMAN_I,ROMAN_II,ROMAN_III,ROMAN_IV,ROMAN_V
        DW ROMAN_VI,ROMAN_VII,ROMAN_VIII,ROMAN_IX,ROMAN_X
ROMAN_POSITIONEN:
        DB 15,14,13,14,15,14,13,12,14,15
ROMAN_I:        DB "I",0
ROMAN_II:       DB "II",0
ROMAN_III:      DB "III",0
ROMAN_IV:       DB "IV",0
ROMAN_V:        DB "V",0
ROMAN_VI:       DB "VI",0
ROMAN_VII:      DB "VII",0
ROMAN_VIII:     DB "VIII",0
ROMAN_IX:       DB "IX",0
ROMAN_X:        DB "X",0

DOPPEL_NIBBLE:
        DB 00h,03h,0Ch,0Fh,30h,33h,3Ch,3Fh
        DB 0C0h,0C3h,0CCh,0CFh,0F0h,0F3h,0FCh,0FFh

SPRITE_DATEN:
        INCBIN "zkick_sprites.bin"
SPRITE_RIDE0   EQU SPRITE_DATEN+0*48
SPRITE_RIDE1   EQU SPRITE_DATEN+1*48
SPRITE_JUMP    EQU SPRITE_DATEN+2*48
SPRITE_WHEELIE EQU SPRITE_DATEN+3*48
SPRITE_CRASH   EQU SPRITE_DATEN+4*48

SPRITE_FARBDATEN:
        INCBIN "zkick_sprite_colors.bin"
SPRITE_FARBE_RIDE0   EQU SPRITE_FARBDATEN+0*48
SPRITE_FARBE_RIDE1   EQU SPRITE_FARBDATEN+1*48
SPRITE_FARBE_JUMP    EQU SPRITE_FARBDATEN+2*48
SPRITE_FARBE_WHEELIE EQU SPRITE_FARBDATEN+3*48
SPRITE_FARBE_CRASH   EQU SPRITE_FARBDATEN+4*48

EXPLOSION_DATEN:
        INCBIN "zkick_explosion.bin"

STRECKEN_GRAFIK:
        INCBIN "zkick_course_tiles.bin"
TILE_GROUND0  EQU STRECKEN_GRAFIK+0
TILE_GROUND1  EQU STRECKEN_GRAFIK+16
TILE_RAMP_UP  EQU STRECKEN_GRAFIK+32
TILE_RAMP_DOWN EQU STRECKEN_GRAFIK+48
TILE_TREE0    EQU STRECKEN_GRAFIK+64
TILE_TREE1    EQU STRECKEN_GRAFIK+88
TILE_BUS0     EQU STRECKEN_GRAFIK+112
TILE_BUS1     EQU STRECKEN_GRAFIK+136
TILE_BUS2     EQU STRECKEN_GRAFIK+160
TILE_BUS3     EQU STRECKEN_GRAFIK+184
TILE_BUS4     EQU STRECKEN_GRAFIK+208
TILE_STONE0   EQU STRECKEN_GRAFIK+232
TILE_STONE1   EQU STRECKEN_GRAFIK+240
TILE_STONE2   EQU STRECKEN_GRAFIK+248
TILE_STONE3   EQU STRECKEN_GRAFIK+256
TILE_SPRING0  EQU STRECKEN_GRAFIK+264
TILE_SPRING1  EQU STRECKEN_GRAFIK+272
TILE_FINISH0  EQU STRECKEN_GRAFIK+280
TILE_FINISH1  EQU STRECKEN_GRAFIK+288
TILE_FINISH2  EQU STRECKEN_GRAFIK+296
TILE_FINISH3  EQU STRECKEN_GRAFIK+304
TILE_CROSS0   EQU STRECKEN_GRAFIK+312
TILE_CROSS1   EQU STRECKEN_GRAFIK+336
TILE_GATE0    EQU STRECKEN_GRAFIK+360
TILE_GATE1    EQU STRECKEN_GRAFIK+392
TILE_GATE2    EQU STRECKEN_GRAFIK+424
TILE_TYRES0   EQU STRECKEN_GRAFIK+456
TILE_TYRES1   EQU STRECKEN_GRAFIK+480
TILE_TYRES2   EQU STRECKEN_GRAFIK+504
TILE_TYRES3   EQU STRECKEN_GRAFIK+528
TILE_BRICK0   EQU STRECKEN_GRAFIK+552
TILE_BRICK1   EQU STRECKEN_GRAFIK+584
TILE_BRICK2   EQU STRECKEN_GRAFIK+616
TILE_BRICK3   EQU STRECKEN_GRAFIK+648

HIMMEL_GRAFIK:
        INCBIN "zkick_sky.bin"
SKY_CLOUD     EQU HIMMEL_GRAFIK
SKY_BALLOON   EQU HIMMEL_GRAFIK+16
SKY_LIGHTNING EQU HIMMEL_GRAFIK+48

ZEICHEN_FONT:
        INCBIN "kikstart_font.bin"
STATUS_BILD:
        INCBIN "zkick_status.bin"
STATUS_UNTEN_BILD:
        INCBIN "zkick_status_bottom.bin"
BILD_INTRO:
        INCBIN "zkick_intro.bin"
BILD_GAME_OVER:
        INCBIN "zkick_game_over.bin"
BILD_WINNER:
        INCBIN "zkick_winner.bin"

PROGRAMM_ENDE:
