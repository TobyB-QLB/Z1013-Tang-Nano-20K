; Z1013 @DS FAT32 writer extension, loaded from boot ROM 1A00h to D300h.
; Syntax: @DS BEGIN END START, followed by "DATEI NAME >".
; The directory entry is committed last, so an interrupted write cannot expose
; a partially written Z1013 file. Existing files are deliberately not replaced.

        DEVICE ZXSPECTRUM48
        ORG     0D300h

; Stable entry points and variables of IO_FAT32_DL.BIN (E300h).
READ_FAT_FILENAME       EQU 0E3C6h
FAT32_INIT              EQU 0E535h
CLUSTER_TO_LBA          EQU 0E913h
READ_WORK_LBA           EQU 0E94Dh
ADD_WORD_TO_QUAD        EQU 0E97Fh
ADD_QUAD_TO_QUAD        EQU 0E991h
INCREMENT_QUAD          EQU 0E9A5h
COMPARE_BYTES           EQU 0E9C9h
OUTCH                   EQU 0E9D1h
PRINT_CR                EQU 0E9DAh
PRINT_Z                 EQU 0E9DFh
PRINT_MESSAGE           EQU 0E9E8h
PRINT_WORD_LE           EQU 0E9FDh

TEXT_DIRECTORY_MORE     EQU 0EB3Fh
FAT_LBA                 EQU 0EB5Dh
FAT_SIZE                EQU 0EB65h
ROOT_CLUSTER            EQU 0EB69h
WORK_CLUSTER            EQU 0EB6Dh
WORK_LBA                EQU 0EB75h
SECTORS_PER_CLUSTER     EQU 0EB7Dh
NUMBER_OF_FATS          EQU 0EB7Eh
DIRECTORY_PAGE_COUNT    EQU 0EB82h
INPUT_FAT_NAME          EQU 0EB94h
HEADER_COPY             EQU 0EBA9h
DIRECTORY_ENTRY_COPY    EQU 0EBB2h

CMD_SAVE:
        LD      HL,(00016h)
        INC     HL
        INC     HL
        INC     HL
        CALL    PARSE_HEX_WORD
        JP      C,BAD_PARAMETERS
        LD      (SAVE_BEGIN),DE
        CALL    PARSE_HEX_WORD
        JP      C,BAD_PARAMETERS
        LD      (SAVE_END),DE
        LD      HL,0
        LD      (SAVE_START),HL
        XOR     A
        LD      (START_PRESENT),A
        CALL    PARSE_HEX_WORD
        JR      C,.NO_START
        LD      (SAVE_START),DE
        LD      A,1
        LD      (START_PRESENT),A
        JR      .RANGE
.NO_START:
        LD      A,(HL)
        CP      0Dh
        JR      Z,.RANGE
        OR      A
        JP      NZ,BAD_PARAMETERS

.RANGE:
        ; The saved RAM range is always checked. The start address is checked
        ; later and only for executable .COM files.
        LD      HL,(SAVE_BEGIN)
        LD      DE,0100h
        OR      A
        SBC     HL,DE
        JP      C,BAD_PARAMETERS
        LD      HL,(SAVE_END)
        LD      DE,0B000h
        OR      A
        SBC     HL,DE
        JP      NC,BAD_PARAMETERS
        LD      HL,(SAVE_END)
        LD      DE,(SAVE_BEGIN)
        OR      A
        SBC     HL,DE
        JP      C,BAD_PARAMETERS
        INC     HL
        LD      (PAYLOAD_REMAIN),HL
        LD      (PAYLOAD_SIZE),HL

        CALL    PRINT_CR
        LD      HL,TEXT_FILE_PROMPT
        CALL    PRINT_Z
        CALL    READ_FAT_FILENAME
        JP      C,BAD_FILENAME
        CALL    IS_COM_FILE
        JR      NZ,.TYPE_READY
        LD      A,(START_PRESENT)
        OR      A
        JP      Z,BAD_PARAMETERS
        LD      HL,(SAVE_START)
        LD      DE,(SAVE_BEGIN)
        OR      A
        SBC     HL,DE
        JP      C,BAD_PARAMETERS
        LD      HL,(SAVE_END)
        LD      DE,(SAVE_START)
        OR      A
        SBC     HL,DE
        JP      C,BAD_PARAMETERS
.TYPE_READY:
        CALL    FAT32_INIT
        JP      C,SD_ERROR
        CALL    FIND_FREE_DIRECTORY
        JP      C,DIRECTORY_ERROR
        CALL    CALCULATE_SIZE
        CALL    FIND_FREE_RUN
        JP      C,DISK_FULL
        CALL    WRITE_FILE_DATA
        JP      C,SD_ERROR
        CALL    WRITE_FAT_CHAIN
        JP      C,SD_ERROR
        CALL    WRITE_DIRECTORY_ENTRY
        JP      C,SD_ERROR
        LD      HL,TEXT_SAVED
        JP      PRINT_MESSAGE

; Parse one hexadecimal word at HL, skipping blanks. DE=result.
PARSE_HEX_WORD:
.SKIP: LD      A,(HL)
        CP      ' '
        JR      NZ,.START
        INC     HL
        JR      .SKIP
.START:XOR     A
        LD      D,A
        LD      E,A
        LD      B,A
.LOOP: LD      A,(HL)
        CP      '0'
        JR      C,.DONE
        CP      '9'+1
        JR      C,.DIGIT
        AND     05Fh
        CP      'A'
        JR      C,.BAD
        CP      'F'+1
        JR      NC,.BAD
        SUB     'A'-10
        JR      .NIBBLE
.DIGIT:
        SUB     '0'
.NIBBLE:
        LD      C,A
        SLA     E
        RL      D
        SLA     E
        RL      D
        SLA     E
        RL      D
        SLA     E
        RL      D
        LD      A,E
        ADD     A,C
        LD      E,A
        JR      NC,.NO_CARRY
        INC     D
.NO_CARRY:
        INC     B
        INC     HL
        JR      .LOOP
.DONE: LD      A,B
        OR      A
        SCF
        RET     Z
        OR      A
        RET
.BAD:  SCF
        RET

; Locate either a deleted/end entry in the first root cluster and reject an
; already existing 8.3 name. The first reusable slot is retained.
FIND_FREE_DIRECTORY:
        LD      HL,ROOT_CLUSTER
        LD      DE,WORK_CLUSTER
        LD      BC,4
        LDIR
        CALL    CLUSTER_TO_LBA
        LD      HL,WORK_LBA
        LD      DE,DIR_BASE_LBA
        LD      BC,4
        LDIR
        LD      A,0FFh
        LD      (FREE_DIR_INDEX),A
        XOR     A
        LD      (DIR_SECTOR),A
.SECTOR:
        CALL    SET_DIRECTORY_LBA
        CALL    READ_WORK_LBA
        JR      NC,.READ_OK
        LD      A,2
        SCF
        RET
.READ_OK:
        XOR     A
        LD      (DIR_INDEX),A
.ENTRY:
        CALL    DIR_POINTER
        LD      A,(HL)
        OR      A
        JR      Z,.END_MARKER
        CP      0E5h
        JR      Z,.REMEMBER
        PUSH    HL
        LD      DE,INPUT_FAT_NAME
        LD      B,11
        CALL    COMPARE_BYTES
        POP     HL
        JR      NZ,.NEXT
        LD      A,(HL)
        LD      A,1
        SCF
        RET                             ; A<>0: file exists
.REMEMBER:
        LD      A,(FREE_DIR_INDEX)
        CP      0FFh
        JR      NZ,.NEXT
        CALL    SAVE_FREE_SLOT
.NEXT: LD      A,(DIR_INDEX)
        INC     A
        LD      (DIR_INDEX),A
        CP      16
        JR      C,.ENTRY
        LD      A,(DIR_SECTOR)
        INC     A
        LD      (DIR_SECTOR),A
        LD      B,A
        LD      A,(SECTORS_PER_CLUSTER)
        CP      B
        JR      NZ,.SECTOR
        LD      A,(FREE_DIR_INDEX)
        CP      0FFh
        JR      NZ,.HAVE_FREE
        XOR     A
        SCF
        RET
.HAVE_FREE:
        OR      A
        RET
.END_MARKER:
        CALL    SAVE_FREE_SLOT
        OR      A
        RET

SAVE_FREE_SLOT:
        LD      A,(DIR_INDEX)
        LD      (FREE_DIR_INDEX),A
        LD      HL,WORK_LBA
        LD      DE,FREE_DIR_LBA
        LD      BC,4
        LDIR
        RET

SET_DIRECTORY_LBA:
        LD      HL,DIR_BASE_LBA
        LD      DE,WORK_LBA
        LD      BC,4
        LDIR
        LD      A,(DIR_SECTOR)
        LD      E,A
        LD      D,0
        LD      HL,WORK_LBA
        JP      ADD_WORD_TO_QUAD

DIR_POINTER:
        LD      HL,0E100h
        LD      A,(DIR_INDEX)
        OR      A
        RET     Z
        LD      B,A
        LD      DE,32
.ADD:  ADD     HL,DE
        DJNZ    .ADD
        RET

CALCULATE_SIZE:
        LD      HL,(PAYLOAD_SIZE)
        LD      DE,9
        ADD     HL,DE
        LD      (FILE_SIZE),HL
        LD      DE,511
        ADD     HL,DE
        LD      B,9
.SHIFT:SRL     H
        RR      L
        DJNZ    .SHIFT
        LD      A,L
        LD      (FILE_SECTORS),A
        LD      C,0
.CLUSTERS:
        INC     C
        LD      B,A
        LD      A,(SECTORS_PER_CLUSTER)
        LD      D,A
        LD      A,B
        SUB     D
        JR      C,.CLUSTER_DONE
        JR      Z,.CLUSTER_DONE
        JR      .CLUSTERS
.CLUSTER_DONE:
        LD      A,C
        LD      (CLUSTERS_NEEDED),A
        RET

; Search FAT entries from cluster 3 for enough consecutive free clusters.
FIND_FREE_RUN:
        LD      HL,FAT_LBA
        LD      DE,WORK_LBA
        LD      BC,4
        LDIR
        LD      HL,0
        LD      (CURRENT_CLUSTER),HL
        LD      (FAT_SECTOR_INDEX),HL
        XOR     A
        LD      (FREE_RUN_COUNT),A
.SECTOR:
        CALL    READ_WORK_LBA
        RET     C
        LD      HL,0E100h
        LD      B,128
.ENTRY:
        LD      A,(HL)
        INC     HL
        OR      (HL)
        INC     HL
        OR      (HL)
        INC     HL
        OR      (HL)
        INC     HL
        JR      NZ,.USED
        LD      A,(CURRENT_CLUSTER+1)
        OR      A
        JR      NZ,.FREE
        LD      A,(CURRENT_CLUSTER)
        CP      3
        JR      C,.USED
.FREE: LD      A,(FREE_RUN_COUNT)
        INC     A
        LD      (FREE_RUN_COUNT),A
        LD      C,A
        LD      A,(CLUSTERS_NEEDED)
        CP      C
        JR      Z,.FOUND
        JR      .ADVANCE
.USED: XOR     A
        LD      (FREE_RUN_COUNT),A
.ADVANCE:
        PUSH    HL
        LD      HL,(CURRENT_CLUSTER)
        INC     HL
        LD      (CURRENT_CLUSTER),HL
        POP     HL
        DJNZ    .ENTRY
        LD      HL,WORK_LBA
        CALL    INCREMENT_QUAD
        LD      HL,(FAT_SECTOR_INDEX)
        INC     HL
        LD      (FAT_SECTOR_INDEX),HL
        LD      DE,(FAT_SIZE)
        OR      A
        SBC     HL,DE
        JR      C,.SECTOR
        SCF
        RET
.FOUND:
        LD      HL,(CURRENT_CLUSTER)
        LD      A,(CLUSTERS_NEEDED)
        DEC     A
        LD      E,A
        LD      D,0
        OR      A
        SBC     HL,DE
        LD      (FIRST_CLUSTER),HL
        OR      A
        RET

WRITE_FILE_DATA:
        LD      HL,(SAVE_BEGIN)
        LD      (SOURCE_POINTER),HL
        LD      HL,(FIRST_CLUSTER)
        LD      (WORK_CLUSTER),HL
        XOR     A
        LD      (WORK_CLUSTER+2),A
        LD      (WORK_CLUSTER+3),A
        CALL    CLUSTER_TO_LBA
        LD      A,1
        LD      (FIRST_SECTOR),A
        LD      A,(FILE_SECTORS)
        LD      (SECTORS_REMAIN),A
.SECTOR:
        CALL    CLEAR_BUFFER
        LD      A,(FIRST_SECTOR)
        OR      A
        JR      Z,.NORMAL
        XOR     A
        LD      (FIRST_SECTOR),A
        LD      HL,0E100h
        LD      (HL),'@'
        INC     HL
        LD      (HL),'D'
        INC     HL
        LD      (HL),'D'
        INC     HL
        LD      DE,SAVE_BEGIN
        LD      BC,6
        EX      DE,HL
        LDIR
        LD      HL,0E109h
        LD      BC,503
        JR      .COPY
.NORMAL:
        LD      HL,0E100h
        LD      BC,512
.COPY: CALL    COPY_FROM_RAM
        CALL    WRITE_WORK_LBA
        RET     C
        LD      HL,WORK_LBA
        CALL    INCREMENT_QUAD
        LD      A,(SECTORS_REMAIN)
        DEC     A
        LD      (SECTORS_REMAIN),A
        JR      NZ,.SECTOR
        OR      A
        RET

CLEAR_BUFFER:
        LD      HL,0E100h
        LD      (HL),0
        LD      DE,0E101h
        LD      BC,511
        LDIR
        RET

COPY_FROM_RAM:
        EX      DE,HL                   ; DE=buffer destination
        LD      HL,(SOURCE_POINTER)
.LOOP: LD      A,(PAYLOAD_REMAIN)
        LD      IXL,A
        LD      A,(PAYLOAD_REMAIN+1)
        OR      IXL
        JR      Z,.DONE
        LD      A,B
        OR      C
        JR      Z,.DONE
        LDI
        PUSH    HL
        LD      HL,(PAYLOAD_REMAIN)
        DEC     HL
        LD      (PAYLOAD_REMAIN),HL
        POP     HL
        JR      .LOOP
.DONE: LD      (SOURCE_POINTER),HL
        RET

WRITE_FAT_CHAIN:
        LD      HL,(FIRST_CLUSTER)
        LD      (CURRENT_CLUSTER),HL
        LD      A,(CLUSTERS_NEEDED)
        LD      (ALLOC_REMAIN),A
.LOOP: CALL    LOCATE_FAT_ENTRY
        CALL    READ_WORK_LBA
        RET     C
        LD      DE,(FAT_ENTRY_OFFSET)
        LD      HL,0E100h
        ADD     HL,DE
        LD      A,(ALLOC_REMAIN)
        CP      1
        JR      Z,.LAST
        LD      DE,(CURRENT_CLUSTER)
        INC     DE
        LD      (HL),E
        INC     HL
        LD      (HL),D
        INC     HL
        XOR     A
        LD      (HL),A
        INC     HL
        LD      (HL),A
        JR      .COMMIT
.LAST: LD      (HL),0FFh
        INC     HL
        LD      (HL),0FFh
        INC     HL
        LD      (HL),0FFh
        INC     HL
        LD      (HL),00Fh
.COMMIT:
        LD      A,(NUMBER_OF_FATS)
        LD      B,A
.FAT_COPY:
        PUSH    BC
        CALL    WRITE_WORK_LBA
        POP     BC
        RET     C
        DJNZ    .NEXT_FAT
        JR      .ENTRY_DONE
.NEXT_FAT:
        LD      HL,FAT_SIZE
        LD      DE,WORK_LBA
        CALL    ADD_QUAD_TO_QUAD
        JR      .FAT_COPY
.ENTRY_DONE:
        LD      HL,(CURRENT_CLUSTER)
        INC     HL
        LD      (CURRENT_CLUSTER),HL
        LD      A,(ALLOC_REMAIN)
        DEC     A
        LD      (ALLOC_REMAIN),A
        JR      NZ,.LOOP
        OR      A
        RET

; WORK_LBA=FAT_LBA+cluster/128, FAT_ENTRY_OFFSET=(cluster&127)*4.
LOCATE_FAT_ENTRY:
        LD      HL,FAT_LBA
        LD      DE,WORK_LBA
        LD      BC,4
        LDIR
        LD      HL,(CURRENT_CLUSTER)
        LD      A,L
        AND     07Fh
        LD      E,A
        LD      D,0
        SLA     E
        RL      D
        SLA     E
        RL      D
        LD      (FAT_ENTRY_OFFSET),DE
        SRL     H
        RR      L
        SRL     H
        RR      L
        SRL     H
        RR      L
        SRL     H
        RR      L
        SRL     H
        RR      L
        SRL     H
        RR      L
        SRL     H
        RR      L
        EX      DE,HL
        LD      HL,WORK_LBA
        JP      ADD_WORD_TO_QUAD

WRITE_DIRECTORY_ENTRY:
        LD      HL,FREE_DIR_LBA
        LD      DE,WORK_LBA
        LD      BC,4
        LDIR
        CALL    READ_WORK_LBA
        RET     C
        LD      A,(FREE_DIR_INDEX)
        LD      (DIR_INDEX),A
        CALL    DIR_POINTER
        PUSH    HL
        LD      (HL),0
        LD      D,H
        LD      E,L
        INC     DE
        LD      BC,31
        LDIR
        POP     DE
        PUSH    DE
        LD      HL,INPUT_FAT_NAME
        LD      BC,11
        LDIR
        POP     HL
        LD      DE,11
        ADD     HL,DE
        LD      (HL),020h               ; archive attribute
        LD      DE,9
        ADD     HL,DE                   ; offset 20
        XOR     A
        LD      (HL),A                  ; cluster high word
        INC     HL
        LD      (HL),A
        LD      DE,5
        ADD     HL,DE                   ; offset 26
        LD      DE,(FIRST_CLUSTER)
        LD      (HL),E
        INC     HL
        LD      (HL),D
        INC     HL
        LD      DE,(FILE_SIZE)
        LD      (HL),E                  ; size low word is at offset 28
        INC     HL
        LD      (HL),D
        CALL    WRITE_WORK_LBA
        RET

WRITE_WORK_LBA:
.READY:IN      A,(15h)
        BIT     1,A
        SCF
        RET     NZ
        BIT     2,A
        JR      Z,.READY
        LD      A,(WORK_LBA)
        OUT     (10h),A
        LD      A,(WORK_LBA+1)
        OUT     (11h),A
        LD      A,(WORK_LBA+2)
        OUT     (12h),A
        LD      A,(WORK_LBA+3)
        OUT     (13h),A
        LD      A,2
        OUT     (14h),A
.WAIT: IN      A,(15h)
        BIT     1,A
        SCF
        RET     NZ
        BIT     0,A
        JR      NZ,.WAIT
        BIT     4,A
        JR      Z,.WAIT
        OR      A
        RET

BAD_PARAMETERS:
        CALL    PRINT_CR
        LD      HL,TEXT_BAD_PARAMETERS
        JP      PRINT_MESSAGE
BAD_FILENAME:
        LD      HL,TEXT_BAD_FILENAME
        JP      PRINT_MESSAGE
DIRECTORY_ERROR:
        OR      A
        JR      Z,DISK_FULL
        LD      HL,TEXT_EXISTS
        JP      PRINT_MESSAGE
DISK_FULL:
        LD      HL,TEXT_DISK_FULL
        JP      PRINT_MESSAGE
SD_ERROR:
        LD      HL,TEXT_SD_ERROR
        JP      PRINT_MESSAGE

TEXT_FILE_PROMPT:      DB "DATEI NAME >",0
TEXT_BAD_PARAMETERS:   DB "FEHLER IN ADRESSEN",0
TEXT_BAD_FILENAME:     DB "UNGUELTIGER NAME",0
TEXT_EXISTS:           DB "DATEI SCHON VORHANDEN",0
TEXT_DISK_FULL:        DB "DISKETTE/VZ VOLL",0
TEXT_SD_ERROR:         DB "SD SCHREIBFEHLER",0
TEXT_SAVED:            DB "GESPEICHERT",0

SAVE_BEGIN:            DW 0
SAVE_END:              DW 0
SAVE_START:            DW 0
PAYLOAD_SIZE:          DW 0
PAYLOAD_REMAIN:        DW 0
SOURCE_POINTER:        DW 0
FILE_SIZE:             DW 0
FIRST_CLUSTER:         DW 0
CURRENT_CLUSTER:       DW 0
FAT_SECTOR_INDEX:      DW 0
FAT_ENTRY_OFFSET:      DW 0
DIR_BASE_LBA:          DD 0
FREE_DIR_LBA:          DD 0
DIR_SECTOR:            DB 0
DIR_INDEX:             DB 0
FREE_DIR_INDEX:        DB 0
FILE_SECTORS:          DB 0
SECTORS_REMAIN:        DB 0
CLUSTERS_NEEDED:       DB 0
FREE_RUN_COUNT:        DB 0
FIRST_SECTOR:          DB 0
ALLOC_REMAIN:          DB 0
START_PRESENT:         DB 0

        ASSERT  $ <= 0D810h

; Shared file-type helpers at fixed addresses, called by IO.SYS.
        ORG     0D810h
IS_COM_FILE:
        LD      A,(INPUT_FAT_NAME+8)
        CP      'C'
        RET     NZ
        LD      A,(INPUT_FAT_NAME+9)
        CP      'O'
        RET     NZ
        LD      A,(INPUT_FAT_NAME+10)
        CP      'M'
        RET

        ASSERT  $ <= 0D830h
        ORG     0D830h
VALIDATE_LOADED_START:
        CALL    IS_COM_FILE
        JR      Z,.CHECK
        OR      A                       ; non-COM: start field is metadata only
        RET
.CHECK:LD      HL,(0EBA3h)              ; LOAD_START
        LD      DE,(0EB9Fh)             ; LOAD_DEST
        OR      A
        SBC     HL,DE
        JR      C,.BAD
        LD      HL,(0EBA1h)             ; LOAD_END
        LD      DE,(0EBA3h)
        OR      A
        SBC     HL,DE
        RET     NC
.BAD:  SCF
        RET

        ASSERT  $ <= 0D850h
        ORG     0D850h
FINISH_LOADED_FILE:
        CALL    IS_COM_FILE
        JR      NZ,.LOADED_ONLY
        LD      HL,(0EBA3h)
        JP      (HL)
.LOADED_ONLY:
        LD      HL,TEXT_LOADED
        JP      PRINT_MESSAGE

TEXT_LOADED:           DB "GELADEN",0

        ASSERT  $ <= 0D870h
        ORG     0D870h

; Fixed-width 32-column @DD line. Every complete line already advances the
; 32-column monitor cursor, so an additional CR would create a blank line.
; Before entry 21, 41, ... the user may continue with Enter or abort with Esc.
PRINT_DIRECTORY_ENTRY_32:
        LD      A,(DIRECTORY_PAGE_COUNT)
        CP      20
        JR      NZ,.PRINT_ENTRY
        LD      HL,TEXT_DIRECTORY_MORE
        CALL    PRINT_Z
.WAIT_KEY:
        RST     20h
        DB      01h
        CP      01Bh
        JR      Z,.ABORT
        CP      0Dh
        JR      NZ,.WAIT_KEY
        CALL    PRINT_CR               ; leave the non-32-character prompt
        XOR     A
        LD      (DIRECTORY_PAGE_COUNT),A

.PRINT_ENTRY:
        LD      HL,DIRECTORY_ENTRY_COPY
        LD      B,8
.BASE:
        LD      A,(HL)
        INC     HL
        CALL    OUTCH
        DJNZ    .BASE
        LD      A,(DIRECTORY_ENTRY_COPY+8)
        CP      ' '
        JR      Z,.NO_EXTENSION
        LD      A,'.'
        CALL    OUTCH
        LD      HL,DIRECTORY_ENTRY_COPY+8
        LD      B,3
.EXTENSION:
        LD      A,(HL)
        INC     HL
        CALL    OUTCH
        DJNZ    .EXTENSION
        LD      B,2
        JR      .PAD_NAME
.NO_EXTENSION:
        LD      B,6
.PAD_NAME:
        LD      A,' '
        CALL    OUTCH
        DJNZ    .PAD_NAME

        LD      HL,HEADER_COPY+3
        CALL    .PRINT_COLUMN
        LD      HL,HEADER_COPY+5
        CALL    .PRINT_COLUMN
        LD      HL,HEADER_COPY+7
        CALL    .PRINT_COLUMN
        LD      A,(DIRECTORY_PAGE_COUNT)
        INC     A
        LD      (DIRECTORY_PAGE_COUNT),A
        OR      A
        RET

.PRINT_COLUMN:
        LD      A,' '
        CALL    OUTCH
        LD      A,' '
        CALL    OUTCH
        JP      PRINT_WORD_LE

.ABORT:
        SCF
        RET

DS_END:
        ASSERT  DS_END <= 0D900h
        SAVEBIN "DS_FAT32.BIN",0D300h,DS_END-0D300h
