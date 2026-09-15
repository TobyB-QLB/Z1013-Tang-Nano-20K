; -----------------------------------------------------------------------------
; PACMAN.COM - farbiges Maze-Chase-Spiel mit TED-Titelmusik
; Copyright (c) Tobias Bremer.
; Eigenentwicklung fuer den Z1013; keine historischen Programmteile oder Assets.
;
; Start:       0100h
; Grafik:      OUT 18h, 256 x 256 Pixel, VRAM B000h-CFFFh
; Steuerung:   PS/2-Cursortasten ueber die historische Z1013-Matrix
;               links  Zeile 0 / Bit 0
;               hoch   Zeile 2 / Bit 0
;               rechts Zeile 8 / Bit 2
;               runter Zeile 8 / Bit 3
;
; Das unveraenderte monochrome Pixelbild wird durch den parallelen 8-KiB-
; Farbspeicher ergaenzt. Waehrend die Figuren weiterhin per XOR bewegt werden,
; setzt das Programm ihre Farbattribute und rekonstruiert nach dem Loeschen die
; Hintergrundfarbe aus der logischen Labyrinthkarte. Dadurch entstehen keine
; Farbspuren.
; -----------------------------------------------------------------------------

        ORG     0100h
        INCLUDE "maze_constants.inc"

VRAM            EQU     0B000h
DIR_STOP        EQU     0
DIR_LEFT        EQU     1
DIR_RIGHT       EQU     2
DIR_UP          EQU     3
DIR_DOWN        EQU     4
WALL            EQU     0FFh

PORT_TED_V1_LO  EQU     030h
PORT_TED_V2_LO  EQU     031h
PORT_TED_V2_HI  EQU     032h
PORT_TED_CTRL   EQU     033h
PORT_TED_V1_HI  EQU     034h

START:
        DI
        XOR     A
        OUT     (2Ch),A             ; Farbausgabe waehrend Aufbau aus
        OUT     (20h),A             ; normaler Pixel-VRAM fuer die CPU
        OUT     (18h),A             ; Vollgrafik einschalten
        LD      HL,BILD_BEGRUESSUNG
        CALL    VOLLBILD_KOPIEREN
        LD      A,0Bh               ; Intro in Hellcyan
        CALL    FARBBILD_FUELLEN
        CALL    SOUND_SCREEN_WAIT_ESC
        XOR     A
        OUT     (2Ch),A
        CALL    HINTERGRUND_KOPIEREN
        CALL    SPIEL_INITIALISIEREN
        CALL    FARBLABYRINTH_AUFBAUEN
        CALL    STATUS_AKTUALISIEREN
        CALL    ALLE_FIGUREN_ZEICHNEN

HAUPTSCHLEIFE:
        CALL    FRAME_PAUSE
        CALL    SOUND_GAME_SERVICE    ; Effekt oder abstandsabhaengiges Geisterzischen
        CALL    ALLE_FIGUREN_LOESCHEN ; alte Figuren samt Farbe entfernen
        CALL    TASTATUR_LESEN
        CALL    SPIELER_SCHRITT
        CALL    PUNKT_PRUEFEN
        CALL    GEGNER_SCHRITTE

        LD      HL,(REST_PUNKTE)
        LD      A,H
        OR      L
        JP      Z,SPIEL_GEWONNEN

        CALL    KOLLISION_PRUEFEN
        JR      C,SPIELER_GETROFFEN

        ; Erst nach dem Loeschen des alten Sprites die Animationsphase
        ; wechseln. So wird immer exakt dieselbe XOR-Maske entfernt, die im
        ; vorherigen Bild gezeichnet wurde.
        LD      A,(FRAME_ZAEHLER)
        INC     A
        LD      (FRAME_ZAEHLER),A
        CALL    ALLE_FIGUREN_ZEICHNEN ; Figuren an neuen Positionen zeichnen
        JP      HAUPTSCHLEIFE

SPIELER_GETROFFEN:
        CALL    SOUND_SCREAM_PLAY      ; lauter Schrei bei Geistkontakt
        LD      A,(LEBEN)
        DEC     A
        LD      (LEBEN),A
        CALL    STATUS_AKTUALISIEREN
        LD      A,(LEBEN)
        OR      A
        JP      Z,SPIEL_ENDE

        CALL    POSITIONEN_RESET
        CALL    ALLE_FIGUREN_ZEICHNEN
        CALL    TREFFER_PAUSE
        JP      HAUPTSCHLEIFE

SPIEL_ENDE:
        LD      HL,BILD_GAME_OVER
        CALL    VOLLBILD_KOPIEREN
        LD      A,0Ch               ; GAME OVER in Hellrot
        CALL    FARBBILD_FUELLEN
        JP      AUF_ESC_WARTEN

SPIEL_GEWONNEN:
        LD      HL,BILD_WINNER
        CALL    VOLLBILD_KOPIEREN
        LD      A,0Ah               ; WINNER in Hellgruen
        CALL    FARBBILD_FUELLEN
        JP      AUF_ESC_WARTEN

AUF_ESC_WARTEN:
        CALL    SOUND_SCREEN_WAIT_ESC

        ; Der komplette sichtbare Hintergrund und die unveraenderte
        ; Labyrinthvorlage werden neu eingespielt. Damit sind auch alle zuvor
        ; gefressenen Punkte wieder vorhanden.
        XOR     A
        OUT     (2Ch),A
        CALL    HINTERGRUND_KOPIEREN
        CALL    SPIEL_INITIALISIEREN
        CALL    FARBLABYRINTH_AUFBAUEN
        CALL    STATUS_AKTUALISIEREN
        CALL    ALLE_FIGUREN_ZEICHNEN
        JP      HAUPTSCHLEIFE

AUF_ESC_DRUCK_WARTEN:
        LD      A,8                   ; ESC = Matrixzeile 8 / Bit 1
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

; -----------------------------------------------------------------------------
; Initialisierung
; -----------------------------------------------------------------------------

HINTERGRUND_KOPIEREN:
        LD      HL,HINTERGRUND
VOLLBILD_KOPIEREN:
        LD      DE,VRAM
        LD      BC,02000h
        LDIR
        RET

SPIEL_INITIALISIEREN:
        LD      HL,LABYRINTH_VORLAGE
        LD      DE,LABYRINTH_KARTE
        LD      BC,896
        LDIR
        XOR     A
        LD      (FRAME_ZAEHLER),A
        LD      (SPIELER_RICHTUNG),A
        LD      (WUNSCH_RICHTUNG),A
        LD      HL,0
        LD      (PUNKTSTAND),HL
        LD      HL,PELLET_TOTAL
        LD      (REST_PUNKTE),HL
        LD      A,3
        LD      (LEBEN),A
        CALL    POSITIONEN_RESET
        RET

POSITIONEN_RESET:
        LD      A,PLAYER_START_X
        LD      (SPIELER_X),A
        LD      A,PLAYER_START_Y
        LD      (SPIELER_Y),A
        XOR     A
        LD      (SPIELER_RICHTUNG),A
        LD      (WUNSCH_RICHTUNG),A

        LD      IX,GEGNER0
        LD      A,GHOST0_START_X
        LD      (IX+0),A
        LD      A,GHOST0_START_Y
        LD      (IX+1),A
        LD      (IX+2),DIR_LEFT

        LD      IX,GEGNER1
        LD      A,GHOST1_START_X
        LD      (IX+0),A
        LD      A,GHOST1_START_Y
        LD      (IX+1),A
        LD      (IX+2),DIR_RIGHT

        LD      IX,GEGNER2
        LD      A,GHOST2_START_X
        LD      (IX+0),A
        LD      A,GHOST2_START_Y
        LD      (IX+1),A
        LD      (IX+2),DIR_UP

        LD      IX,GEGNER3
        LD      A,GHOST3_START_X
        LD      (IX+0),A
        LD      A,GHOST3_START_Y
        LD      (IX+1),A
        LD      (IX+2),DIR_DOWN
        RET

; -----------------------------------------------------------------------------
; Tastatur und Spielerbewegung
; -----------------------------------------------------------------------------

TASTATUR_LESEN:
        XOR     A
        OUT     (08h),A
        IN      A,(04h)
        BIT     0,A
        JR      Z,.NICHT_LINKS
        LD      A,DIR_LEFT
        LD      (WUNSCH_RICHTUNG),A
.NICHT_LINKS:
        LD      A,2
        OUT     (08h),A
        IN      A,(04h)
        BIT     0,A
        JR      Z,.NICHT_HOCH
        LD      A,DIR_UP
        LD      (WUNSCH_RICHTUNG),A
.NICHT_HOCH:
        LD      A,8
        OUT     (08h),A
        IN      A,(04h)
        LD      B,A
        BIT     2,B
        JR      Z,.NICHT_RECHTS
        LD      A,DIR_RIGHT
        LD      (WUNSCH_RICHTUNG),A
.NICHT_RECHTS:
        BIT     3,B
        JR      Z,.NICHT_RUNTER
        LD      A,DIR_DOWN
        LD      (WUNSCH_RICHTUNG),A
.NICHT_RUNTER:
        RET

SPIELER_SCHRITT:
        LD      A,(SPIELER_X)
        AND     7
        LD      B,A
        LD      A,(SPIELER_Y)
        AND     7
        OR      B
        JR      NZ,.BEWEGEN

        LD      A,(WUNSCH_RICHTUNG)
        OR      A
        JR      Z,.AKTUELLE_PRUEFEN
        LD      (TEMP_RICHTUNG),A
        LD      A,(SPIELER_X)
        LD      D,A
        LD      A,(SPIELER_Y)
        LD      E,A
        LD      A,(TEMP_RICHTUNG)
        CALL    RICHTUNG_FREI
        JR      NC,.AKTUELLE_PRUEFEN
        LD      A,(TEMP_RICHTUNG)
        LD      (SPIELER_RICHTUNG),A

.AKTUELLE_PRUEFEN:
        LD      A,(SPIELER_RICHTUNG)
        OR      A
        JR      Z,.BEWEGEN
        LD      (TEMP_RICHTUNG),A
        LD      A,(SPIELER_X)
        LD      D,A
        LD      A,(SPIELER_Y)
        LD      E,A
        LD      A,(TEMP_RICHTUNG)
        CALL    RICHTUNG_FREI
        JR      C,.BEWEGEN
        XOR     A
        LD      (SPIELER_RICHTUNG),A

.BEWEGEN:
        LD      A,(SPIELER_RICHTUNG)
        CP      DIR_LEFT
        JR      NZ,.NICHT_L
        LD      A,(SPIELER_X)
        DEC     A
        LD      (SPIELER_X),A
        RET
.NICHT_L:
        CP      DIR_RIGHT
        JR      NZ,.NICHT_R
        LD      A,(SPIELER_X)
        INC     A
        LD      (SPIELER_X),A
        RET
.NICHT_R:
        CP      DIR_UP
        JR      NZ,.NICHT_O
        LD      A,(SPIELER_Y)
        DEC     A
        LD      (SPIELER_Y),A
        RET
.NICHT_O:
        CP      DIR_DOWN
        RET     NZ
        LD      A,(SPIELER_Y)
        INC     A
        LD      (SPIELER_Y),A
        RET

; A=Richtung, D=x, E=y. Carry gesetzt, wenn die Zielkachel frei ist.
RICHTUNG_FREI:
        LD      (TEMP_RICHTUNG),A
        LD      A,D
        SRL     A
        SRL     A
        SRL     A
        LD      B,A                  ; Kachel x
        LD      A,E
        SRL     A
        SRL     A
        SRL     A
        LD      C,A                  ; Kachel y
        LD      A,(TEMP_RICHTUNG)
        CP      DIR_LEFT
        JR      NZ,.PRUEFE_RECHTS
        DEC     B
        JR      .KACHEL
.PRUEFE_RECHTS:
        CP      DIR_RIGHT
        JR      NZ,.PRUEFE_OBEN
        INC     B
        JR      .KACHEL
.PRUEFE_OBEN:
        CP      DIR_UP
        JR      NZ,.PRUEFE_UNTEN
        DEC     C
        JR      .KACHEL
.PRUEFE_UNTEN:
        CP      DIR_DOWN
        JR      NZ,.BLOCKIERT
        INC     C
.KACHEL:
        CALL    KACHEL_LESEN
        CP      WALL
        JR      Z,.BLOCKIERT
        SCF
        RET
.BLOCKIERT:
        OR      A
        RET

; B=x, C=y -> A=Kachelwert, HL=Adresse
KACHEL_LESEN:
        LD      L,C
        LD      H,0
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL               ; y * 32
        LD      E,B
        LD      D,0
        ADD     HL,DE
        LD      DE,LABYRINTH_KARTE
        ADD     HL,DE
        LD      A,(HL)
        RET

; -----------------------------------------------------------------------------
; Punkte und Status
; -----------------------------------------------------------------------------

PUNKT_PRUEFEN:
        LD      A,(SPIELER_X)
        AND     7
        RET     NZ
        LD      A,(SPIELER_Y)
        AND     7
        RET     NZ

        LD      A,(SPIELER_X)
        SRL     A
        SRL     A
        SRL     A
        LD      B,A
        LD      A,(SPIELER_Y)
        SRL     A
        SRL     A
        SRL     A
        LD      C,A
        PUSH    BC
        CALL    KACHEL_LESEN
        CP      1
        JR      Z,.NORMAL
        CP      2
        JR      Z,.BONUS
        POP     BC
        RET
.NORMAL:
        XOR     A
        LD      (TEMP_BONUS),A
        LD      A,10
        JR      .ESSEN
.BONUS:
        LD      A,1
        LD      (TEMP_BONUS),A
        LD      A,50
        PUSH    AF
        LD      A,(LEBEN)             ; jeder grosse Eckpunkt schenkt 1 Leben
        INC     A
        LD      (LEBEN),A
        POP     AF
.ESSEN:
        LD      (TEMP_PUNKTE),A
        XOR     A
        LD      (HL),A               ; Punkt aus logischer Karte entfernen
        POP     BC
        CALL    PUNKT_GRAFIK_LOESCHEN
        LD      A,(TEMP_BONUS)
        OR      A
        JR      NZ,.EXTRALEBEN_KLANG
        CALL    SOUND_TICK_PLAY        ; normaler Punkt: sehr kurzer Impuls
        JR      .KLANG_FERTIG
.EXTRALEBEN_KLANG:
        CALL    SOUND_LIFE_START       ; Eckpunkt/Extraleben: deutliches TA-TAA
.KLANG_FERTIG:

        LD      A,(TEMP_PUNKTE)
        LD      E,A
        LD      D,0
        LD      HL,(PUNKTSTAND)
        ADD     HL,DE
        LD      (PUNKTSTAND),HL
        LD      HL,(REST_PUNKTE)
        DEC     HL
        LD      (REST_PUNKTE),HL
        CALL    STATUS_AKTUALISIEREN
        RET

; B=Kachel-x, C=Kachel-y. Acht Bytes nur im sichtbaren VRAM leeren.
; HINTERGRUND bleibt als unveraenderte Vorlage fuer ein neues Spiel erhalten.
PUNKT_GRAFIK_LOESCHEN:
        LD      A,0B0h
        ADD     A,C
        LD      D,A
        LD      E,B
        LD      B,8
.ZEILE:
        XOR     A
        LD      (DE),A
        LD      A,E
        ADD     A,32
        LD      E,A
        JR      NC,.DE_OK
        INC     D
.DE_OK:
        DJNZ    .ZEILE
        RET

STATUS_AKTUALISIEREN:
        LD      HL,(PUNKTSTAND)
        LD      DE,SCORE_TEXT
        CALL    U16_ZU_5_ZIFFERN
        LD      HL,(REST_PUNKTE)
        LD      DE,REST_TEXT
        CALL    U16_ZU_3_ZIFFERN
        LD      A,(LEBEN)
        ADD     A,'0'
        LD      (LEBEN_TEXT),A

        LD      HL,SCORE_TEXT
        LD      DE,0CC13h
        LD      B,5
        CALL    ZIFFERN_ZEICHNEN
        LD      HL,REST_TEXT
        LD      DE,0CD11h
        LD      B,3
        CALL    ZIFFERN_ZEICHNEN
        LD      HL,LEBEN_TEXT
        LD      DE,0CD07h
        LD      B,1
        CALL    ZIFFERN_ZEICHNEN
        RET

U16_ZU_5_ZIFFERN:
        LD      BC,10000
        CALL    DEZIMAL_ZIFFER
        LD      BC,1000
        CALL    DEZIMAL_ZIFFER
        LD      BC,100
        CALL    DEZIMAL_ZIFFER
        LD      BC,10
        CALL    DEZIMAL_ZIFFER
        LD      A,L
        ADD     A,'0'
        LD      (DE),A
        RET

U16_ZU_3_ZIFFERN:
        LD      BC,100
        CALL    DEZIMAL_ZIFFER
        LD      BC,10
        CALL    DEZIMAL_ZIFFER
        LD      A,L
        ADD     A,'0'
        LD      (DE),A
        RET

DEZIMAL_ZIFFER:
        LD      A,'0'
.LOOP:
        OR      A
        SBC     HL,BC
        JR      C,.FERTIG
        INC     A
        JR      .LOOP
.FERTIG:
        ADD     HL,BC
        LD      (DE),A
        INC     DE
        RET

; HL=ASCII, DE=oberstes VRAM-Byte, B=Anzahl
ZIFFERN_ZEICHNEN:
        PUSH    HL
        POP     IX
.ZEICHEN:
        LD      A,(IX+0)
        INC     IX
        SUB     '0'
        PUSH    BC
        PUSH    DE
        LD      L,A
        LD      H,0
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        LD      BC,ZIFFER_FONT
        ADD     HL,BC
        POP     DE
        PUSH    DE
        LD      B,8
.GLYPH:
        LD      A,(HL)
        LD      (DE),A
        INC     HL
        LD      A,E
        ADD     A,32
        LD      E,A
        JR      NC,.KEIN_CARRY
        INC     D
.KEIN_CARRY:
        DJNZ    .GLYPH
        POP     DE
        INC     E
        POP     BC
        DJNZ    .ZEICHEN
        PUSH    IX
        POP     HL
        RET

; -----------------------------------------------------------------------------
; Gegnerbewegung
; Gegnerstruktur: x, y, Richtung, Modus
; -----------------------------------------------------------------------------

GEGNER_SCHRITTE:
        LD      A,(FRAME_ZAEHLER)
        AND     3
        RET     Z                    ; Gegner 25 Prozent langsamer als Spieler
        LD      IX,GEGNER0
        CALL    GEGNER_SCHRITT
        LD      IX,GEGNER1
        CALL    GEGNER_SCHRITT
        LD      IX,GEGNER2
        CALL    GEGNER_SCHRITT
        LD      IX,GEGNER3
        CALL    GEGNER_SCHRITT
        RET

GEGNER_SCHRITT:
        LD      A,(IX+0)
        AND     7
        LD      B,A
        LD      A,(IX+1)
        AND     7
        OR      B
        CALL    Z,GEGNER_RICHTUNG_WAEHLEN

        LD      A,(IX+2)
        CP      DIR_LEFT
        JR      NZ,.NICHT_L
        DEC     (IX+0)
        RET
.NICHT_L:
        CP      DIR_RIGHT
        JR      NZ,.NICHT_R
        INC     (IX+0)
        RET
.NICHT_R:
        CP      DIR_UP
        JR      NZ,.NICHT_O
        DEC     (IX+1)
        RET
.NICHT_O:
        CP      DIR_DOWN
        RET     NZ
        INC     (IX+1)
        RET

GEGNER_RICHTUNG_WAEHLEN:
        LD      A,(IX+3)
        AND     1
        JR      NZ,.VERTIKAL_ZUERST

        CALL    RICHTUNG_ZUM_SPIELER_X
        CALL    GEGNER_TRY
        RET     C
        CALL    RICHTUNG_ZUM_SPIELER_Y
        CALL    GEGNER_TRY
        RET     C
        JR      .WEITERE

.VERTIKAL_ZUERST:
        CALL    RICHTUNG_ZUM_SPIELER_Y
        CALL    GEGNER_TRY
        RET     C
        CALL    RICHTUNG_ZUM_SPIELER_X
        CALL    GEGNER_TRY
        RET     C

.WEITERE:
        LD      A,(IX+2)
        CALL    GEGNER_TRY
        RET     C
        LD      A,DIR_LEFT
        CALL    GEGNER_TRY
        RET     C
        LD      A,DIR_RIGHT
        CALL    GEGNER_TRY
        RET     C
        LD      A,DIR_UP
        CALL    GEGNER_TRY
        RET     C
        LD      A,DIR_DOWN
        CALL    GEGNER_TRY
        RET     C

        LD      A,(IX+2)             ; Sackgasse: Umkehr ist erlaubt
        CALL    UMKEHR_RICHTUNG
        JP      GEGNER_TRY_ERLAUBT

RICHTUNG_ZUM_SPIELER_X:
        LD      A,(SPIELER_X)
        CP      (IX+0)
        JR      C,.LINKS
        JR      Z,.GLEICH
        LD      A,DIR_RIGHT
        RET
.LINKS:
        LD      A,DIR_LEFT
        RET
.GLEICH:
        XOR     A
        RET

RICHTUNG_ZUM_SPIELER_Y:
        LD      A,(SPIELER_Y)
        CP      (IX+1)
        JR      C,.OBEN
        JR      Z,.GLEICH
        LD      A,DIR_DOWN
        RET
.OBEN:
        LD      A,DIR_UP
        RET
.GLEICH:
        XOR     A
        RET

GEGNER_TRY:
        OR      A
        RET     Z
        LD      (TEMP_RICHTUNG),A
        LD      A,(IX+2)
        CALL    UMKEHR_RICHTUNG
        LD      B,A
        LD      A,(TEMP_RICHTUNG)
        CP      B
        JR      Z,.NEIN
        JR      GEGNER_TRY_ERLAUBT
.NEIN:
        OR      A
        RET

GEGNER_TRY_ERLAUBT:
        LD      (TEMP_RICHTUNG),A
        LD      D,(IX+0)
        LD      E,(IX+1)
        CALL    RICHTUNG_FREI
        RET     NC
        LD      A,(TEMP_RICHTUNG)
        LD      (IX+2),A
        SCF
        RET

UMKEHR_RICHTUNG:
        CP      DIR_LEFT
        JR      NZ,.NICHT_L
        LD      A,DIR_RIGHT
        RET
.NICHT_L:
        CP      DIR_RIGHT
        JR      NZ,.NICHT_R
        LD      A,DIR_LEFT
        RET
.NICHT_R:
        CP      DIR_UP
        JR      NZ,.NICHT_O
        LD      A,DIR_DOWN
        RET
.NICHT_O:
        LD      A,DIR_UP
        RET

; -----------------------------------------------------------------------------
; Kollisionen
; -----------------------------------------------------------------------------

KOLLISION_PRUEFEN:
        LD      IX,GEGNER0
        CALL    KOLLISION_EINER
        RET     C
        LD      IX,GEGNER1
        CALL    KOLLISION_EINER
        RET     C
        LD      IX,GEGNER2
        CALL    KOLLISION_EINER
        RET     C
        LD      IX,GEGNER3
        JP      KOLLISION_EINER

KOLLISION_EINER:
        LD      A,(SPIELER_X)
        SUB     (IX+0)
        JP      P,.X_POS
        NEG
.X_POS:
        CP      6
        JR      NC,.NEIN
        LD      A,(SPIELER_Y)
        SUB     (IX+1)
        JP      P,.Y_POS
        NEG
.Y_POS:
        CP      6
        JR      NC,.NEIN
        SCF
        RET
.NEIN:
        OR      A
        RET

; -----------------------------------------------------------------------------
; Spriteausgabe. Alle Figuren werden mit XOR gezeichnet und mit demselben
; Aufruf wieder geloescht. Acht vorbereitete Pixelverschiebungen erlauben
; weiche Bewegung, obwohl das VRAM byteweise organisiert ist.
; -----------------------------------------------------------------------------

; Alte XOR-Sprites entfernen und danach fuer jedes betroffene Farbbyte die
; Grundfarbe anhand der aktuellen Labyrinthkarte wiederherstellen.
ALLE_FIGUREN_LOESCHEN:
        CALL    SPIELER_SPRITE_ADRESSE
        LD      A,(SPIELER_X)
        LD      D,A
        LD      A,(SPIELER_Y)
        LD      E,A
        CALL    SPRITE_XOR
        LD      A,(SPIELER_X)
        LD      D,A
        LD      A,(SPIELER_Y)
        LD      E,A
        CALL    SPRITE_FARBE_WIEDERHERSTELLEN

        LD      HL,SPRITE_GEGNER0
        LD      A,(GEGNER0+0)
        LD      D,A
        LD      A,(GEGNER0+1)
        LD      E,A
        CALL    SPRITE_XOR
        LD      A,(GEGNER0+0)
        LD      D,A
        LD      A,(GEGNER0+1)
        LD      E,A
        CALL    SPRITE_FARBE_WIEDERHERSTELLEN

        LD      HL,SPRITE_GEGNER1
        LD      A,(GEGNER1+0)
        LD      D,A
        LD      A,(GEGNER1+1)
        LD      E,A
        CALL    SPRITE_XOR
        LD      A,(GEGNER1+0)
        LD      D,A
        LD      A,(GEGNER1+1)
        LD      E,A
        CALL    SPRITE_FARBE_WIEDERHERSTELLEN

        LD      HL,SPRITE_GEGNER2
        LD      A,(GEGNER2+0)
        LD      D,A
        LD      A,(GEGNER2+1)
        LD      E,A
        CALL    SPRITE_XOR
        LD      A,(GEGNER2+0)
        LD      D,A
        LD      A,(GEGNER2+1)
        LD      E,A
        CALL    SPRITE_FARBE_WIEDERHERSTELLEN

        LD      HL,SPRITE_GEGNER3
        LD      A,(GEGNER3+0)
        LD      D,A
        LD      A,(GEGNER3+1)
        LD      E,A
        CALL    SPRITE_XOR
        LD      A,(GEGNER3+0)
        LD      D,A
        LD      A,(GEGNER3+1)
        LD      E,A
        JP      SPRITE_FARBE_WIEDERHERSTELLEN

; Vor dem Zeichnen werden die zwei von einem verschobenen Sprite beruehrten
; Farbbytes in allen acht Zeilen auf seine individuelle Farbe gesetzt.
ALLE_FIGUREN_ZEICHNEN:
        CALL    SPIELER_SPRITE_ADRESSE
        LD      A,(SPIELER_X)
        LD      D,A
        LD      A,(SPIELER_Y)
        LD      E,A
        LD      A,0Eh                       ; Pacman: Gelb
        CALL    SPRITE_FARBE_SETZEN
        CALL    SPRITE_XOR

        LD      HL,SPRITE_GEGNER0
        LD      A,(GEGNER0+0)
        LD      D,A
        LD      A,(GEGNER0+1)
        LD      E,A
        LD      A,0Ch                       ; Geist 0: Hellrot
        CALL    SPRITE_FARBE_SETZEN
        CALL    SPRITE_XOR

        LD      HL,SPRITE_GEGNER1
        LD      A,(GEGNER1+0)
        LD      D,A
        LD      A,(GEGNER1+1)
        LD      E,A
        LD      A,0Dh                       ; Geist 1: Hellmagenta
        CALL    SPRITE_FARBE_SETZEN
        CALL    SPRITE_XOR

        LD      HL,SPRITE_GEGNER2
        LD      A,(GEGNER2+0)
        LD      D,A
        LD      A,(GEGNER2+1)
        LD      E,A
        LD      A,0Bh                       ; Geist 2: Hellcyan
        CALL    SPRITE_FARBE_SETZEN
        CALL    SPRITE_XOR

        LD      HL,SPRITE_GEGNER3
        LD      A,(GEGNER3+0)
        LD      D,A
        LD      A,(GEGNER3+1)
        LD      E,A
        LD      A,0Ah                       ; Geist 3: Hellgruen
        CALL    SPRITE_FARBE_SETZEN
        JP      SPRITE_XOR

SPIELER_SPRITE_ADRESSE:
        LD      A,(FRAME_ZAEHLER)
        AND     8
        LD      HL,SPRITE_SPIELER_ZU
        RET     Z
        LD      A,(SPIELER_RICHTUNG)
        CP      DIR_LEFT
        JR      NZ,.NICHT_L
        LD      HL,SPRITE_SPIELER_L
        RET
.NICHT_L:
        CP      DIR_RIGHT
        JR      NZ,.NICHT_R
        LD      HL,SPRITE_SPIELER_R
        RET
.NICHT_R:
        CP      DIR_UP
        JR      NZ,.NICHT_O
        LD      HL,SPRITE_SPIELER_O
        RET
.NICHT_O:
        LD      HL,SPRITE_SPIELER_U
        RET

; HL=Basis einer Figur, D=x, E=y
SPRITE_XOR:
        LD      A,D
        AND     7
        RLCA
        RLCA
        RLCA
        RLCA                            ; Verschiebung * 16
        LD      C,A
        LD      B,0
        ADD     HL,BC
        PUSH    HL
        POP     IX

        LD      A,E
        LD      L,A
        LD      H,0
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL                   ; y * 32
        LD      BC,VRAM
        ADD     HL,BC
        LD      A,D
        SRL     A
        SRL     A
        SRL     A
        LD      C,A
        LD      B,0
        ADD     HL,BC

        LD      DE,31
        LD      C,8
.ZEILE:
        LD      A,(IX+0)
        XOR     (HL)
        LD      (HL),A
        INC     HL
        LD      A,(IX+1)
        XOR     (HL)
        LD      (HL),A
        ADD     HL,DE
        INC     IX
        INC     IX
        DEC     C
        JR      NZ,.ZEILE
        RET

; -----------------------------------------------------------------------------
; Farbspeicher
; -----------------------------------------------------------------------------

; A = Vordergrundfarbe. Fuellt alle 8192 Attribute mit schwarzem Hintergrund,
; schaltet danach wieder auf Pixel-VRAM und aktiviert die Farbausgabe.
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
.LOOP:
        LD      (HL),A
        INC     HL
        DEC     BC
        LD      A,B
        OR      C
        LD      A,D
        JR      NZ,.LOOP
        XOR     A
        OUT     (20h),A
        OUT     (28h),A
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; Erzeugt aus der logischen 32x28-Kachelkarte die Farbattribute fuer den
; kompletten Spielbereich. Jede Kachel liefert acht identische Attributzeilen.
; Die unteren vier 8-Pixel-Zeilen erhalten eigene Statusfarben.
FARBLABYRINTH_AUFBAUEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        XOR     A
        OUT     (24h),A
        LD      HL,LABYRINTH_KARTE
        LD      (FARB_MAP_PTR),HL
        LD      DE,VRAM
        LD      (FARB_VRAM_PTR),DE
        LD      A,28
        LD      (FARB_KACHELZEILEN),A

.KACHELZEILE:
        LD      A,8
        LD      (FARB_PIXELZEILEN),A
.PIXELZEILE:
        LD      HL,(FARB_MAP_PTR)
        LD      DE,(FARB_VRAM_PTR)
        LD      B,32
.SPALTE:
        LD      A,(HL)
        INC     HL
        CALL    KACHELWERT_ZU_FARBE
        LD      (DE),A
        INC     DE
        DJNZ    .SPALTE
        LD      (FARB_VRAM_PTR),DE
        LD      A,(FARB_PIXELZEILEN)
        DEC     A
        LD      (FARB_PIXELZEILEN),A
        JR      NZ,.PIXELZEILE

        LD      HL,(FARB_MAP_PTR)
        LD      DE,32
        ADD     HL,DE
        LD      (FARB_MAP_PTR),HL
        LD      A,(FARB_KACHELZEILEN)
        DEC     A
        LD      (FARB_KACHELZEILEN),A
        JR      NZ,.KACHELZEILE

        ; Vier Statuszeilen mit je 8 Pixelzeilen / 256 Attributbytes.
        LD      HL,0CC00h
        LD      BC,0100h
        LD      A,0Bh                       ; Titel/Punkte: Hellcyan
        CALL    FARBBEREICH_FUELLEN
        LD      BC,0100h
        LD      A,0Ah                       ; Leben/Rest: Hellgruen
        CALL    FARBBEREICH_FUELLEN
        LD      BC,0100h
        LD      A,0Eh                       ; Steuerung: Gelb
        CALL    FARBBEREICH_FUELLEN
        LD      BC,0100h
        LD      A,07h                       ; Reset-Hinweis: Hellgrau
        CALL    FARBBEREICH_FUELLEN

        XOR     A
        OUT     (20h),A
        OUT     (28h),A
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; HL = Ziel, BC = Anzahl, A = Attribut. Gibt HL hinter dem Bereich zurueck.
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

; A = logischer Kachelwert, Rueckgabe A = Farbattribut (Hintergrund schwarz).
KACHELWERT_ZU_FARBE:
        CP      WALL
        JR      Z,.WAND
        CP      1
        JR      Z,.PUNKT
        CP      2
        JR      Z,.KRAFTPUNKT
        XOR     A                           ; leer: Schwarz auf Schwarz
        RET
.WAND:
        LD      A,09h                       ; Wande: Hellblau
        RET
.PUNKT:
        LD      A,0Eh                       ; Punkte: Gelb
        RET
.KRAFTPUNKT:
        LD      A,0Dh                       ; Eckpunkte: Hellmagenta
        RET

; A = Spritefarbe, D = Pixel-x, E = Pixel-y. Setzt zwei Attributbytes in acht
; Zeilen. Da ein Attribut immer fuer acht Pixel gilt, kann ein verschobenes
; Sprite am Rand bereits das benachbarte Wandbyte beruehren. Dieses Attribut
; muss seine Wandfarbe behalten; andernfalls erscheint ein Stueck der Wand in
; Figurenfarbe. Alle Register werden fuer die XOR-Ausgabe erhalten.
SPRITE_FARBE_SETZEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      (TEMP_SPRITE_FARBE),A
        LD      A,D
        SRL     A
        SRL     A
        SRL     A
        LD      (TEMP_FARB_XBYTE),A
        LD      A,E
        LD      (TEMP_FARB_YPIXEL),A

        ; Innerhalb einer 8-Pixel-Kachelzeile sind Wand/Boden fuer alle
        ; Spritezeilen gleich. Nur wenn das Sprite vertikal nicht auf einer
        ; Kachelgrenze beginnt, werden zwei Gruppen benoetigt.
        AND     7
        LD      B,A
        LD      A,8
        SUB     B
        LD      (TEMP_FARB_GRUPPE),A
        LD      A,8
        LD      (TEMP_FARB_REST),A
        XOR     A
        OUT     (24h),A
        CALL    FARB_ZIELADRESSE

.GRUPPE:
        ; Die beiden Farben nur einmal je logischer Kachelzeile bestimmen.
        PUSH    HL
        LD      A,(TEMP_FARB_XBYTE)
        LD      B,A
        LD      A,(TEMP_FARB_YPIXEL)
        LD      C,A
        CALL    SPRITE_FARBE_FUER_POSITION
        LD      (TEMP_FARB_LINKS),A

        LD      A,(TEMP_FARB_XBYTE)
        INC     A
        LD      B,A
        LD      A,(TEMP_FARB_YPIXEL)
        LD      C,A
        CALL    SPRITE_FARBE_FUER_POSITION
        LD      (TEMP_FARB_RECHTS),A
        POP     HL

        LD      DE,31
        LD      A,(TEMP_FARB_GRUPPE)
        LD      B,A
.ZEILE:
        LD      A,(TEMP_FARB_LINKS)
        LD      (HL),A
        INC     HL
        LD      A,(TEMP_FARB_RECHTS)
        LD      (HL),A
        ADD     HL,DE
        DJNZ    .ZEILE

        LD      A,(TEMP_FARB_GRUPPE)
        LD      C,A
        LD      A,(TEMP_FARB_YPIXEL)
        ADD     A,C
        LD      (TEMP_FARB_YPIXEL),A
        LD      A,(TEMP_FARB_REST)
        SUB     C
        LD      (TEMP_FARB_REST),A
        JR      Z,.FERTIG
        LD      (TEMP_FARB_GRUPPE),A
        JR      .GRUPPE

.FERTIG:
        XOR     A
        OUT     (20h),A
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; B = Byte-Spalte, C = Pixelzeile. Wandbereiche behalten ihr hellblaues
; Grundattribut. Auf allen begehbaren Feldern wird die Figurenfarbe verwendet;
; nach dem Loeschen rekonstruiert SPRITE_FARBE_WIEDERHERSTELLEN wieder Punkt,
; Kraftpunkt oder schwarzen Boden.
SPRITE_FARBE_FUER_POSITION:
        CALL    FARBE_FUER_POSITION
        CP      09h
        RET     Z
        LD      A,(TEMP_SPRITE_FARBE)
        RET

; D = Pixel-x, E = Pixel-y. Rekonstruiert die zwei mal acht Attribute unter
; einem geloeschten Sprite aus LABYRINTH_KARTE. Gefressene Punkte sind dort
; bereits Null und werden deshalb auch farblich nicht wieder sichtbar.
SPRITE_FARBE_WIEDERHERSTELLEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      A,D
        SRL     A
        SRL     A
        SRL     A
        LD      (TEMP_FARB_XBYTE),A
        LD      A,E
        LD      (TEMP_FARB_YPIXEL),A
        LD      A,8
        LD      (TEMP_FARB_ZEILEN),A
        XOR     A
        OUT     (24h),A

.ZEILE:
        CALL    FARB_ZIELADRESSE
        PUSH    HL
        LD      A,(TEMP_FARB_XBYTE)
        LD      B,A
        LD      A,(TEMP_FARB_YPIXEL)
        LD      C,A
        CALL    FARBE_FUER_POSITION
        POP     HL
        LD      (HL),A
        INC     HL

        PUSH    HL
        LD      A,(TEMP_FARB_XBYTE)
        INC     A
        LD      B,A
        LD      A,(TEMP_FARB_YPIXEL)
        LD      C,A
        CALL    FARBE_FUER_POSITION
        POP     HL
        LD      (HL),A

        LD      A,(TEMP_FARB_YPIXEL)
        INC     A
        LD      (TEMP_FARB_YPIXEL),A
        LD      A,(TEMP_FARB_ZEILEN)
        DEC     A
        LD      (TEMP_FARB_ZEILEN),A
        JR      NZ,.ZEILE

        XOR     A
        OUT     (20h),A
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; Zieladresse im eingeblendeten Farbspeicher aus den temporaeren Koordinaten.
FARB_ZIELADRESSE:
        LD      A,(TEMP_FARB_YPIXEL)
        LD      L,A
        LD      H,0
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        LD      BC,VRAM
        ADD     HL,BC
        LD      A,(TEMP_FARB_XBYTE)
        LD      C,A
        LD      B,0
        ADD     HL,BC
        RET

; B = Byte-Spalte, C = Pixelzeile. Liefert das aktuelle Grundattribut in A.
FARBE_FUER_POSITION:
        LD      A,C
        SRL     A
        SRL     A
        SRL     A
        LD      L,A
        LD      H,0
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        LD      E,B
        LD      D,0
        ADD     HL,DE
        LD      DE,LABYRINTH_KARTE
        ADD     HL,DE
        LD      A,(HL)
        JP      KACHELWERT_ZU_FARBE

; -----------------------------------------------------------------------------
; Titel-, GAME-OVER- und WINNER-Musik
; -----------------------------------------------------------------------------

SOUND_SILENCE:
        XOR     A
        OUT     (PORT_TED_CTRL),A
        LD      (SFX_ACTIVE),A
        RET

; Ein normaler Punkt erzeugt nur einen extrem kurzen Impuls. Eine Tabelle
; wuerde den Ton bis zum naechsten Spielbild (rund 39 ms) halten und dadurch
; viel zu dominant klingen. Dieser kleine Impuls dauert nur etwa 4 ms.
SOUND_TICK_PLAY:
        LD      A,0A4h               ; 1200 Hz
        OUT     (PORT_TED_V1_LO),A
        LD      A,3
        OUT     (PORT_TED_V1_HI),A
        LD      A,091h               ; Stimme 1 neu laden, Lautstaerke 1
        OUT     (PORT_TED_CTRL),A
        LD      A,011h
        OUT     (PORT_TED_CTRL),A
        LD      B,8
.TICK_AUSSEN:
        LD      C,0
.TICK_INNEN:
        DEC     C
        JR      NZ,.TICK_INNEN
        DJNZ    .TICK_AUSSEN
        JP      SOUND_HISS_OFF

SOUND_LIFE_START:
        LD      A,1
        LD      (SFX_ACTIVE),A
        LD      HL,SOUND_LIFE_TABLE
        LD      (SFX_POINTER),HL
        JP      SOUND_GAME_SERVICE

SOUND_GAME_SERVICE:
        LD      A,(SFX_ACTIVE)
        OR      A
        JP      Z,SOUND_PROXIMITY_HISS
        LD      HL,(SFX_POINTER)
        LD      A,(HL)
        OUT     (PORT_TED_V1_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V1_HI),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V2_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V2_HI),A
        INC     HL
        LD      C,(HL)
        INC     HL
        LD      (SFX_POINTER),HL
        LD      A,C
        OR      A
        JP      Z,SOUND_SILENCE
        OR      080h
        OUT     (PORT_TED_CTRL),A
        LD      A,C
        OUT     (PORT_TED_CTRL),A
        RET

; Bedrohliches Zischen aus dem Rauschkanal. Verwendet wird der kleinste
; Manhattan-Abstand zwischen Pac-Man und den vier Geistern. Ab 72 Pixeln ist
; es still; darunter steigt die Lautstaerke in vier gut unterscheidbaren
; Stufen. Die Berechnung geschieht nur einmal pro Bild.
SOUND_PROXIMITY_HISS:
        LD      IX,GEGNER0
        LD      B,4
        LD      C,0FFh               ; bisher kleinster Abstand
.GEIST:
        LD      A,(SPIELER_X)
        SUB     (IX+0)
        JR      NC,.X_POSITIV
        NEG
.X_POSITIV:
        LD      D,A
        LD      A,(SPIELER_Y)
        SUB     (IX+1)
        JR      NC,.Y_POSITIV
        NEG
.Y_POSITIV:
        ADD     A,D
        JR      NC,.SUMME_OK
        LD      A,0FFh
.SUMME_OK:
        CP      C
        JR      NC,.NICHT_NAEHER
        LD      C,A
.NICHT_NAEHER:
        LD      DE,4
        ADD     IX,DE
        DJNZ    .GEIST

        LD      A,C
        CP      72
        JP      NC,SOUND_HISS_OFF
        LD      C,1                  ; fern: kaum hoerbar
        CP      48
        JR      NC,.LAUTSTAERKE_OK
        LD      C,2
        CP      32
        JR      NC,.LAUTSTAERKE_OK
        LD      C,3
        CP      20
        JR      NC,.LAUTSTAERKE_OK
        LD      C,5                  ; unmittelbar bedrohlich
.LAUTSTAERKE_OK:
        LD      A,(FRAME_ZAEHLER)    ; leicht bewegtes, nicht starres Rauschen
        AND     01Fh
        ADD     A,0D0h
        OUT     (PORT_TED_V2_LO),A
        LD      A,3
        OUT     (PORT_TED_V2_HI),A
        LD      A,C
        OR      0C0h                 ; Rauschen neu laden
        OUT     (PORT_TED_CTRL),A
        AND     07Fh
        OUT     (PORT_TED_CTRL),A
        RET

SOUND_HISS_OFF:
        XOR     A
        OUT     (PORT_TED_CTRL),A
        RET

; Der Schrei darf kurz blockieren: In diesem Moment ist der Spieler bereits
; getroffen. Zwei gegeneinander verstimmte Rechteckstimmen steigen an; am
; Hoehepunkt ersetzt der Rauschgenerator die zweite Stimme.
SOUND_SCREAM_PLAY:
        CALL    SOUND_SILENCE
        LD      HL,SOUND_SCREAM_TABLE
.NAECHSTER_SCHRITT:
        LD      A,(HL)
        OUT     (PORT_TED_V1_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V1_HI),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V2_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V2_HI),A
        INC     HL
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        INC     HL
        LD      A,B
        OR      A
        JR      Z,.ENDE
        LD      A,C
        OR      080h
        OUT     (PORT_TED_CTRL),A
        LD      A,C
        OUT     (PORT_TED_CTRL),A
.HALTEN:
        PUSH    BC
        PUSH    HL
        CALL    FRAME_PAUSE
        POP     HL
        POP     BC
        DJNZ    .HALTEN
        JR      .NAECHSTER_SCHRITT
.ENDE:
        JP      SOUND_SILENCE

; Jeder Tabelleneintrag besteht aus:
;   Stimme1 low/high, Stimme2 low/high, Steuerbyte, Dauer in FRAME_PAUSE.
; Eine Dauer von Null beendet die Tabelle und startet die 12-Sekunden-Folge
; erneut. ESC beendet die Musik, schaltet den Tongenerator aus und wartet bis
; zum Loslassen der Taste.
SOUND_SCREEN_WAIT_ESC:
        CALL    SOUND_SILENCE
.VON_VORN:
        LD      HL,PACMAN_MUSIC_TABLE
.NAECHSTER_SCHRITT:
        LD      A,(HL)
        OUT     (PORT_TED_V1_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V1_HI),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V2_LO),A
        INC     HL
        LD      A,(HL)
        OUT     (PORT_TED_V2_HI),A
        INC     HL
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        INC     HL
        LD      A,B
        OR      A
        JR      Z,.VON_VORN

        LD      A,C
        OR      080h                  ; beide Zaehler neu laden
        OUT     (PORT_TED_CTRL),A
        LD      A,C
        OUT     (PORT_TED_CTRL),A

.SCHRITT_HALTEN:
        PUSH    BC
        PUSH    HL
        CALL    FRAME_PAUSE
        LD      A,8
        OUT     (08h),A
        IN      A,(04h)
        BIT     1,A                   ; ESC = Matrixzeile 8 / Bit 1
        POP     HL
        POP     BC
        JR      NZ,.ESC_ERKANNT
        DJNZ    .SCHRITT_HALTEN
        JR      .NAECHSTER_SCHRITT

.ESC_ERKANNT:
        CALL    SOUND_SILENCE
.ESC_LOSLASSEN:
        LD      A,8
        OUT     (08h),A
        IN      A,(04h)
        BIT     1,A
        JR      NZ,.ESC_LOSLASSEN
        RET

        INCLUDE "pacman_music.inc"
        INCLUDE "pacman_sfx.inc"

; -----------------------------------------------------------------------------
; Zeitbasis
; -----------------------------------------------------------------------------

FRAME_PAUSE:
        LD      BC,03000h
.LOOP:
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,.LOOP
        RET

TREFFER_PAUSE:
        LD      A,20
.AUSSEN:
        PUSH    AF
        CALL    FRAME_PAUSE
        POP     AF
        DEC     A
        JR      NZ,.AUSSEN
        RET

; -----------------------------------------------------------------------------
; Veraenderliche Daten
; -----------------------------------------------------------------------------

SPIELER_X:          DB 0
SPIELER_Y:          DB 0
SPIELER_RICHTUNG:   DB 0
WUNSCH_RICHTUNG:    DB 0
FRAME_ZAEHLER:      DB 0
LEBEN:              DB 0
PUNKTSTAND:         DW 0
REST_PUNKTE:        DW 0
TEMP_RICHTUNG:      DB 0
TEMP_PUNKTE:        DB 0
TEMP_BONUS:         DB 0
TEMP_SPRITE_FARBE:  DB 0
TEMP_FARB_XBYTE:    DB 0
TEMP_FARB_YPIXEL:   DB 0
TEMP_FARB_ZEILEN:   DB 0
TEMP_FARB_GRUPPE:   DB 0
TEMP_FARB_REST:     DB 0
TEMP_FARB_LINKS:    DB 0
TEMP_FARB_RECHTS:   DB 0
FARB_MAP_PTR:       DW 0
FARB_VRAM_PTR:      DW 0
FARB_KACHELZEILEN:  DB 0
FARB_PIXELZEILEN:   DB 0
SFX_ACTIVE:         DB 0
SFX_POINTER:        DW 0

GEGNER0:            DB 0,0,DIR_LEFT,0
GEGNER1:            DB 0,0,DIR_RIGHT,1
GEGNER2:            DB 0,0,DIR_UP,2
GEGNER3:            DB 0,0,DIR_DOWN,3

SCORE_TEXT:         DB "00000"
REST_TEXT:          DB "000"
LEBEN_TEXT:         DB "3"

; -----------------------------------------------------------------------------
; Veraenderliche Arbeitskarte und unveraenderliche Spielressourcen
; -----------------------------------------------------------------------------

LABYRINTH_KARTE:
        DS      896,0

LABYRINTH_VORLAGE:
        INCBIN "maze_map.bin"

SPRITE_DATEN:
        INCBIN "maze_sprites.bin"

SPRITE_SPIELER_ZU  EQU SPRITE_DATEN + 0*128
SPRITE_SPIELER_L   EQU SPRITE_DATEN + 1*128
SPRITE_SPIELER_R   EQU SPRITE_DATEN + 2*128
SPRITE_SPIELER_O   EQU SPRITE_DATEN + 3*128
SPRITE_SPIELER_U   EQU SPRITE_DATEN + 4*128
SPRITE_GEGNER0     EQU SPRITE_DATEN + 5*128
SPRITE_GEGNER1     EQU SPRITE_DATEN + 6*128
SPRITE_GEGNER2     EQU SPRITE_DATEN + 7*128
SPRITE_GEGNER3     EQU SPRITE_DATEN + 8*128

ZIFFER_FONT:
        INCBIN "digit_font.bin"

; Unveraenderte Vorlage fuer den kompletten sichtbaren Grafikspeicher.
HINTERGRUND:
        INCBIN "maze_background.bin"

BILD_BEGRUESSUNG:
        INCBIN "maze_intro.bin"
BILD_GAME_OVER:
        INCBIN "maze_game_over.bin"
BILD_WINNER:
        INCBIN "maze_winner.bin"

PROGRAMM_ENDE:
