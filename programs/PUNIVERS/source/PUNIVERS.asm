; -----------------------------------------------------------------------------
; PUNIVERS.COM - Z-PUNIVERSE mit Titelmusik und TED-Spieleffekten
; Copyright (c) Tobias Bremer.
; Eigenentwicklung fuer den Z1013; keine historischen Programmteile oder Assets.
;
; Eigenstaendiges Plattformspiel mit zehn neu entworfenen Raeumen.
; Start: 0100h, Vollgrafik: OUT 18h, VRAM B000h-CFFFh
; Steuerung: Cursor links/rechts = laufen, Cursor hoch = springen
; -----------------------------------------------------------------------------

        ORG     0100h

VRAM            EQU     0B000h
STATUS_VRAM     EQU     0CC00h
ROOM_COUNT      EQU     10
ROOM_SIZE       EQU     896

T_EMPTY         EQU     0
T_SOLID         EQU     1
T_SPIKE         EQU     2
T_VITAMIN       EQU     3
T_DOOR          EQU     4
T_PLATFORM      EQU     5
T_OPEN_DOOR     EQU     6

KEY_LEFT        EQU     0
KEY_RIGHT       EQU     1
KEY_UP          EQU     2
KEY_DOWN        EQU     3

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
        OUT     (18h),A
        LD      HL,BILD_BEGRUESSUNG
        CALL    VOLLBILD_KOPIEREN
        LD      A,0Bh               ; Begruessung: Hellcyan
        CALL    FARBBILD_FUELLEN
        CALL    MUSIC_INIT
        CALL    AUF_ESC_DRUCK_WARTEN
        CALL    MUSIC_SILENCE
        JP      NEUES_SPIEL

NEUES_SPIEL:
        CALL    MUSIC_SILENCE
        LD      A,3
        LD      (LEBEN),A
        XOR     A
        LD      (SFX_TIMER),A
        LD      (SFX_TYP),A
        LD      (RAUM_NUMMER),A
        LD      (FRAME_ZAEHLER),A
        CALL    RAUM_LADEN
        JP      HAUPTSCHLEIFE

HAUPTSCHLEIFE:
        CALL    FRAME_PAUSE
        CALL    SOUND_SERVICE
        CALL    FIGUREN_LOESCHEN      ; Pixel und Attribute rueckstandsfrei
        CALL    EIS_TIMER_AKTUALISIEREN
        CALL    TASTATUR_LESEN
        CALL    SCHUSS_STARTEN
        CALL    SCHUSS_BEWEGEN
        CALL    HORIZONTAL_BEWEGEN
        CALL    HORIZONTAL_BEWEGEN   ; zwei Pixel pro Bild wie beim Vorbild
        CALL    SPRUNG_STARTEN
        CALL    VERTIKAL_BEWEGEN
        CALL    OBJEKTE_PRUEFEN
        CALL    TUERZONE_ZYKLUS
        CALL    GEGNER_BEWEGEN
        CALL    STEMPEL_BEWEGEN
        CALL    GEFAHR_PRUEFEN
        JP      C,SPIELER_GETROFFEN

        LD      A,(FRAME_ZAEHLER)
        INC     A
        LD      (FRAME_ZAEHLER),A
        CALL    FIGUREN_ZEICHNEN
        JP      HAUPTSCHLEIFE

SPIELER_GETROFFEN:
        LD      A,(LEBEN)
        DEC     A
        LD      (LEBEN),A
        CALL    STATUS_AKTUALISIEREN
        CALL    FIGUREN_ZEICHNEN      ; Trefferbild bleibt waehrend Ton sichtbar
        CALL    SOUND_LEBEN_VERLOREN
        LD      A,(LEBEN)
        OR      A
        JP      Z,SPIEL_ENDE

        CALL    FIGUREN_LOESCHEN
        CALL    POSITIONEN_RESET
        CALL    FIGUREN_ZEICHNEN
        JP      HAUPTSCHLEIFE

SPIEL_ENDE:
        LD      HL,BILD_GAME_OVER
        CALL    VOLLBILD_KOPIEREN
        LD      A,0Ch                ; GAME OVER: Hellrot
        CALL    FARBBILD_FUELLEN
        CALL    MUSIC_INIT
        JP      AUF_ESC_WARTEN

SPIEL_GEWONNEN:
        LD      HL,BILD_WINNER
        CALL    VOLLBILD_KOPIEREN
        LD      A,0Ah                ; WINNER: Hellgruen
        CALL    FARBBILD_FUELLEN
        CALL    MUSIC_INIT
        JP      AUF_ESC_WARTEN

AUF_ESC_WARTEN:
        CALL    AUF_ESC_DRUCK_WARTEN
        CALL    MUSIC_SILENCE
        JP      NEUES_SPIEL

AUF_ESC_DRUCK_WARTEN:
        CALL    FRAME_PAUSE
        CALL    MUSIC_SERVICE
        LD      A,8
        OUT     (08h),A
        IN      A,(04h)
        BIT     1,A                  ; ESC = Matrixzeile 8, Bit 1
        JR      Z,AUF_ESC_DRUCK_WARTEN
.LOSLASSEN:
        CALL    FRAME_PAUSE
        CALL    MUSIC_SERVICE
        LD      A,8
        OUT     (08h),A
        IN      A,(04h)
        BIT     1,A
        JR      NZ,.LOSLASSEN
        RET

; -----------------------------------------------------------------------------
; Raumverwaltung und Grafikaufbau
; -----------------------------------------------------------------------------

RAUM_LADEN:
        XOR     A
        OUT     (2Ch),A              ; waehrend komplettem Neuaufbau aus
        OUT     (20h),A
        LD      HL,RAUM_DATEN
        LD      A,(RAUM_NUMMER)
        OR      A
        JR      Z,.QUELLE_FERTIG
        LD      DE,ROOM_SIZE
.QUELLE_LOOP:
        ADD     HL,DE
        DEC     A
        JR      NZ,.QUELLE_LOOP
.QUELLE_FERTIG:
        LD      DE,ARBEITS_RAUM
        LD      BC,ROOM_SIZE
        LDIR

        CALL    SPIELFELD_LOESCHEN
        LD      HL,STATUS_NORMAL
        CALL    STATUS_BLOCK_KOPIEREN
        CALL    RAUM_ZEICHNEN

        LD      A,3
        LD      (REST_VITAMINE),A
        CALL    POSITIONEN_RESET
        CALL    STATUS_AKTUALISIEREN
        CALL    RAUM_FARBEN_AUFBAUEN
        CALL    FIGUREN_ZEICHNEN
        RET

NAECHSTER_RAUM:
        CALL    SOUND_LEVEL_GESCHAFFT
        LD      A,(RAUM_NUMMER)
        INC     A
        CP      ROOM_COUNT
        JP      Z,SPIEL_GEWONNEN
        LD      (RAUM_NUMMER),A
        CALL    RAUM_LADEN
        JP      HAUPTSCHLEIFE

SPIELFELD_LOESCHEN:
        LD      HL,VRAM
        LD      DE,VRAM+1
        LD      BC,01BFFh            ; 7168 Bytes, Zeilen 0..223
        XOR     A
        LD      (HL),A
        LDIR
        RET

STATUS_BLOCK_KOPIEREN:
        LD      DE,STATUS_VRAM
        LD      BC,0400h
        LDIR
        RET

; HL zeigt auf ein komplettes 8-KiB-Bild.
VOLLBILD_KOPIEREN:
        LD      DE,VRAM
        LD      BC,02000h
        LDIR
        RET

RAUM_ZEICHNEN:
        LD      HL,ARBEITS_RAUM
        LD      C,0                  ; Kachel-y
.Y_LOOP:
        LD      B,0                  ; Kachel-x
.X_LOOP:
        LD      A,(HL)
        INC     HL
        PUSH    HL
        CALL    KACHEL_ZEICHNEN
        POP     HL
        INC     B
        LD      A,B
        CP      32
        JR      NZ,.X_LOOP
        INC     C
        LD      A,C
        CP      28
        JR      NZ,.Y_LOOP
        RET

; A=Kachel, B=x, C=y. BC bleibt erhalten.
KACHEL_ZEICHNEN:
        PUSH    BC
        RLCA
        RLCA
        RLCA
        LD      L,A
        LD      H,0
        LD      DE,KACHEL_GRAFIK
        ADD     HL,DE
        PUSH    HL
        POP     IX

        LD      A,0B0h
        ADD     A,C
        LD      D,A
        LD      E,B
        LD      C,8
.ZEILE:
        LD      A,(IX+0)
        LD      (DE),A
        INC     IX
        LD      A,E
        ADD     A,32
        LD      E,A
        JR      NC,.OHNE_UEBERTRAG
        INC     D
.OHNE_UEBERTRAG:
        DEC     C
        JR      NZ,.ZEILE
        POP     BC
        RET

; B=x, C=y -> HL=Adresse, A=Inhalt
KACHEL_LESEN:
        LD      L,C
        LD      H,0
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        LD      E,B
        LD      D,0
        ADD     HL,DE
        LD      DE,ARBEITS_RAUM
        ADD     HL,DE
        LD      A,(HL)
        RET

; A=neuer Inhalt, B=x, C=y
KACHEL_SCHREIBEN:
        PUSH    AF
        PUSH    BC
        CALL    KACHEL_LESEN
        POP     BC
        POP     AF
        LD      (HL),A
        CALL    KACHEL_ZEICHNEN
        JP      KACHEL_FARBE_SCHREIBEN

; -----------------------------------------------------------------------------
; Initialpositionen
; -----------------------------------------------------------------------------

POSITIONEN_RESET:
        LD      A,8
        LD      (SPIELER_X),A
        LD      A,208
        LD      (SPIELER_Y),A
        LD      A,1
        LD      (SPIELER_RICHTUNG),A
        LD      (AM_BODEN),A
        XOR     A
        LD      (GESCHWINDIGKEIT_Y),A
        LD      (SPRUNG_SPERRE),A
        LD      (TASTEN),A
        LD      (SCHUSS_AKTIV),A
        LD      (SCHUSS_SPERRE),A
        LD      (GEGNER0_EIS),A
        LD      (GEGNER1_EIS),A
        LD      (GEGNER2_EIS),A

        LD      HL,GEISTER_TABELLE
        LD      A,(RAUM_NUMMER)
        OR      A
        JR      Z,.GEGNER_QUELLE_OK
        LD      DE,24
.GEGNER_QUELLE:
        ADD     HL,DE
        DEC     A
        JR      NZ,.GEGNER_QUELLE
.GEGNER_QUELLE_OK:
        LD      DE,GEGNER_X
        LD      BC,24
        LDIR
        LD      A,1
        LD      (TUERGEISTER_AKTIV),A
        LD      A,180                ; zunaechst einige Sekunden Bewachung
        LD      (TUERGEISTER_TIMER),A

        LD      HL,STEMPEL_TABELLE
        LD      A,(RAUM_NUMMER)
        OR      A
        JR      Z,.STEMPEL_QUELLE_OK
        LD      DE,10
.STEMPEL_QUELLE:
        ADD     HL,DE
        DEC     A
        JR      NZ,.STEMPEL_QUELLE
.STEMPEL_QUELLE_OK:
        LD      DE,STEMPEL0_X
        LD      BC,10
        LDIR
        RET

; -----------------------------------------------------------------------------
; Tastatur, horizontale Bewegung und Sprungphysik
; -----------------------------------------------------------------------------

TASTATUR_LESEN:
        XOR     A
        LD      (TASTEN),A

        OUT     (08h),A
        IN      A,(04h)
        BIT     0,A
        JR      Z,.NICHT_LINKS
        LD      A,(TASTEN)
        SET     KEY_LEFT,A
        LD      (TASTEN),A
.NICHT_LINKS:
        LD      A,2
        OUT     (08h),A
        IN      A,(04h)
        BIT     0,A
        JR      Z,.NICHT_HOCH
        LD      A,(TASTEN)
        SET     KEY_UP,A
        LD      (TASTEN),A
.NICHT_HOCH:
        LD      A,8
        OUT     (08h),A
        IN      A,(04h)
        LD      B,A
        BIT     2,B
        JR      Z,.NICHT_RECHTS
        LD      A,(TASTEN)
        SET     KEY_RIGHT,A
        LD      (TASTEN),A
.NICHT_RECHTS:
        BIT     3,B
        RET     Z
        LD      A,(TASTEN)
        SET     KEY_DOWN,A
        LD      (TASTEN),A
        RET

; Cursor runter feuert genau einmal pro Tastendruck in Blickrichtung.
SCHUSS_STARTEN:
        LD      A,(TASTEN)
        BIT     KEY_DOWN,A
        JR      Z,.TASTE_FREI
        LD      A,(SCHUSS_SPERRE)
        OR      A
        RET     NZ
        LD      A,1
        LD      (SCHUSS_SPERRE),A
        LD      A,(SCHUSS_AKTIV)
        OR      A
        RET     NZ

        LD      A,(SPIELER_RICHTUNG)
        LD      (SCHUSS_RICHTUNG),A
        OR      A
        JR      NZ,.NACH_RECHTS
        LD      A,(SPIELER_X)
        CP      8
        RET     C
        SUB     8
        JR      .POSITION
.NACH_RECHTS:
        LD      A,(SPIELER_X)
        CP      240
        RET     NC
        ADD     A,8
.POSITION:
        LD      (SCHUSS_X),A
        LD      A,(SPIELER_Y)
        LD      (SCHUSS_Y),A
        LD      A,1
        LD      (SCHUSS_AKTIV),A
        CALL    SOUND_EISSTRAHL
        RET
.TASTE_FREI:
        XOR     A
        LD      (SCHUSS_SPERRE),A
        RET

SCHUSS_BEWEGEN:
        LD      A,(SCHUSS_AKTIV)
        OR      A
        RET     Z
        LD      A,(SCHUSS_RICHTUNG)
        OR      A
        JR      NZ,.RECHTS
        LD      A,(SCHUSS_X)
        CP      4
        JP      C,SCHUSS_AUS
        SUB     4
        LD      (SCHUSS_X),A
        JR      .MAUER
.RECHTS:
        LD      A,(SCHUSS_X)
        CP      244
        JP      NC,SCHUSS_AUS
        ADD     A,4
        LD      (SCHUSS_X),A
.MAUER:
        LD      A,(SCHUSS_X)
        ADD     A,4
        SRL     A
        SRL     A
        SRL     A
        LD      B,A
        LD      A,(SCHUSS_Y)
        ADD     A,4
        SRL     A
        SRL     A
        SRL     A
        LD      C,A
        CALL    KACHEL_LESEN
        CP      T_SOLID
        JP      Z,SCHUSS_AUS

        LD      IX,GEGNER_X
        CALL    SCHUSS_GEIST_KOLLISION
        JR      C,.GEIST0
        LD      A,(TUERGEISTER_AKTIV)
        OR      A
        RET     Z
        LD      IX,GEGNER1_X
        CALL    SCHUSS_GEIST_KOLLISION
        JR      C,.GEIST1
        LD      IX,GEGNER2_X
        CALL    SCHUSS_GEIST_KOLLISION
        JR      C,.GEIST2
        RET
.GEIST0:
        LD      HL,GEGNER0_EIS
        JR      .EINFRIEREN
.GEIST1:
        LD      HL,GEGNER1_EIS
        JR      .EINFRIEREN
.GEIST2:
        LD      HL,GEGNER2_EIS
.EINFRIEREN:
        LD      (HL),250             ; etwa zehn Sekunden
        JP      SCHUSS_AUS

SCHUSS_GEIST_KOLLISION:
        LD      A,(IX+0)
        LD      B,A
        LD      A,(SCHUSS_X)
        SUB     B
        JP      P,.X_POSITIV
        NEG
.X_POSITIV:
        CP      7
        JR      NC,.NEIN
        LD      A,(IX+1)
        LD      B,A
        LD      A,(SCHUSS_Y)
        SUB     B
        JP      P,.Y_POSITIV
        NEG
.Y_POSITIV:
        CP      7
        JR      NC,.NEIN
        SCF
        RET
.NEIN:
        OR      A
        RET

SCHUSS_AUS:
        XOR     A
        LD      (SCHUSS_AKTIV),A
        RET

EIS_TIMER_AKTUALISIEREN:
        LD      HL,GEGNER0_EIS
        CALL    EIS_TIMER_EINER
        LD      HL,GEGNER1_EIS
        CALL    EIS_TIMER_EINER
        LD      HL,GEGNER2_EIS
        JP      EIS_TIMER_EINER

EIS_TIMER_EINER:
        LD      A,(HL)
        OR      A
        RET     Z
        DEC     (HL)
        RET

HORIZONTAL_BEWEGEN:
        LD      A,(TASTEN)
        BIT     KEY_LEFT,A
        JR      NZ,.LINKS
        BIT     KEY_RIGHT,A
        JR      NZ,.RECHTS
        RET
.LINKS:
        LD      A,(SPIELER_X)
        OR      A
        RET     Z
        DEC     A
        LD      (TEMP_X),A
        LD      D,A
        LD      A,(SPIELER_Y)
        LD      E,A
        CALL    PIXEL_IST_MAUER
        RET     C
        LD      A,(SPIELER_Y)
        ADD     A,7
        LD      E,A
        LD      A,(TEMP_X)
        LD      D,A
        CALL    PIXEL_IST_MAUER
        RET     C
        LD      A,(TEMP_X)
        LD      (SPIELER_X),A
        LD      A,0
        LD      (SPIELER_RICHTUNG),A
        RET
.RECHTS:
        LD      A,(SPIELER_X)
        CP      247
        RET     Z
        INC     A
        LD      (TEMP_X),A
        ADD     A,7
        LD      D,A
        LD      A,(SPIELER_Y)
        LD      E,A
        CALL    PIXEL_IST_MAUER
        RET     C
        LD      A,(SPIELER_Y)
        ADD     A,7
        LD      E,A
        LD      A,(TEMP_X)
        ADD     A,7
        LD      D,A
        CALL    PIXEL_IST_MAUER
        RET     C
        LD      A,(TEMP_X)
        LD      (SPIELER_X),A
        LD      A,1
        LD      (SPIELER_RICHTUNG),A
        RET

SPRUNG_STARTEN:
        LD      A,(TASTEN)
        BIT     KEY_UP,A
        JR      Z,.FREIGEBEN
        LD      A,(SPRUNG_SPERRE)
        OR      A
        RET     NZ
        LD      A,1
        LD      (SPRUNG_SPERRE),A
        LD      A,(AM_BODEN)
        OR      A
        RET     Z
        LD      A,0F9h               ; -7 Pixel pro Bild am Sprungbeginn
        LD      (GESCHWINDIGKEIT_Y),A
        XOR     A
        LD      (AM_BODEN),A
        CALL    SOUND_SPRUNG
        RET
.FREIGEBEN:
        XOR     A
        LD      (SPRUNG_SPERRE),A
        RET

VERTIKAL_BEWEGEN:
        LD      A,(GESCHWINDIGKEIT_Y)
        OR      A
        JR      Z,.SCHWERKRAFT
        BIT     7,A
        JR      Z,.ABWAERTS
        NEG
        LD      (TEMP_SCHRITTE),A
.AUF_LOOP:
        CALL    EIN_PIXEL_HOCH
        JR      C,.NACH_BEWEGUNG
        LD      A,(TEMP_SCHRITTE)
        DEC     A
        LD      (TEMP_SCHRITTE),A
        JR      NZ,.AUF_LOOP
        JR      .SCHWERKRAFT
.ABWAERTS:
        LD      (TEMP_SCHRITTE),A
.AB_LOOP:
        CALL    EIN_PIXEL_RUNTER
        JR      C,.NACH_BEWEGUNG
        LD      A,(TEMP_SCHRITTE)
        DEC     A
        LD      (TEMP_SCHRITTE),A
        JR      NZ,.AB_LOOP
.SCHWERKRAFT:
        LD      A,(GESCHWINDIGKEIT_Y)
        CP      6
        RET     Z
        INC     A
        LD      (GESCHWINDIGKEIT_Y),A
        RET
.NACH_BEWEGUNG:
        RET

EIN_PIXEL_HOCH:
        LD      A,(SPIELER_Y)
        OR      A
        JR      Z,.BLOCKIERT
        DEC     A
        LD      (TEMP_Y),A
        LD      E,A
        LD      A,(SPIELER_X)
        LD      D,A
        CALL    PIXEL_IST_MAUER
        JR      C,.BLOCKIERT
        LD      A,(SPIELER_X)
        ADD     A,7
        LD      D,A
        LD      A,(TEMP_Y)
        LD      E,A
        CALL    PIXEL_IST_MAUER
        JR      C,.BLOCKIERT
        LD      A,(TEMP_Y)
        LD      (SPIELER_Y),A
        XOR     A
        LD      (AM_BODEN),A
        RET
.BLOCKIERT:
        XOR     A
        LD      (GESCHWINDIGKEIT_Y),A
        SCF
        RET

EIN_PIXEL_RUNTER:
        LD      A,(SPIELER_Y)
        CP      216
        JR      NC,.BODEN
        INC     A
        LD      (TEMP_Y),A
        ADD     A,7
        LD      E,A
        LD      A,(SPIELER_X)
        LD      D,A
        CALL    PIXEL_IST_BODEN
        JR      C,.BODEN
        LD      A,(SPIELER_X)
        ADD     A,7
        LD      D,A
        LD      A,(TEMP_Y)
        ADD     A,7
        LD      E,A
        CALL    PIXEL_IST_BODEN
        JR      C,.BODEN
        LD      A,(TEMP_Y)
        LD      (SPIELER_Y),A
        XOR     A
        LD      (AM_BODEN),A
        RET
.BODEN:
        XOR     A
        LD      (GESCHWINDIGKEIT_Y),A
        LD      A,1
        LD      (AM_BODEN),A
        SCF
        RET

; D=Pixel-x, E=Pixel-y. Carry = feste Mauer.
PIXEL_IST_MAUER:
        LD      A,D
        SRL     A
        SRL     A
        SRL     A
        LD      B,A
        LD      A,E
        SRL     A
        SRL     A
        SRL     A
        LD      C,A
        CALL    KACHEL_LESEN
        CP      T_SOLID
        JR      Z,.JA
        OR      A
        RET
.JA:
        SCF
        RET

; D=Pixel-x, E=Pixel-y. Carry = Mauer oder durchspringbare Plattform.
PIXEL_IST_BODEN:
        LD      A,D
        SRL     A
        SRL     A
        SRL     A
        LD      B,A
        LD      A,E
        SRL     A
        SRL     A
        SRL     A
        LD      C,A
        CALL    KACHEL_LESEN
        CP      T_SOLID
        JR      Z,.JA
        CP      T_PLATFORM
        JR      Z,.JA
        OR      A
        RET
.JA:
        SCF
        RET

; -----------------------------------------------------------------------------
; Vitamine, Tuer und Gefahren
; -----------------------------------------------------------------------------

OBJEKTE_PRUEFEN:
        LD      A,(SPIELER_X)
        ADD     A,4
        SRL     A
        SRL     A
        SRL     A
        LD      B,A
        LD      A,(SPIELER_Y)
        ADD     A,4
        SRL     A
        SRL     A
        SRL     A
        LD      C,A
        PUSH    BC
        CALL    KACHEL_LESEN
        CP      T_VITAMIN
        JR      Z,.VITAMIN
        CP      T_OPEN_DOOR
        JR      Z,.TUER
        POP     BC
        RET
.VITAMIN:
        POP     BC
        LD      A,T_EMPTY
        CALL    KACHEL_SCHREIBEN
        LD      A,(REST_VITAMINE)
        DEC     A
        LD      (REST_VITAMINE),A
        LD      A,(LEBEN)
        INC     A
        LD      (LEBEN),A             ; jedes Vitamin schenkt ein Leben
        CALL    SOUND_VITAMIN
        CALL    STATUS_AKTUALISIEREN
        LD      A,(REST_VITAMINE)
        OR      A
        RET     NZ
        LD      B,30
        LD      C,26
        LD      A,T_OPEN_DOOR
        JP      KACHEL_SCHREIBEN
.TUER:
        POP     BC
        JP      NAECHSTER_RAUM

GEGNER_BEWEGEN:
        LD      A,(GEGNER0_EIS)
        OR      A
        JR      NZ,.GEIST0_FERTIG
        LD      IX,GEGNER_X
        CALL    GEIST_BEWEGEN
.GEIST0_FERTIG:
        LD      A,(TUERGEISTER_AKTIV)
        OR      A
        RET     Z
        LD      A,(GEGNER1_EIS)
        OR      A
        JR      NZ,.GEIST1_FERTIG
        LD      IX,GEGNER1_X
        CALL    GEIST_BEWEGEN
.GEIST1_FERTIG:
        LD      A,(GEGNER2_EIS)
        OR      A
        RET     NZ
        LD      IX,GEGNER2_X
        JP      GEIST_BEWEGEN

; Verfolger und Tuerwaechter ziehen sich regelmaessig gemeinsam zurueck.
; Der Wechsel erfolgt nach dem Loeschen der alten Sprites, damit beim Ein- und
; Ausblenden keine Grafikreste entstehen.
TUERZONE_ZYKLUS:
        LD      A,(TUERGEISTER_TIMER)
        DEC     A
        LD      (TUERGEISTER_TIMER),A
        RET     NZ
        LD      A,(TUERGEISTER_AKTIV)
        OR      A
        JR      Z,.REAKTIVIEREN
.FREIE_PHASE:
        XOR     A
        LD      (TUERGEISTER_AKTIV),A
        LD      A,140                ; mehrere Sekunden freie Tuerzone
        LD      (TUERGEISTER_TIMER),A
        RET
.REAKTIVIEREN:
        ; Solange der Spieler noch in der Tuerzone steht, bleibt sie frei.
        ; Dadurch kann kein Geist direkt auf dem Spieler wieder erscheinen.
        LD      A,(SPIELER_X)
        CP      176
        JR      C,.AKTIVIEREN
        LD      A,20
        LD      (TUERGEISTER_TIMER),A
        RET
.AKTIVIEREN:
        LD      A,1
        LD      (TUERGEISTER_AKTIV),A
        LD      A,180                ; Bewachungsphase
        LD      (TUERGEISTER_TIMER),A
        LD      A,120
        LD      (GEGNER1_X),A
        LD      A,208
        LD      (GEGNER1_Y),A
        LD      (GEGNER2_X),A
        LD      (GEGNER2_Y),A
        XOR     A
        LD      (GEGNER1_SPRUNGPHASE),A
        LD      (GEGNER2_SPRUNGPHASE),A
        RET

; IX: x,y,min-x,max-x,Richtung,Sprungphase,Wartezeit,Typ.
GEIST_BEWEGEN:
        LD      A,(IX+7)
        OR      A
        JR      Z,.PATROUILLE

        ; Verfolger und Tuerwaechter laufen auf den Spieler zu, bleiben aber
        ; in ihrem eigenen Bereich. Der Spieler ist doppelt so schnell.
        LD      A,(SPIELER_X)
        LD      B,A
        LD      A,(IX+0)
        CP      B
        JR      Z,.SPRUNG
        JR      C,.VERFOLGE_RECHTS
        LD      B,(IX+2)
        CP      B
        JR      C,.SPRUNG
        JR      Z,.SPRUNG
        DEC     A
        LD      (IX+0),A
        XOR     A
        LD      (IX+4),A
        JR      .SPRUNG
.VERFOLGE_RECHTS:
        LD      B,(IX+3)
        CP      B
        JR      NC,.SPRUNG
        INC     A
        LD      (IX+0),A
        LD      A,1
        LD      (IX+4),A
        JR      .SPRUNG

.PATROUILLE:
        LD      A,(IX+4)
        OR      A
        JR      NZ,.PATROUILLE_RECHTS
        LD      A,(IX+0)
        LD      B,(IX+2)
        CP      B
        JR      C,.PAT_DREHE_RECHTS
        JR      Z,.PAT_DREHE_RECHTS
        DEC     A
        LD      (IX+0),A
        JR      .SPRUNG
.PAT_DREHE_RECHTS:
        LD      A,1
        LD      (IX+4),A
        JR      .SPRUNG
.PATROUILLE_RECHTS:
        LD      A,(IX+0)
        LD      B,(IX+3)
        CP      B
        JR      NC,.PAT_DREHE_LINKS
        INC     A
        LD      (IX+0),A
        JR      .SPRUNG
.PAT_DREHE_LINKS:
        XOR     A
        LD      (IX+4),A

.SPRUNG:
        LD      A,(IX+5)
        OR      A
        JR      Z,.AM_BODEN
        INC     A
        CP      16
        JR      Z,.SPRUNG_ENDE
        LD      (IX+5),A
        JR      .SETZE_SPRUNGHOEHE
.SPRUNG_ENDE:
        XOR     A
        LD      (IX+5),A
        LD      A,208
        LD      (IX+1),A
        RET
.AM_BODEN:
        LD      A,(IX+6)
        OR      A
        JR      Z,.SPRUNG_START
        DEC     A
        LD      (IX+6),A
        LD      A,208
        LD      (IX+1),A
        RET
.SPRUNG_START:
        LD      A,(IX+7)
        RLCA
        RLCA
        RLCA
        ADD     A,18                 ; Typen springen unterschiedlich oft
        LD      (IX+6),A
        LD      A,1
        LD      (IX+5),A
        CALL    SOUND_VOGEL
.SETZE_SPRUNGHOEHE:
        LD      C,A
        LD      B,0
        LD      HL,GEIST_SPRUNGKURVE
        ADD     HL,BC
        LD      A,(HL)
        LD      B,A
        LD      A,208
        SUB     B
        LD      (IX+1),A
        RET

STEMPEL_BEWEGEN:
        LD      IX,STEMPEL0_X
        CALL    STEMPEL_EINER
        LD      IX,STEMPEL1_X
        JP      STEMPEL_EINER

; IX zeigt auf x,y,min-y,max-y,Richtung. 0=ab, 1=auf.
STEMPEL_EINER:
        LD      A,(IX+4)
        OR      A
        JR      NZ,.AUFWAERTS
        LD      A,(IX+1)
        LD      B,(IX+3)
        CP      B
        JR      NC,.NACH_OBEN_DREHEN
        ADD     A,4                  ; schneller Teleskopstempel
        LD      (IX+1),A
        RET
.NACH_OBEN_DREHEN:
        CALL    SOUND_STEMPEL_AUFSCHLAG
        LD      A,1
        LD      (IX+4),A
        RET
.AUFWAERTS:
        LD      A,(IX+1)
        LD      B,(IX+2)
        CP      B
        JR      C,.NACH_UNTEN_DREHEN
        JR      Z,.NACH_UNTEN_DREHEN
        SUB     4
        LD      (IX+1),A
        RET
.NACH_UNTEN_DREHEN:
        XOR     A
        LD      (IX+4),A
        RET

GEFAHR_PRUEFEN:
        LD      A,(SPIELER_X)
        ADD     A,4
        SRL     A
        SRL     A
        SRL     A
        LD      B,A
        LD      A,(SPIELER_Y)
        ADD     A,7
        SRL     A
        SRL     A
        SRL     A
        LD      C,A
        CALL    KACHEL_LESEN
        CP      T_SPIKE
        JR      Z,.TREFFER

        LD      A,(GEGNER0_EIS)
        OR      A
        JR      NZ,.GEIST0_SICHER
        LD      IX,GEGNER_X
        CALL    GEIST_KOLLISION
        JR      C,.TREFFER
.GEIST0_SICHER:
        LD      A,(TUERGEISTER_AKTIV)
        OR      A
        JR      Z,.PRUEFE_STEMPEL
        LD      A,(GEGNER1_EIS)
        OR      A
        JR      NZ,.GEIST1_SICHER
        LD      IX,GEGNER1_X
        CALL    GEIST_KOLLISION
        JR      C,.TREFFER
.GEIST1_SICHER:
        LD      A,(GEGNER2_EIS)
        OR      A
        JR      NZ,.PRUEFE_STEMPEL
        LD      IX,GEGNER2_X
        CALL    GEIST_KOLLISION
        JR      NC,.PRUEFE_STEMPEL
.TREFFER:
        SCF
        RET
.PRUEFE_STEMPEL:
        LD      IX,STEMPEL0_X
        CALL    STEMPEL_KOLLISION
        RET     C
        LD      IX,STEMPEL1_X
        JP      STEMPEL_KOLLISION

GEIST_KOLLISION:
        LD      A,(IX+0)
        LD      B,A
        LD      A,(SPIELER_X)
        SUB     B
        JP      P,.X_POSITIV
        NEG
.X_POSITIV:
        CP      7
        JR      NC,.NEIN
        LD      A,(IX+1)
        LD      B,A
        LD      A,(SPIELER_Y)
        SUB     B
        JP      P,.Y_POSITIV
        NEG
.Y_POSITIV:
        CP      7
        JR      NC,.NEIN
        SCF
        RET
.NEIN:
        OR      A
        RET

; Kollision gegen den 8x16-Kopf und die komplette Teleskopstange. Die Stange
; beginnt direkt unter der Decke bei y=8 und endet am beweglichen Kopf.
STEMPEL_KOLLISION:
        LD      A,(IX+0)
        LD      B,A
        LD      A,(SPIELER_X)
        SUB     B
        JP      P,.X_POSITIV
        NEG
.X_POSITIV:
        CP      7
        JR      NC,.NEIN

        LD      A,(IX+1)
        ADD     A,16
        LD      B,A
        LD      A,(SPIELER_Y)
        CP      B
        JR      NC,.NEIN             ; Spieler befindet sich unter dem Kopf
        LD      A,(SPIELER_Y)
        ADD     A,8
        CP      8
        JR      C,.NEIN              ; oberhalb der Teleskopstange
        JR      Z,.NEIN
        SCF
        RET
.NEIN:
        OR      A
        RET

; -----------------------------------------------------------------------------
; Statusanzeige
; -----------------------------------------------------------------------------

STATUS_AKTUALISIEREN:
        LD      A,(RAUM_NUMMER)
        INC     A
        CP      10
        JR      Z,.RAUM_ZEHN
        LD      (TEMP_ZIFFER),A
        XOR     A
        LD      B,20
        LD      C,28
        CALL    ZIFFER_ZEICHNEN
        LD      A,(TEMP_ZIFFER)
        LD      B,21
        LD      C,28
        CALL    ZIFFER_ZEICHNEN
        JR      .LEBEN
.RAUM_ZEHN:
        LD      A,1
        LD      B,20
        LD      C,28
        CALL    ZIFFER_ZEICHNEN
        XOR     A
        LD      B,21
        LD      C,28
        CALL    ZIFFER_ZEICHNEN
.LEBEN:
        LD      A,(LEBEN)
        LD      D,0
.LEBEN_TEILEN:
        CP      10
        JR      C,.LEBEN_FERTIG
        SUB     10
        INC     D
        JR      .LEBEN_TEILEN
.LEBEN_FERTIG:
        LD      (TEMP_EINER),A
        LD      A,D
        LD      (TEMP_ZEHNER),A
        LD      B,7
        LD      C,29
        CALL    ZIFFER_ZEICHNEN
        LD      A,(TEMP_EINER)
        LD      B,8
        LD      C,29
        CALL    ZIFFER_ZEICHNEN
        LD      A,(REST_VITAMINE)
        LD      B,24
        LD      C,29
        JP      ZIFFER_ZEICHNEN

; A=0..9, B=Spalte, C=Kachelzeile
ZIFFER_ZEICHNEN:
        RLCA
        RLCA
        RLCA
        LD      L,A
        LD      H,0
        LD      DE,ZIFFER_FONT
        ADD     HL,DE
        PUSH    HL
        POP     IX
        LD      A,0B0h
        ADD     A,C
        LD      D,A
        LD      E,B
        LD      B,8
.LOOP:
        LD      A,(IX+0)
        LD      (DE),A
        INC     IX
        LD      A,E
        ADD     A,32
        LD      E,A
        JR      NC,.OK
        INC     D
.OK:
        DJNZ    .LOOP
        RET

; -----------------------------------------------------------------------------
; Farbige XOR-Sprites
;
; Beim Loeschen wird zuerst exakt dieselbe XOR-Maske entfernt und danach das
; Grundattribut aus ARBEITS_RAUM wiederhergestellt. Beim Zeichnen wird das
; Attribut vor dem XOR gesetzt. Die zeitkritischen Attributzeilen werden pro
; Kachelgruppe vorbereitet und danach als schneller Block geschrieben.
; -----------------------------------------------------------------------------

FIGUREN_LOESCHEN:
        XOR     A
        LD      (FIGUREN_FARBMODUS),A
        JP      FIGUREN_AUSGEBEN

FIGUREN_ZEICHNEN:
        LD      A,1
        LD      (FIGUREN_FARBMODUS),A

FIGUREN_AUSGEBEN:
        CALL    SPIELER_SPRITE_ADRESSE
        LD      A,(SPIELER_X)
        LD      D,A
        LD      A,(SPIELER_Y)
        LD      E,A
        LD      A,0Eh                       ; Spieler: Gelb
        CALL    FIGUR_8_MIT_FARBE

        LD      HL,SPRITE_GEIST0
        LD      A,0Ch                       ; Geist 0: Hellrot
        LD      (TEMP_FIGUR_FARBE),A
        LD      A,(GEGNER0_EIS)
        OR      A
        JR      Z,.GEIST0_GRAFIK_OK
        LD      HL,SPRITE_EIS
        LD      A,0Bh                       ; eingefroren: Hellcyan
        LD      (TEMP_FIGUR_FARBE),A
.GEIST0_GRAFIK_OK:
        LD      A,(GEGNER_X)
        LD      D,A
        LD      A,(GEGNER_Y)
        LD      E,A
        LD      A,(TEMP_FIGUR_FARBE)
        CALL    FIGUR_8_MIT_FARBE

        LD      A,(TUERGEISTER_AKTIV)
        OR      A
        JR      Z,.OHNE_TUERGEISTER
        LD      HL,SPRITE_GEIST1
        LD      A,0Dh                       ; Geist 1: Hellmagenta
        LD      (TEMP_FIGUR_FARBE),A
        LD      A,(GEGNER1_EIS)
        OR      A
        JR      Z,.GEIST1_GRAFIK_OK
        LD      HL,SPRITE_EIS
        LD      A,0Bh
        LD      (TEMP_FIGUR_FARBE),A
.GEIST1_GRAFIK_OK:
        LD      A,(GEGNER1_X)
        LD      D,A
        LD      A,(GEGNER1_Y)
        LD      E,A
        LD      A,(TEMP_FIGUR_FARBE)
        CALL    FIGUR_8_MIT_FARBE

        LD      HL,SPRITE_GEIST2
        LD      A,0Ah                       ; Geist 2: Hellgruen
        LD      (TEMP_FIGUR_FARBE),A
        LD      A,(GEGNER2_EIS)
        OR      A
        JR      Z,.GEIST2_GRAFIK_OK
        LD      HL,SPRITE_EIS
        LD      A,0Bh
        LD      (TEMP_FIGUR_FARBE),A
.GEIST2_GRAFIK_OK:
        LD      A,(GEGNER2_X)
        LD      D,A
        LD      A,(GEGNER2_Y)
        LD      E,A
        LD      A,(TEMP_FIGUR_FARBE)
        CALL    FIGUR_8_MIT_FARBE
.OHNE_TUERGEISTER:

        LD      A,(SCHUSS_AKTIV)
        OR      A
        JR      Z,.OHNE_SCHUSS
        LD      HL,SPRITE_SCHUSS
        LD      A,(SCHUSS_X)
        LD      D,A
        LD      A,(SCHUSS_Y)
        LD      E,A
        LD      A,0Fh                       ; Eisschuss: Weiss
        CALL    FIGUR_8_MIT_FARBE
.OHNE_SCHUSS:

        LD      A,(STEMPEL0_X)
        LD      D,A
        LD      A,(STEMPEL0_Y)
        LD      E,A
        LD      A,07h                       ; Teleskopstange: Hellgrau
        CALL    STANGE_MIT_FARBE
        LD      HL,SPRITE_STEMPEL
        LD      A,(STEMPEL0_X)
        LD      D,A
        LD      A,(STEMPEL0_Y)
        LD      E,A
        LD      A,06h                       ; Stempelkopf: Braun
        CALL    FIGUR_16_MIT_FARBE

        LD      A,(STEMPEL1_X)
        LD      D,A
        LD      A,(STEMPEL1_Y)
        LD      E,A
        LD      A,07h
        CALL    STANGE_MIT_FARBE
        LD      HL,SPRITE_STEMPEL
        LD      A,(STEMPEL1_X)
        LD      D,A
        LD      A,(STEMPEL1_Y)
        LD      E,A
        LD      A,06h
        JP      FIGUR_16_MIT_FARBE

; A=Farbe, HL=Sprite, D/E=Position.
FIGUR_8_MIT_FARBE:
        PUSH    AF
        LD      A,(FIGUREN_FARBMODUS)
        OR      A
        JR      Z,.LOESCHEN
        POP     AF
        CALL    SPRITE_FARBE_SETZEN_8
        JP      SPRITE_XOR
.LOESCHEN:
        POP     AF
        PUSH    DE
        CALL    SPRITE_XOR
        POP     DE
        JP      SPRITE_FARBE_WIEDERHERSTELLEN_8

FIGUR_16_MIT_FARBE:
        PUSH    AF
        LD      A,(FIGUREN_FARBMODUS)
        OR      A
        JR      Z,.LOESCHEN
        POP     AF
        CALL    SPRITE_FARBE_SETZEN_16
        JP      SPRITE_XOR_16
.LOESCHEN:
        POP     AF
        PUSH    DE
        CALL    SPRITE_XOR_16
        POP     DE
        JP      SPRITE_FARBE_WIEDERHERSTELLEN_16

; A=Farbe, D/E=x/Kopf-y.
STANGE_MIT_FARBE:
        PUSH    AF
        LD      A,(FIGUREN_FARBMODUS)
        OR      A
        JR      Z,.LOESCHEN
        POP     AF
        CALL    STANGE_FARBE_SETZEN
        JP      STEMPEL_STANGE_XOR
.LOESCHEN:
        POP     AF
        PUSH    DE
        CALL    STEMPEL_STANGE_XOR
        POP     DE
        JP      STANGE_FARBE_WIEDERHERSTELLEN

; D=x, E=y des Stempelkopfs. Zeichnet eine zweipixelbreite, mit Gelenken
; versehene Teleskopstange von y=8 bis unmittelbar vor den Kopf. Alle
; Stempelpositionen liegen absichtlich auf Byte-Grenzen.
STEMPEL_STANGE_XOR:
        LD      A,E
        SUB     8
        RET     Z
        LD      C,A                  ; Anzahl sichtbarer Stangenzeilen
        LD      A,D
        SRL     A
        SRL     A
        SRL     A
        LD      L,A
        LD      H,0B1h               ; VRAM-Zeile 8
        LD      DE,32
.ZEILE:
        LD      A,C
        AND     7
        LD      A,018h               ; schmale Stange
        JR      NZ,.MASKE_OK
        LD      A,03Ch               ; breiteres Teleskopgelenk
.MASKE_OK:
        XOR     (HL)
        LD      (HL),A
        ADD     HL,DE
        DEC     C
        JR      NZ,.ZEILE
        RET

SPIELER_SPRITE_ADRESSE:
        LD      A,(FRAME_ZAEHLER)
        AND     8
        JR      NZ,.PHASE_B
        LD      HL,SPRITE_SPIELER_L_A
        LD      A,(SPIELER_RICHTUNG)
        OR      A
        RET     Z
        LD      HL,SPRITE_SPIELER_R_A
        RET
.PHASE_B:
        LD      HL,SPRITE_SPIELER_L_B
        LD      A,(SPIELER_RICHTUNG)
        OR      A
        RET     Z
        LD      HL,SPRITE_SPIELER_R_B
        RET

; HL=Spritebasis, D=x, E=y
SPRITE_XOR:
        LD      A,D
        AND     7
        RLCA
        RLCA
        RLCA
        RLCA
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
        ADD     HL,HL
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

; Wie SPRITE_XOR, jedoch fuer den 8x16-Pixel-Stempel.
SPRITE_XOR_16:
        LD      A,D
        AND     7
        RLCA
        RLCA
        RLCA
        RLCA
        RLCA                            ; Verschiebung * 32
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
        ADD     HL,HL
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
        LD      C,16
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

; Baut den kompletten Farbhintergrund aus dem aktuellen Arbeitsraum auf. Jede
; 8x8-Kachel liefert acht identische Attributzeilen. Danach folgen vier
; verschiedenfarbige Statusbereiche. Die Pixelgrafik bleibt unveraendert.
RAUM_FARBEN_AUFBAUEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        XOR     A
        OUT     (24h),A
        LD      HL,ARBEITS_RAUM
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
        CALL    KACHEL_WERT_ZU_FARBE
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

        LD      HL,STATUS_VRAM
        LD      BC,0100h
        LD      A,0Bh                       ; Raumtitel: Hellcyan
        CALL    FARBBEREICH_FUELLEN
        LD      BC,0100h
        LD      A,0Eh                       ; Leben/Vitamine: Gelb
        CALL    FARBBEREICH_FUELLEN
        LD      BC,0100h
        LD      A,07h                       ; Hinweise: Hellgrau
        CALL    FARBBEREICH_FUELLEN
        LD      BC,0100h
        LD      A,0Ah                       ; Steuerung: Hellgruen
        CALL    FARBBEREICH_FUELLEN

        XOR     A
        OUT     (20h),A
        OUT     (28h),A
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; A=Farbe. Faerbt nur den 1024-Byte-Statusbereich, beispielsweise fuer
; GAME OVER und WINNER. Der Pixel-VRAM wird danach wieder eingeblendet.
STATUS_FARBE_FUELLEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      D,A
        XOR     A
        OUT     (24h),A
        LD      HL,STATUS_VRAM
        LD      BC,0400h
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

; A=Farbe. Faerbt ein komplettes 256x256-Vollbild einfarbig ein.
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

; A=Kachelwert, Rueckgabe A=Vordergrundfarbe bei schwarzem Hintergrund.
KACHEL_WERT_ZU_FARBE:
        OR      A
        JR      Z,.LEER
        CP      T_SOLID
        JR      Z,.MAUER
        CP      T_SPIKE
        JR      Z,.STACHEL
        CP      T_VITAMIN
        JR      Z,.VITAMIN
        CP      T_DOOR
        JR      Z,.TUER
        CP      T_PLATFORM
        JR      Z,.PLATTFORM
        CP      T_OPEN_DOOR
        JR      Z,.OFFENE_TUER
        LD      A,0Fh
        RET
.LEER:
        XOR     A
        RET
.MAUER:
        LD      A,09h                       ; Mauer/Decke: Hellblau
        RET
.STACHEL:
        LD      A,0Ch                       ; Gefahr: Hellrot
        RET
.VITAMIN:
        LD      A,0Eh                       ; Vitamin: Gelb
        RET
.TUER:
        LD      A,0Dh                       ; geschlossene Tuer: Magenta
        RET
.PLATTFORM:
        LD      A,0Bh                       ; Plattform: Hellcyan
        RET
.OFFENE_TUER:
        LD      A,0Ah                       ; Ausgang: Hellgruen
        RET

; B=Kachel-x, C=Kachel-y. Aktualisiert nach einer Aenderung genau die acht
; zugehoerigen Attributbytes. BC und alle weiteren Register bleiben erhalten.
KACHEL_FARBE_SCHREIBEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        CALL    KACHEL_LESEN
        CALL    KACHEL_WERT_ZU_FARBE
        LD      (TEMP_KACHEL_FARBE),A
        XOR     A
        OUT     (24h),A
        LD      A,0B0h
        ADD     A,C
        LD      H,A
        LD      L,B
        LD      DE,32
        LD      B,8
.ZEILE:
        LD      A,(TEMP_KACHEL_FARBE)
        LD      (HL),A
        ADD     HL,DE
        DJNZ    .ZEILE
        XOR     A
        OUT     (20h),A
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; Farbblock fuer horizontal verschobene 8- und 16-Pixel-Sprites. Ein Sprite
; beruehrt zwei Attributspalten. Strukturkacheln behalten ihre Grundfarbe,
; damit beim Kontakt mit Waenden, Plattformen, Stacheln oder Tueren keine
; farbigen Kanten entstehen.
SPRITE_FARBE_SETZEN_8:
        LD      C,8
        JR      SPRITE_FARBE_SETZEN
SPRITE_FARBE_SETZEN_16:
        LD      C,16
SPRITE_FARBE_SETZEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      (TEMP_SPRITE_FARBE),A
        LD      A,1
        LD      (TEMP_FARBMODUS),A
        JR      SPRITE_FARBBLOCK_START

SPRITE_FARBE_WIEDERHERSTELLEN_8:
        LD      C,8
        JR      SPRITE_FARBE_WIEDERHERSTELLEN
SPRITE_FARBE_WIEDERHERSTELLEN_16:
        LD      C,16
SPRITE_FARBE_WIEDERHERSTELLEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        XOR     A
        LD      (TEMP_FARBMODUS),A

SPRITE_FARBBLOCK_START:
        LD      A,C
        LD      (TEMP_FARB_REST),A
        LD      A,D
        SRL     A
        SRL     A
        SRL     A
        LD      (TEMP_FARB_XBYTE),A
        LD      A,E
        LD      (TEMP_FARB_YPIXEL),A
        AND     7
        LD      B,A
        LD      A,8
        SUB     B
        LD      (TEMP_FARB_GRUPPE),A
        XOR     A
        OUT     (24h),A
        CALL    FARB_ZIELADRESSE

.GRUPPE:
        PUSH    HL
        LD      A,(TEMP_FARB_XBYTE)
        LD      B,A
        LD      A,(TEMP_FARB_YPIXEL)
        LD      C,A
        CALL    DYNAMISCHES_ATTRIBUT_FUER_POSITION
        LD      (TEMP_FARB_LINKS),A
        LD      A,(TEMP_FARB_XBYTE)
        INC     A
        LD      B,A
        LD      A,(TEMP_FARB_YPIXEL)
        LD      C,A
        CALL    DYNAMISCHES_ATTRIBUT_FUER_POSITION
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
        CP      8
        JR      C,.LETZTE_GRUPPE
        LD      A,8
.LETZTE_GRUPPE:
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

; B=Attributspalte, C=Pixelzeile. Im Wiederherstellungsmodus kommt immer die
; Grundfarbe zurueck. Beim Zeichnen behalten Strukturkacheln ihre Farbe;
; begehbare Felder erhalten die individuelle Figurenfarbe.
DYNAMISCHES_ATTRIBUT_FUER_POSITION:
        CALL    KACHELWERT_FUER_POSITION
        LD      D,A
        LD      A,(TEMP_FARBMODUS)
        OR      A
        LD      A,D
        JR      Z,.GRUNDFARBE
        CP      T_SOLID
        JR      Z,.GRUNDFARBE
        CP      T_SPIKE
        JR      Z,.GRUNDFARBE
        CP      T_DOOR
        JR      Z,.GRUNDFARBE
        CP      T_PLATFORM
        JR      Z,.GRUNDFARBE
        CP      T_OPEN_DOOR
        JR      Z,.GRUNDFARBE
        LD      A,(TEMP_SPRITE_FARBE)
        RET
.GRUNDFARBE:
        LD      A,D
        JP      KACHEL_WERT_ZU_FARBE

; B=Attributspalte, C=Pixelzeile. Liefert den aktuellen Kachelwert in A.
KACHELWERT_FUER_POSITION:
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
        LD      DE,ARBEITS_RAUM
        ADD     HL,DE
        LD      A,(HL)
        RET

; Zieladresse des ersten von zwei Sprite-Attributbytes.
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

; Farbblock fuer die ein Byte breite Teleskopstange von y=8 bis vor den Kopf.
STANGE_FARBE_SETZEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      (TEMP_SPRITE_FARBE),A
        LD      A,1
        LD      (TEMP_FARBMODUS),A
        JR      STANGE_FARBBLOCK_START

STANGE_FARBE_WIEDERHERSTELLEN:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL
        XOR     A
        LD      (TEMP_FARBMODUS),A

STANGE_FARBBLOCK_START:
        LD      A,E
        SUB     8
        JR      Z,.FERTIG_OHNE_BANK
        LD      (TEMP_FARB_REST),A
        LD      A,D
        SRL     A
        SRL     A
        SRL     A
        LD      (TEMP_FARB_XBYTE),A
        LD      A,8
        LD      (TEMP_FARB_YPIXEL),A
        LD      A,(TEMP_FARB_REST)
        CP      8
        JR      C,.ERSTE_GRUPPE
        LD      A,8
.ERSTE_GRUPPE:
        LD      (TEMP_FARB_GRUPPE),A
        XOR     A
        OUT     (24h),A
        LD      A,(TEMP_FARB_XBYTE)
        LD      L,A
        LD      H,0B1h

.GRUPPE:
        PUSH    HL
        LD      A,(TEMP_FARB_XBYTE)
        LD      B,A
        LD      A,(TEMP_FARB_YPIXEL)
        LD      C,A
        CALL    DYNAMISCHES_ATTRIBUT_FUER_POSITION
        LD      (TEMP_FARB_LINKS),A
        POP     HL
        LD      DE,32
        LD      A,(TEMP_FARB_GRUPPE)
        LD      B,A
.ZEILE:
        LD      A,(TEMP_FARB_LINKS)
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
        CP      8
        JR      C,.LETZTE_GRUPPE
        LD      A,8
.LETZTE_GRUPPE:
        LD      (TEMP_FARB_GRUPPE),A
        JR      .GRUPPE
.FERTIG:
        XOR     A
        OUT     (20h),A
.FERTIG_OHNE_BANK:
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; -----------------------------------------------------------------------------
; TED-Musik
; -----------------------------------------------------------------------------

; Die Tonerzeugung laeuft in der FPGA-Hardware. Der Z80 ruft diesen kleinen
; nicht blockierenden Sequenzer nur einmal je Spielbild auf. Drei von vier
; Sechzehnteln dauern vier Spielbilder, eines drei Spielbilder. Mit der
; bestehenden Zeitbasis ergibt das ungefaehr 120 BPM.
MUSIC_INIT:
        XOR     A
        LD      (MUSIC_STEP),A
        LD      (MUSIC_TIMER),A
        LD      (MUSIC_HIT_ACTIVE),A
        JP      MUSIC_SILENCE

MUSIC_SERVICE:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        PUSH    HL

        ; Rauschschlaege belegen Stimme 2 nur fuer ein Spielbild.
        LD      A,(MUSIC_HIT_ACTIVE)
        OR      A
        JR      Z,.TIMER
        XOR     A
        LD      (MUSIC_HIT_ACTIVE),A
        CALL    MUSIC_PROGRAM_TONES

.TIMER:
        LD      A,(MUSIC_TIMER)
        OR      A
        JR      Z,.NEUER_SCHRITT
        DEC     A
        LD      (MUSIC_TIMER),A
        JR      NZ,.FERTIG

.NEUER_SCHRITT:
        ; Eine Melodienote gilt fuer zwei Sechzehntel.
        LD      A,(MUSIC_STEP)
        SRL     A
        LD      E,A
        LD      D,0
        LD      HL,MUSIC_MELODY
        ADD     HL,DE
        LD      A,(HL)
        CALL    MUSIC_TONE_LOOKUP
        LD      A,E
        LD      (MUSIC_V1_LO),A
        LD      A,D
        LD      (MUSIC_V1_HI),A

        ; Je Takt bleibt eine tiefe Begleitnote stehen.
        LD      A,(MUSIC_STEP)
        SRL     A
        SRL     A
        SRL     A
        SRL     A
        LD      E,A
        LD      D,0
        LD      HL,MUSIC_BASS
        ADD     HL,DE
        LD      A,(HL)
        CALL    MUSIC_TONE_LOOKUP
        LD      A,E
        LD      (MUSIC_V2_LO),A
        LD      A,D
        LD      (MUSIC_V2_HI),A

        CALL    MUSIC_PROGRAM_TONES

        ; Das 4,4,4,3-Raster ist die um ein Drittel verlangsamte Fassung.
        LD      A,(MUSIC_STEP)
        AND     03h
        LD      C,4
        CP      3
        JR      NZ,.DAUER_SETZEN
        DEC     C
.DAUER_SETZEN:
        LD      A,C
        LD      (MUSIC_TIMER),A

        CALL    MUSIC_DRUM_EVENT

        LD      A,(MUSIC_STEP)
        INC     A
        AND     07Fh
        LD      (MUSIC_STEP),A

.FERTIG:
        POP     HL
        POP     DE
        POP     BC
        POP     AF
        RET

; A enthaelt einen Notenindex; DE liefert den 10-Bit-TED-Wert.
MUSIC_TONE_LOOKUP:
        ADD     A,A
        LD      E,A
        LD      D,0
        LD      HL,MUSIC_FREQ_TABLE
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        RET

MUSIC_PROGRAM_TONES:
        LD      A,(MUSIC_V1_LO)
        OUT     (PORT_TED_V1_LO),A
        LD      A,(MUSIC_V1_HI)
        OUT     (PORT_TED_V1_HI),A
        LD      A,(MUSIC_V2_LO)
        OUT     (PORT_TED_V2_LO),A
        LD      A,(MUSIC_V2_HI)
        OUT     (PORT_TED_V2_HI),A
        LD      A,0B5h              ; Reload, zwei Toene, Lautstaerke 5
        OUT     (PORT_TED_CTRL),A
        LD      A,035h
        OUT     (PORT_TED_CTRL),A
        RET

; Kick auf 1/3, Snare auf 2/4, Hi-Hat dazwischen. Zwei schnelle Kicks
; schliessen jeden vierten Takt ab.
MUSIC_DRUM_EVENT:
        LD      A,(MUSIC_STEP)
        AND     03Fh
        CP      62
        JR      NC,.KICK
        LD      A,(MUSIC_STEP)
        AND     00Fh
        CP      0
        JR      Z,.KICK
        CP      8
        JR      Z,.KICK
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
        RET

.KICK:
        LD      A,060h
        OUT     (PORT_TED_V1_LO),A
        LD      A,001h
        OUT     (PORT_TED_V1_HI),A
        LD      A,050h
        OUT     (PORT_TED_V2_LO),A
        LD      A,003h
        OUT     (PORT_TED_V2_HI),A
        LD      A,0D7h
        OUT     (PORT_TED_CTRL),A
        LD      A,057h
        OUT     (PORT_TED_CTRL),A
        JR      .HIT_AKTIV

.SNARE:
        LD      A,0D8h
        OUT     (PORT_TED_V2_LO),A
        LD      A,003h
        OUT     (PORT_TED_V2_HI),A
        LD      A,0D6h
        OUT     (PORT_TED_CTRL),A
        LD      A,056h
        OUT     (PORT_TED_CTRL),A
        JR      .HIT_AKTIV

.HIHAT:
        LD      A,0F8h
        OUT     (PORT_TED_V2_LO),A
        LD      A,003h
        OUT     (PORT_TED_V2_HI),A
        LD      A,0D4h
        OUT     (PORT_TED_CTRL),A
        LD      A,054h
        OUT     (PORT_TED_CTRL),A

.HIT_AKTIV:
        LD      A,1
        LD      (MUSIC_HIT_ACTIVE),A
        RET

MUSIC_SILENCE:
        XOR     A
        OUT     (PORT_TED_CTRL),A
        RET

; -----------------------------------------------------------------------------
; Kurze Spieleffekte
; -----------------------------------------------------------------------------

; Beendet einen nicht blockierenden Spieleffekt nach wenigen Bildern.
SOUND_SERVICE:
        PUSH    AF
        PUSH    BC
        PUSH    DE
        LD      A,(SFX_TIMER)
        OR      A
        JR      Z,.FERTIG
        DEC     A
        LD      (SFX_TIMER),A
        JR      Z,.STOPP
        LD      B,A
        LD      A,(SFX_TYP)
        CP      1
        CALL    Z,SOUND_BASSDRUM_UPDATE
        CP      2
        CALL    Z,SOUND_VOGEL_UPDATE
        JR      .FERTIG
.STOPP:
        XOR     A
        LD      (SFX_TYP),A
        CALL    MUSIC_SILENCE
.FERTIG:
        POP     DE
        POP     BC
        POP     AF
        RET

; A=Frequenz low, B=Frequenz high, C=Dauer in Spielbildern.
SOUND_TON_START:
        OUT     (PORT_TED_V1_LO),A
        LD      A,B
        OUT     (PORT_TED_V1_HI),A
        LD      A,095h              ; Reload + Stimme 1 + Lautstaerke 5
        OUT     (PORT_TED_CTRL),A
        LD      A,015h
        OUT     (PORT_TED_CTRL),A
        LD      A,C
        LD      (SFX_TIMER),A
        XOR     A
        LD      (SFX_TYP),A
        RET

SOUND_SPRUNG:
        LD      A,020h              ; kurzer heller Sprungimpuls
        LD      B,003h
        LD      C,2
        JP      SOUND_TON_START

SOUND_VITAMIN:
        LD      A,082h              ; sehr heller Sammelton
        LD      B,003h
        LD      C,3
        JP      SOUND_TON_START

SOUND_EISSTRAHL:
        LD      A,0E8h
        OUT     (PORT_TED_V2_LO),A
        LD      A,003h
        OUT     (PORT_TED_V2_HI),A
        LD      A,0C5h              ; Reload + Rauschen + Lautstaerke 5
        OUT     (PORT_TED_CTRL),A
        LD      A,045h
        OUT     (PORT_TED_CTRL),A
        LD      A,2
        LD      (SFX_TIMER),A
        XOR     A
        LD      (SFX_TYP),A
        RET

SOUND_STEMPEL_AUFSCHLAG:
        ; Erster kurzer Klick mit Rauschen, danach wird die Rechteckstimme
        ; ueber mehrere Bilder stark nach unten gezogen: Bassdrum-Charakter.
        LD      A,040h
        OUT     (PORT_TED_V1_LO),A
        LD      A,002h
        OUT     (PORT_TED_V1_HI),A
        LD      A,0D0h
        OUT     (PORT_TED_V2_LO),A
        LD      A,003h
        OUT     (PORT_TED_V2_HI),A
        LD      A,0D7h
        OUT     (PORT_TED_CTRL),A
        LD      A,057h
        OUT     (PORT_TED_CTRL),A
        LD      A,4
        LD      (SFX_TIMER),A
        LD      A,1
        LD      (SFX_TYP),A
        RET

; B enthaelt die verbleibenden Bilder 3, 2 oder 1.
SOUND_BASSDRUM_UPDATE:
        LD      A,B
        CP      3
        JR      Z,.MITTE
        CP      2
        JR      Z,.TIEF
        LD      A,010h
        LD      D,000h
        LD      C,012h              ; Ausklang, Pegel 2
        JR      .AUSGABE
.MITTE:
        LD      A,080h
        LD      D,001h
        LD      C,016h              ; Pegel 6
        JR      .AUSGABE
.TIEF:
        LD      A,0C0h
        LD      D,000h
        LD      C,014h              ; Pegel 4
.AUSGABE:
        OUT     (PORT_TED_V1_LO),A
        LD      A,D
        OUT     (PORT_TED_V1_HI),A
        LD      A,C
        OR      080h                ; Reload + Stimme 1
        OUT     (PORT_TED_CTRL),A
        LD      A,C
        OUT     (PORT_TED_CTRL),A
        RET

; Das Geisterzwitschern darf laufende Spieleraktionen nicht ueberdecken.
; Treffen mehrere Geister im selben Bild ihren Sprungpunkt, startet es nur
; einmal und wird danach in drei kurzen Tonstufen weitergefuehrt.
SOUND_VOGEL:
        LD      A,(SFX_TIMER)
        OR      A
        RET     NZ
        LD      A,050h
        OUT     (PORT_TED_V1_LO),A
        LD      A,003h
        OUT     (PORT_TED_V1_HI),A
        LD      A,094h
        OUT     (PORT_TED_CTRL),A
        LD      A,014h
        OUT     (PORT_TED_CTRL),A
        LD      A,4
        LD      (SFX_TIMER),A
        LD      A,2
        LD      (SFX_TYP),A
        RET

; B enthaelt die verbleibenden Bilder 3, 2 oder 1.
SOUND_VOGEL_UPDATE:
        LD      A,B
        CP      3
        JR      Z,.HOCH
        CP      2
        JR      Z,.ANTWORT
        LD      A,090h
        JR      .AUSGABE
.HOCH:
        LD      A,082h
        JR      .AUSGABE
.ANTWORT:
        LD      A,05Ah
.AUSGABE:
        OUT     (PORT_TED_V1_LO),A
        LD      A,003h
        OUT     (PORT_TED_V1_HI),A
        LD      A,094h
        OUT     (PORT_TED_CTRL),A
        LD      A,014h
        OUT     (PORT_TED_CTRL),A
        RET

; Absteigender Ton ueber die bereits vorhandene Trefferpause. Dadurch wird
; kein zusaetzlicher Stillstand in das Spiel eingefuegt.
SOUND_LEBEN_VERLOREN:
        XOR     A
        LD      (SFX_TIMER),A
        LD      (SFX_TYP),A
        LD      HL,0380h
        LD      D,18
.SCHRITT:
        LD      A,L
        OUT     (PORT_TED_V1_LO),A
        LD      A,H
        OUT     (PORT_TED_V1_HI),A
        LD      A,097h
        OUT     (PORT_TED_CTRL),A
        LD      A,017h
        OUT     (PORT_TED_CTRL),A
        CALL    FRAME_PAUSE
        LD      BC,0FFE0h
        ADD     HL,BC
        DEC     D
        JR      NZ,.SCHRITT
        JP      MUSIC_SILENCE

; Kurze aufsteigende Fanfare beim Verlassen jedes Raumes, einschliesslich
; des zehnten Raumes vor dem WINNER-Bildschirm.
SOUND_LEVEL_GESCHAFFT:
        XOR     A
        LD      (SFX_TIMER),A
        LD      (SFX_TYP),A
        LD      IX,SOUND_LEVEL_NOTEN
        LD      D,6
.NOTE:
        LD      A,(IX+0)
        OUT     (PORT_TED_V1_LO),A
        LD      A,(IX+1)
        OUT     (PORT_TED_V1_HI),A
        LD      A,097h
        OUT     (PORT_TED_CTRL),A
        LD      A,017h
        OUT     (PORT_TED_CTRL),A
        CALL    FRAME_PAUSE
        CALL    FRAME_PAUSE
        INC     IX
        INC     IX
        DEC     D
        JR      NZ,.NOTE
        JP      MUSIC_SILENCE

SOUND_LEVEL_NOTEN:
        DW      02D4h,0304h,0320h,0343h,036Ah,0382h

; 10-Bit-Teilerwerte des FPGA-TED-Kerns. Die Melodie verwendet bewusst
; nur einen kompakten Tonumfang, damit sie auch auf dem Ein-Bit-Audioweg
; klar und geschlossen klingt.
; Indizes: A2, B2, C3, D3, E3, Fis3, G3, Fis4, G4, A4, B4,
;          C5, D5, E5, Fis5, G5, A5
MUSIC_FREQ_TABLE:
        DW      0010h
        DW      007Eh
        DW      00B1h
        DW      010Dh
        DW      015Fh
        DW      01A9h
        DW      01CAh
        DW      02D4h
        DW      02E5h
        DW      0304h
        DW      0320h
        DW      032Ch
        DW      0343h
        DW      0358h
        DW      036Ah
        DW      0373h
        DW      0382h

; 64 Achtelnoten = acht Takte. Jeder Eintrag wird zwei Sechzehntel lang
; gehalten; der Schlagzeugrhythmus arbeitet weiterhin im 16tel-Raster.
MUSIC_MELODY:
        DB      13,13,10,10,12,12,13,13
        DB      15,15,14,14,13,13,12,12
        DB      10,10,9,9,8,8,7,7
        DB      13,10,12,13,15,14,13,12
        DB      13,15,16,15,14,13,12,10
        DB      12,13,14,15,14,13,12,10
        DB      10,12,13,15,16,15,14,12
        DB      13,12,10,12,13,15,14,13

; Eine Bassnote je Takt.
MUSIC_BASS:
        DB      4,2,6,3,4,2,1,4

; -----------------------------------------------------------------------------
; Zeitbasis und Daten
; -----------------------------------------------------------------------------

FRAME_PAUSE:
        LD      BC,02800h
.LOOP:
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,.LOOP
        RET

SPIELER_X:              DB 0
SPIELER_Y:              DB 0
SPIELER_RICHTUNG:       DB 0
GESCHWINDIGKEIT_Y:      DB 0
AM_BODEN:               DB 0
SPRUNG_SPERRE:          DB 0
TASTEN:                 DB 0
FRAME_ZAEHLER:          DB 0
MUSIC_STEP:             DB 0
MUSIC_TIMER:            DB 0
MUSIC_HIT_ACTIVE:       DB 0
MUSIC_V1_LO:            DB 0
MUSIC_V1_HI:            DB 0
MUSIC_V2_LO:            DB 0
MUSIC_V2_HI:            DB 0
SFX_TIMER:              DB 0
SFX_TYP:                DB 0          ; 0=statisch, 1=Bassdrum, 2=Vogel
LEBEN:                  DB 0
RAUM_NUMMER:            DB 0
REST_VITAMINE:          DB 0
TEMP_X:                 DB 0
TEMP_Y:                 DB 0
TEMP_SCHRITTE:          DB 0
TEMP_ZIFFER:            DB 0
TEMP_ZEHNER:            DB 0
TEMP_EINER:             DB 0
TUERGEISTER_AKTIV:      DB 0
TUERGEISTER_TIMER:      DB 0
SCHUSS_AKTIV:           DB 0
SCHUSS_SPERRE:          DB 0
SCHUSS_X:               DB 0
SCHUSS_Y:               DB 0
SCHUSS_RICHTUNG:        DB 0
GEGNER0_EIS:            DB 0
GEGNER1_EIS:            DB 0
GEGNER2_EIS:            DB 0

; Arbeitsvariablen der Farbebene. Sie liegen im normalen Programmspeicher;
; der 8-KiB-Farbspeicher selbst wird nur kurz ueber OUT 24h eingeblendet.
FIGUREN_FARBMODUS:      DB 0
TEMP_FIGUR_FARBE:       DB 0
TEMP_KACHEL_FARBE:      DB 0
TEMP_SPRITE_FARBE:      DB 0
TEMP_FARBMODUS:         DB 0
TEMP_FARB_XBYTE:        DB 0
TEMP_FARB_YPIXEL:       DB 0
TEMP_FARB_GRUPPE:       DB 0
TEMP_FARB_REST:         DB 0
TEMP_FARB_LINKS:        DB 0
TEMP_FARB_RECHTS:       DB 0
FARB_MAP_PTR:           DW 0
FARB_VRAM_PTR:          DW 0
FARB_KACHELZEILEN:      DB 0
FARB_PIXELZEILEN:       DB 0

GEGNER_X:               DB 0
GEGNER_Y:               DB 0
GEGNER_MIN_X:           DB 0
GEGNER_MAX_X:           DB 0
GEGNER_RICHTUNG:        DB 0
GEGNER_SPRUNGPHASE:     DB 0
GEGNER_WARTEZEIT:       DB 0
GEGNER_TYP:             DB 0

GEGNER1_X:              DB 0
GEGNER1_Y:              DB 0
GEGNER1_MIN_X:          DB 0
GEGNER1_MAX_X:          DB 0
GEGNER1_RICHTUNG:       DB 0
GEGNER1_SPRUNGPHASE:    DB 0
GEGNER1_WARTEZEIT:      DB 0
GEGNER1_TYP:            DB 0

GEGNER2_X:              DB 0
GEGNER2_Y:              DB 0
GEGNER2_MIN_X:          DB 0
GEGNER2_MAX_X:          DB 0
GEGNER2_RICHTUNG:       DB 0
GEGNER2_SPRUNGPHASE:    DB 0
GEGNER2_WARTEZEIT:      DB 0
GEGNER2_TYP:            DB 0

STEMPEL0_X:             DB 0
STEMPEL0_Y:             DB 0
STEMPEL0_MIN_Y:         DB 0
STEMPEL0_MAX_Y:         DB 0
STEMPEL0_RICHTUNG:      DB 0
STEMPEL1_X:             DB 0
STEMPEL1_Y:             DB 0
STEMPEL1_MIN_Y:         DB 0
STEMPEL1_MAX_Y:         DB 0
STEMPEL1_RICHTUNG:      DB 0

; Vertikale Abweichung fuer 15 Sprungphasen. Index 0 ist der Boden.
GEIST_SPRUNGKURVE:
        DB      0,4,8,12,16,20,24,28,28,24,20,16,12,8,4,0

ARBEITS_RAUM:
        DS      ROOM_SIZE,0

KACHEL_GRAFIK:
        INCBIN  "tile_glyphs.bin"

SPRITE_DATEN:
        INCBIN  "sprite_data.bin"
SPRITE_SPIELER_L_A      EQU SPRITE_DATEN + 0*128
SPRITE_SPIELER_R_A      EQU SPRITE_DATEN + 1*128
SPRITE_SPIELER_L_B      EQU SPRITE_DATEN + 2*128
SPRITE_SPIELER_R_B      EQU SPRITE_DATEN + 3*128
SPRITE_GEIST0           EQU SPRITE_DATEN + 4*128
SPRITE_GEIST1           EQU SPRITE_DATEN + 5*128
SPRITE_GEIST2           EQU SPRITE_DATEN + 6*128
SPRITE_SCHUSS           EQU SPRITE_DATEN + 7*128
SPRITE_EIS              EQU SPRITE_DATEN + 8*128
SPRITE_STEMPEL          EQU SPRITE_DATEN + 9*128

ZIFFER_FONT:
        INCBIN  "digit_font.bin"

GEISTER_TABELLE:
        INCBIN  "ghost_table.bin"

STEMPEL_TABELLE:
        INCBIN  "press_table.bin"

STATUS_NORMAL:
        INCBIN  "status_normal.bin"

RAUM_DATEN:
        INCBIN  "rooms.bin"

BILD_BEGRUESSUNG:
        INCBIN  "punivers_intro.bin"
BILD_GAME_OVER:
        INCBIN  "punivers_game_over.bin"
BILD_WINNER:
        INCBIN  "punivers_winner.bin"

PROGRAMM_ENDE:
