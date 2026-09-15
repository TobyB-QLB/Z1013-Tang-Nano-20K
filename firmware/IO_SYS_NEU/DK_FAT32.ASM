; Z1013 @DK FAT32 delete extension. ROM 1000h -> RAM D900h at boot.
; The directory entry is hidden first, then every cluster in the FAT chain
; is released in all FAT copies. This makes an interrupted delete harmless.

        DEVICE ZXSPECTRUM48
        ORG     0D900h

READ_FAT_FILENAME       EQU 0E3C6h
FAT32_INIT              EQU 0E535h
DIRECTORY_ENTRY_POINTER EQU 0E6E0h
FIND_NAMED_FILE         EQU 0E6F0h
FAT_NEXT_CLUSTER        EQU 0E882h
READ_WORK_LBA           EQU 0E94Dh
ADD_QUAD_TO_QUAD        EQU 0E991h
PRINT_CR                EQU 0E9DAh
PRINT_Z                 EQU 0E9DFh
PRINT_MESSAGE           EQU 0E9E8h
TEXT_FILE_PROMPT        EQU 0EA92h
WORK_CLUSTER            EQU 0EB6Dh
WORK_LBA                EQU 0EB75h
FAT_SIZE                EQU 0EB65h
NUMBER_OF_FATS          EQU 0EB7Eh
DIRECTORY_ENTRY_COPY    EQU 0EBB2h
WRITE_WORK_LBA          EQU 0D717h

CMD_DELETE:
        CALL    PRINT_CR
        LD      HL,TEXT_FILE_PROMPT
        CALL    PRINT_Z
        CALL    READ_FAT_FILENAME
        JR      C,.NOT_FOUND
        CALL    FAT32_INIT
        JR      C,.SD_ERROR
        CALL    FIND_NAMED_FILE
        JR      NC,.FOUND
        CP      1
        JR      Z,.NOT_FOUND
        JR      .SD_ERROR
.FOUND:
        CALL    PRINT_CR
        LD      HL,TEXT_SURE
        CALL    PRINT_Z
.KEY:
        RST     20h
        DB      01h
        CP      01Bh
        JR      Z,.CANCEL
        AND     05Fh
        CP      'N'
        JR      Z,.CANCEL
        CP      'J'
        JR      NZ,.KEY
        CALL    DELETE_FILE
        JR      C,.SD_ERROR
        LD      HL,TEXT_DELETED
        JP      PRINT_MESSAGE
.CANCEL:
        LD      HL,TEXT_CANCELLED
        JP      PRINT_MESSAGE
.NOT_FOUND:
        LD      HL,TEXT_NOT_FOUND
        JP      PRINT_MESSAGE
.SD_ERROR:
        LD      HL,TEXT_ERROR
        JP      PRINT_MESSAGE

DELETE_FILE:
        ; FIND_NAMED_FILE left the owning directory sector in E100h.
        CALL    DIRECTORY_ENTRY_POINTER
        LD      (HL),0E5h
        CALL    WRITE_WORK_LBA
        RET     C

        LD      HL,DIRECTORY_ENTRY_COPY+26
        LD      DE,WORK_CLUSTER
        LDI
        LDI
        LD      HL,DIRECTORY_ENTRY_COPY+20
        LDI
        LDI
        LD      A,(WORK_CLUSTER+3)
        AND     0Fh
        LD      (WORK_CLUSTER+3),A
.CLUSTER:
        LD      HL,WORK_CLUSTER
        LD      DE,CURRENT_CLUSTER
        LD      BC,4
        LDIR
        CALL    FAT_NEXT_CLUSTER
        JR      NC,.HAVE_NEXT
        CP      5                       ; normal FAT32 end-of-chain
        RET     NZ
        LD      A,1
        JR      .STATUS
.HAVE_NEXT:
        XOR     A
.STATUS:
        LD      (LAST_CLUSTER),A

        LD      A,(CURRENT_CLUSTER)
        AND     07Fh
        LD      L,A
        LD      H,0
        ADD     HL,HL
        ADD     HL,HL
        LD      DE,0E100h
        ADD     HL,DE
        XOR     A
        LD      (HL),A
        INC     HL
        LD      (HL),A
        INC     HL
        LD      (HL),A
        INC     HL
        LD      (HL),A

        LD      A,(NUMBER_OF_FATS)
        LD      B,A
.WRITE_FAT:
        PUSH    BC
        CALL    WRITE_WORK_LBA
        POP     BC
        RET     C
        DJNZ    .NEXT_FAT
        LD      A,(LAST_CLUSTER)
        OR      A
        JR      Z,.CLUSTER
        RET
.NEXT_FAT:
        LD      HL,FAT_SIZE
        LD      DE,WORK_LBA
        CALL    ADD_QUAD_TO_QUAD
        JR      .WRITE_FAT

TEXT_SURE:       DB "BIST DU SICHER J/N ?",0
TEXT_DELETED:    DB "GELOESCHT",0
TEXT_CANCELLED:  DB "NICHT GELOESCHT",0
TEXT_NOT_FOUND:  DB "DATEI NICHT VORHANDEN",0
TEXT_ERROR:      DB "SD SCHREIBFEHLER",0
CURRENT_CLUSTER: DS 4,0
LAST_CLUSTER:    DB 0

DK_END:
        ASSERT  DK_END <= 0DA20h
        SAVEBIN "DK_FAT32.BIN",0D900h,DK_END-0D900h
