; Z1013 IO.SYS - FAT32 directly on the Z80, stage 6
; Origin: E300h, maximum size: 0900h bytes
;
; FPGA interface:
;   OUT 10h..13h = 32-bit LBA, little endian
;   OUT 14h,1     = read one 512-byte sector
;   IN  15h       = bit0 busy, bit1 error, bit2 ready, bit4 valid
;   E100h..E2FFh  = sector buffer

; This software stage implements @DD and @DL. It deliberately does not use
; the old FDC.BIN or the former hardware FAT directory adapter.

        DEVICE ZXSPECTRUM48
        ORG     0E300h

IO_INIT:
        LD      HL,COMMAND_HANDLER
        LD      (000B7h),HL
        LD      A,'D'
        LD      (000B6h),A
        RET

COMMAND_HANDLER:
        LD      HL,(00016h)
        INC     HL
        INC     HL
        LD      A,(HL)
        CP      'D'
        JP      Z,CMD_DIRECTORY
        CP      'L'
        JP      Z,CMD_LOAD
        CP      'S'
        JP      Z,0D300h
        CP      'K'
        JP      Z,0D900h
        CP      'F'
        JP      Z,MSG_NOT_AVAILABLE
        JP      MSG_UNKNOWN

CMD_DIRECTORY:
        CALL    PRINT_CR
        CALL    FAT32_INIT
        JP      C,MSG_SD_READ_ERROR
        CALL    PRINT_DIRECTORY_HEADER
        CALL    DIRECTORY_SCAN
        JP      C,MSG_SD_READ_ERROR
        LD      A,(FOUND_COUNT)
        OR      A
        JR      Z,.NO_FILES
        JP      PRINT_CR
.NO_FILES:
        LD      HL,TEXT_NO_Z1013
        JP      PRINT_MESSAGE

MSG_NOT_AVAILABLE:
        CALL    PRINT_CR
        LD      HL,TEXT_NOT_AVAILABLE
        JP      PRINT_MESSAGE

MSG_UNKNOWN:
        CALL    PRINT_CR
        LD      HL,TEXT_UNKNOWN
        JP      PRINT_MESSAGE

MSG_SD_READ_ERROR:
        CALL    PRINT_CR
        LD      HL,TEXT_SD_READ_ERROR
        JP      PRINT_MESSAGE

MSG_NO_FAT32:
        CALL    PRINT_CR
        LD      HL,TEXT_NO_FAT32
        JP      PRINT_MESSAGE

MSG_FILE_NOT_FOUND:
        LD      HL,TEXT_FILE_NOT_FOUND
        JP      PRINT_MESSAGE

MSG_NOT_Z1013:
        LD      HL,TEXT_NOT_Z1013
        JP      PRINT_MESSAGE

MSG_BAD_ADDRESS:
        LD      HL,TEXT_BAD_ADDRESS
        JP      PRINT_MESSAGE

MSG_FILE_TOO_SHORT:
        LD      HL,TEXT_FILE_TOO_SHORT
        JP      PRINT_MESSAGE

; ---------------------------------------------------------------------------
; @DL filename input and load command
; ---------------------------------------------------------------------------
CMD_LOAD:
        CALL    PRINT_CR
        LD      HL,TEXT_FILE_PROMPT
        CALL    PRINT_Z
        CALL    READ_FAT_FILENAME
        JR      C,MSG_FILE_NOT_FOUND
        CALL    FAT32_INIT
        JP      C,MSG_SD_READ_ERROR
        CALL    FIND_NAMED_FILE
        JR      NC,.FOUND
        CP      1
        JR      Z,MSG_FILE_NOT_FOUND
        JP      MSG_SD_READ_ERROR
.FOUND:
        CALL    LOAD_FOUND_FILE
        JR      NC,.START
        CP      2
        JP      Z,MSG_SD_READ_ERROR
        CP      3
        JP      Z,MSG_NOT_Z1013
        CP      4
        JP      Z,MSG_BAD_ADDRESS
        JP      MSG_FILE_TOO_SHORT
.START:
        JP      0D850h                  ; only .COM starts automatically
        NOP

READ_FAT_FILENAME:
        LD      HL,INPUT_TEXT_NAME
        LD      B,12
        LD      A,' '
.CLEAR_TEXT:
        LD      (HL),A
        INC     HL
        DJNZ    .CLEAR_TEXT
        XOR     A
        LD      (NAME_CURSOR),A
        LD      (NAME_LENGTH),A
.INPUT:
        RST     20h
        DB      01h                     ; INCH
        CP      0Dh
        JP      Z,.CONVERT
        CP      08h                     ; cursor left / PS2 backspace
        JR      Z,.CURSOR_LEFT
        CP      09h                     ; cursor right
        JR      Z,.CURSOR_RIGHT
        CP      0Fh                     ; delete
        JP      Z,.DELETE_AT_CURSOR
        CP      'a'
        JR      C,.UPPER_READY
        CP      'z'+1
        JR      NC,.UPPER_READY
        AND     05Fh
.UPPER_READY:
        CP      ' '
        JR      C,.INPUT
        CP      07Fh
        JR      NC,.INPUT
        PUSH    AF
        LD      A,(NAME_CURSOR)
        CP      12
        JR      NC,.REJECT_PRINTABLE
        LD      E,A
        LD      D,0
        LD      HL,INPUT_TEXT_NAME
        ADD     HL,DE
        POP     AF
        LD      (HL),A
        CALL    OUTCH
        LD      A,(NAME_CURSOR)
        LD      B,A
        INC     A
        LD      (NAME_CURSOR),A
        LD      A,(NAME_LENGTH)
        CP      B
        JR      NZ,.INPUT
        INC     A
        LD      (NAME_LENGTH),A
        JR      .INPUT
.REJECT_PRINTABLE:
        POP     AF
        JR      .INPUT

.CURSOR_LEFT:
        LD      A,(NAME_CURSOR)
        OR      A
        JR      Z,.INPUT
        DEC     A
        LD      (NAME_CURSOR),A
        LD      A,08h
        CALL    OUTCH
        JR      .INPUT

.CURSOR_RIGHT:
        LD      A,(NAME_CURSOR)
        LD      B,A
        LD      A,(NAME_LENGTH)
        CP      B
        JR      Z,.INPUT
        LD      A,B
        INC     A
        LD      (NAME_CURSOR),A
        LD      A,09h
        CALL    OUTCH
        JR      .INPUT

.DELETE_AT_CURSOR:
        LD      A,(NAME_CURSOR)
        LD      E,A
        LD      B,A
        LD      A,(NAME_LENGTH)
        CP      B
        JP      Z,.INPUT
        SUB     B
        DEC     A                       ; bytes behind deleted character
        LD      C,A
        LD      D,0
        LD      HL,INPUT_TEXT_NAME
        ADD     HL,DE
        PUSH    HL
        INC     HL
        POP     DE
        LD      B,0
        LD      A,C
        OR      A
        JR      Z,.DELETE_SHIFTED
        LDIR
.DELETE_SHIFTED:
        LD      A,(NAME_LENGTH)
        DEC     A
        LD      (NAME_LENGTH),A
        LD      E,A
        LD      D,0
        LD      HL,INPUT_TEXT_NAME
        ADD     HL,DE
        LD      (HL),' '

        ; Redraw the changed tail and return the visible cursor to its place.
        LD      A,(NAME_CURSOR)
        LD      E,A
        LD      D,0
        LD      HL,INPUT_TEXT_NAME
        ADD     HL,DE
        LD      A,(NAME_LENGTH)
        SUB     E
        LD      B,A
.REDRAW_TAIL:
        LD      A,B
        OR      A
        JR      Z,.REDRAW_SPACE
        LD      A,(HL)
        CALL    OUTCH
        INC     HL
        DJNZ    .REDRAW_TAIL
.REDRAW_SPACE:
        LD      A,' '
        CALL    OUTCH
        LD      A,(NAME_LENGTH)
        SUB     E
        INC     A
        LD      B,A
.RESTORE_CURSOR:
        LD      A,08h
        CALL    OUTCH
        DJNZ    .RESTORE_CURSOR
        JP      .INPUT

.CONVERT:
        CALL    PRINT_CR
        LD      HL,INPUT_FAT_NAME
        LD      B,11
        LD      A,' '
.CLEAR_FAT:
        LD      (HL),A
        INC     HL
        DJNZ    .CLEAR_FAT
        XOR     A
        LD      (NAME_POSITION),A
        LD      (NAME_IN_EXTENSION),A
        LD      (NAME_CHARACTER_COUNT),A
        LD      A,(NAME_LENGTH)
        LD      B,A
        LD      HL,INPUT_TEXT_NAME
.CONVERT_LOOP:
        LD      A,B
        OR      A
        JR      Z,.FINISHED
        LD      A,(HL)
        INC     HL
        CP      '.'
        JR      NZ,.NORMAL_CHAR
        LD      A,(NAME_IN_EXTENSION)
        OR      A
        JR      NZ,.BAD_NAME
        LD      A,(NAME_CHARACTER_COUNT)
        OR      A
        JR      Z,.BAD_NAME
        LD      A,1
        LD      (NAME_IN_EXTENSION),A
        LD      A,8
        LD      (NAME_POSITION),A
        DJNZ    .CONVERT_LOOP
        JR      .FINISHED
.NORMAL_CHAR:
        CP      ' '
        JR      Z,.BAD_NAME
        PUSH    AF
        LD      A,(NAME_POSITION)
        LD      C,A
        LD      A,(NAME_IN_EXTENSION)
        OR      A
        JR      NZ,.CHECK_EXTENSION
        LD      A,C
        CP      8
        JR      NC,.BAD_NAME_POP
        JR      .STORE_CHAR
.CHECK_EXTENSION:
        LD      A,C
        CP      11
        JR      NC,.BAD_NAME_POP
.STORE_CHAR:
        POP     AF
        PUSH    HL
        LD      HL,INPUT_FAT_NAME
        LD      E,C
        LD      D,0
        ADD     HL,DE
        LD      (HL),A
        POP     HL
        LD      A,(NAME_POSITION)
        INC     A
        LD      (NAME_POSITION),A
        LD      A,(NAME_CHARACTER_COUNT)
        INC     A
        LD      (NAME_CHARACTER_COUNT),A
        DJNZ    .CONVERT_LOOP
        JR      .FINISHED
.BAD_NAME_POP:
        POP     AF
.BAD_NAME:
        SCF
        RET
.FINISHED:
        LD      A,(NAME_CHARACTER_COUNT)
        OR      A
        SCF
        RET     Z
        OR      A
        RET

; ---------------------------------------------------------------------------
; FAT32 initialization
; ---------------------------------------------------------------------------
FAT32_INIT:
        XOR     A
        LD      (FOUND_COUNT),A
        LD      HL,ZERO_QUAD
        LD      DE,WORK_LBA
        LD      BC,4
        LDIR
        CALL    READ_WORK_LBA
        RET     C

        ; Accept a FAT32 superfloppy, otherwise use MBR partition entry 0.
        LD      HL,0E152h              ; sector offset 82: "FAT32"
        LD      DE,TEXT_FAT32
        LD      B,5
        CALL    COMPARE_BYTES
        JR      Z,.VBR_READY

        LD      HL,0E2FEh
        LD      A,(HL)
        CP      055h
        JP      NZ,.BAD_FORMAT
        INC     HL
        LD      A,(HL)
        CP      0AAh
        JP      NZ,.BAD_FORMAT

        LD      HL,0E2C6h              ; MBR entry 0, partition LBA +8
        LD      DE,PARTITION_LBA
        LD      BC,4
        LDIR
        LD      HL,PARTITION_LBA
        LD      DE,WORK_LBA
        LD      BC,4
        LDIR
        CALL    READ_WORK_LBA
        RET     C
        JR      .PARSE_VBR

.VBR_READY:
        LD      HL,ZERO_QUAD
        LD      DE,PARTITION_LBA
        LD      BC,4
        LDIR

.PARSE_VBR:
        LD      A,(0E10Bh)             ; 512 bytes per sector = 00 02
        OR      A
        JR      NZ,.BAD_FORMAT
        LD      A,(0E10Ch)
        CP      02h
        JR      NZ,.BAD_FORMAT
        LD      A,(0E10Dh)
        OR      A
        JR      Z,.BAD_FORMAT
        LD      (SECTORS_PER_CLUSTER),A
        LD      A,(0E110h)
        OR      A
        JR      Z,.BAD_FORMAT
        LD      (NUMBER_OF_FATS),A

        LD      HL,0E124h              ; FAT size in sectors
        LD      DE,FAT_SIZE
        LD      BC,4
        LDIR
        LD      HL,0E12Ch              ; root-directory first cluster
        LD      DE,ROOT_CLUSTER
        LD      BC,4
        LDIR
        LD      A,(ROOT_CLUSTER+3)
        AND     0Fh
        LD      (ROOT_CLUSTER+3),A

        LD      HL,PARTITION_LBA
        LD      DE,FAT_LBA
        LD      BC,4
        LDIR
        LD      A,(0E10Eh)             ; reserved-sector count
        LD      E,A
        LD      A,(0E10Fh)
        LD      D,A
        LD      HL,FAT_LBA
        CALL    ADD_WORD_TO_QUAD

        LD      HL,FAT_LBA
        LD      DE,DATA_LBA
        LD      BC,4
        LDIR
        LD      A,(NUMBER_OF_FATS)
        LD      B,A
.ADD_FATS:
        LD      HL,FAT_SIZE
        LD      DE,DATA_LBA
        CALL    ADD_QUAD_TO_QUAD
        DJNZ    .ADD_FATS

        OR      A                       ; clear carry
        RET

.BAD_FORMAT:
        POP     HL                      ; discard FAT32_INIT return address
        JP      MSG_NO_FAT32

; ---------------------------------------------------------------------------
; Scan the first root-directory cluster. This supports up to
; sectors-per-cluster * 16 short directory entries, sufficient for the
; deliberately flat Z1013 SD card. Long-name records and subdirectories are
; ignored. Every displayed file is checked for the nine-byte @DD header.
; ---------------------------------------------------------------------------
DIRECTORY_SCAN:
        LD      HL,ROOT_CLUSTER
        LD      DE,WORK_CLUSTER
        LD      BC,4
        LDIR
        CALL    CLUSTER_TO_LBA
        LD      HL,WORK_LBA
        LD      DE,DIRECTORY_BASE_LBA
        LD      BC,4
        LDIR
        XOR     A
        LD      (DIRECTORY_SECTOR),A
        LD      (DIRECTORY_PAGE_COUNT),A

.SECTOR_LOOP:
        LD      HL,DIRECTORY_BASE_LBA
        LD      DE,WORK_LBA
        LD      BC,4
        LDIR
        LD      A,(DIRECTORY_SECTOR)
        LD      E,A
        LD      D,0
        LD      HL,WORK_LBA
        CALL    ADD_WORD_TO_QUAD
        CALL    READ_WORK_LBA
        RET     C
        XOR     A
        LD      (DIRECTORY_ENTRY_INDEX),A

.ENTRY_LOOP:
        CALL    DIRECTORY_ENTRY_POINTER
        LD      A,(HL)
        OR      A
        JP      Z,.DONE
        CP      0E5h
        JR      Z,.NEXT_ENTRY
        PUSH    HL
        LD      DE,DIRECTORY_ENTRY_COPY
        LD      BC,32
        LDIR
        POP     HL
        LD      A,(DIRECTORY_ENTRY_COPY+11)
        CP      0Fh                     ; VFAT long-name record
        JR      Z,.NEXT_ENTRY
        AND     018h                    ; volume label or directory
        JR      NZ,.NEXT_ENTRY

        LD      A,(DIRECTORY_ENTRY_COPY+26)
        LD      (WORK_CLUSTER),A
        LD      A,(DIRECTORY_ENTRY_COPY+27)
        LD      (WORK_CLUSTER+1),A
        LD      A,(DIRECTORY_ENTRY_COPY+20)
        LD      (WORK_CLUSTER+2),A
        LD      A,(DIRECTORY_ENTRY_COPY+21)
        AND     0Fh
        LD      (WORK_CLUSTER+3),A
        CALL    CLUSTER_TO_LBA
        CALL    READ_WORK_LBA
        RET     C
        LD      HL,0E100h
        LD      DE,TEXT_AT_DD
        LD      B,3
        CALL    COMPARE_BYTES
        JR      NZ,.RESTORE_DIRECTORY

        LD      HL,0E100h
        LD      DE,HEADER_COPY
        LD      BC,9
        LDIR
        LD      A,(FOUND_COUNT)
        INC     A
        LD      (FOUND_COUNT),A
        CALL    PRINT_DIRECTORY_ENTRY
        JP      C,.DONE

.RESTORE_DIRECTORY:
        LD      HL,DIRECTORY_BASE_LBA
        LD      DE,WORK_LBA
        LD      BC,4
        LDIR
        LD      A,(DIRECTORY_SECTOR)
        LD      E,A
        LD      D,0
        LD      HL,WORK_LBA
        CALL    ADD_WORD_TO_QUAD
        CALL    READ_WORK_LBA
        RET     C

.NEXT_ENTRY:
        LD      A,(DIRECTORY_ENTRY_INDEX)
        INC     A
        LD      (DIRECTORY_ENTRY_INDEX),A
        CP      16
        JP      C,.ENTRY_LOOP
        LD      A,(DIRECTORY_SECTOR)
        INC     A
        LD      (DIRECTORY_SECTOR),A
        LD      B,A
        LD      A,(SECTORS_PER_CLUSTER)
        CP      B
        JP      NZ,.SECTOR_LOOP
.DONE:
        OR      A
        RET

DIRECTORY_ENTRY_POINTER:
        LD      HL,0E100h
        LD      A,(DIRECTORY_ENTRY_INDEX)
        OR      A
        RET     Z
        LD      B,A
        LD      DE,32
.ADD32:
        ADD     HL,DE
        DJNZ    .ADD32
        RET

; Find INPUT_FAT_NAME in the first root-directory cluster.
; Carry set: A=1 not found, A=2 SD/read error.
FIND_NAMED_FILE:
        LD      HL,ROOT_CLUSTER
        LD      DE,WORK_CLUSTER
        LD      BC,4
        LDIR
        CALL    CLUSTER_TO_LBA
        LD      HL,WORK_LBA
        LD      DE,DIRECTORY_BASE_LBA
        LD      BC,4
        LDIR
        XOR     A
        LD      (DIRECTORY_SECTOR),A
.SECTOR_LOOP:
        LD      HL,DIRECTORY_BASE_LBA
        LD      DE,WORK_LBA
        LD      BC,4
        LDIR
        LD      A,(DIRECTORY_SECTOR)
        LD      E,A
        LD      D,0
        LD      HL,WORK_LBA
        CALL    ADD_WORD_TO_QUAD
        CALL    READ_WORK_LBA
        JR      NC,.READ_OK
        LD      A,2
        SCF
        RET
.READ_OK:
        XOR     A
        LD      (DIRECTORY_ENTRY_INDEX),A
.ENTRY_LOOP:
        CALL    DIRECTORY_ENTRY_POINTER
        LD      A,(HL)
        OR      A
        JR      Z,.NOT_FOUND
        CP      0E5h
        JR      Z,.NEXT_ENTRY
        PUSH    HL
        LD      DE,INPUT_FAT_NAME
        LD      B,11
        CALL    COMPARE_BYTES
        POP     HL
        JR      NZ,.NEXT_ENTRY
        PUSH    HL
        LD      DE,DIRECTORY_ENTRY_COPY
        LD      BC,32
        LDIR
        POP     HL
        LD      A,(DIRECTORY_ENTRY_COPY+11)
        CP      0Fh
        JR      Z,.NEXT_ENTRY
        AND     018h
        JR      NZ,.NEXT_ENTRY
        OR      A
        RET
.NEXT_ENTRY:
        LD      A,(DIRECTORY_ENTRY_INDEX)
        INC     A
        LD      (DIRECTORY_ENTRY_INDEX),A
        CP      16
        JR      C,.ENTRY_LOOP
        LD      A,(DIRECTORY_SECTOR)
        INC     A
        LD      (DIRECTORY_SECTOR),A
        LD      B,A
        LD      A,(SECTORS_PER_CLUSTER)
        CP      B
        JR      NZ,.SECTOR_LOOP
.NOT_FOUND:
        LD      A,1
        SCF
        RET

; Load the file selected in DIRECTORY_ENTRY_COPY. The nine-byte @DD header is
; consumed and never copied into Z1013 RAM.
; Carry set errors: 2=read, 3=not a Z1013 file, 4=bad range, 5=short chain.
LOAD_FOUND_FILE:
        LD      A,(DIRECTORY_ENTRY_COPY+26)
        LD      (WORK_CLUSTER),A
        LD      A,(DIRECTORY_ENTRY_COPY+27)
        LD      (WORK_CLUSTER+1),A
        LD      A,(DIRECTORY_ENTRY_COPY+20)
        LD      (WORK_CLUSTER+2),A
        LD      A,(DIRECTORY_ENTRY_COPY+21)
        AND     0Fh
        LD      (WORK_CLUSTER+3),A
        CALL    CLUSTER_TO_LBA
        CALL    READ_WORK_LBA
        JR      NC,.HEADER_READ
        LD      A,2
        SCF
        RET
.HEADER_READ:
        LD      HL,0E100h
        LD      DE,TEXT_AT_DD
        LD      B,3
        CALL    COMPARE_BYTES
        JR      Z,.VALID_HEADER
        LD      A,3
        SCF
        RET
.VALID_HEADER:
        LD      HL,(0E103h)
        LD      (LOAD_DEST),HL
        LD      DE,0100h
        OR      A
        SBC     HL,DE
        JR      C,.BAD_RANGE
        LD      HL,(0E105h)
        LD      (LOAD_END),HL
        LD      DE,0B000h
        OR      A
        SBC     HL,DE
        JR      NC,.BAD_RANGE
        LD      HL,(LOAD_END)
        LD      DE,(LOAD_DEST)
        OR      A
        SBC     HL,DE
        JR      C,.BAD_RANGE
        INC     HL
        LD      (LOAD_REMAIN),HL
        LD      HL,(0E107h)
        LD      (LOAD_START),HL
        ; Only .COM requires a start address inside the payload. Keep this
        ; replacement exactly as long as the former inline check, because the
        ; separately loaded @DS extension calls stable IO.SYS addresses.
        CALL    0D830h
        JP      C,.BAD_RANGE
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        LD      A,1
        LD      (FIRST_FILE_SECTOR),A
        XOR     A
        LD      (FILE_SECTOR_IN_CLUSTER),A
        JR      .USE_CURRENT_LBA

.BAD_RANGE:
        LD      A,4
        SCF
        RET

.CLUSTER_LOOP:
        CALL    CLUSTER_TO_LBA
        XOR     A
        LD      (FILE_SECTOR_IN_CLUSTER),A
.USE_CURRENT_LBA:
        CALL    READ_WORK_LBA
        JR      NC,.SECTOR_READY
        LD      A,2
        SCF
        RET
.SECTOR_READY:
        LD      A,(FIRST_FILE_SECTOR)
        OR      A
        JR      Z,.FULL_SECTOR
        XOR     A
        LD      (FIRST_FILE_SECTOR),A
        LD      HL,0E109h
        LD      BC,503
        JR      .COPY
.FULL_SECTOR:
        LD      HL,0E100h
        LD      BC,512
.COPY:
        CALL    COPY_PAYLOAD
        LD      HL,(LOAD_REMAIN)
        LD      A,H
        OR      L
        JR      Z,.LOAD_DONE
        LD      A,(FILE_SECTOR_IN_CLUSTER)
        INC     A
        LD      (FILE_SECTOR_IN_CLUSTER),A
        LD      B,A
        LD      A,(SECTORS_PER_CLUSTER)
        CP      B
        JR      Z,.NEXT_CLUSTER
        LD      HL,WORK_LBA
        CALL    INCREMENT_QUAD
        JR      .USE_CURRENT_LBA
.NEXT_CLUSTER:
        CALL    FAT_NEXT_CLUSTER
        JR      NC,.CLUSTER_LOOP
        RET
.LOAD_DONE:
        OR      A
        RET

COPY_PAYLOAD:
        LD      DE,(LOAD_DEST)
.LOOP:
        LD      A,(LOAD_REMAIN)
        LD      IXL,A
        LD      A,(LOAD_REMAIN+1)
        OR      IXL
        JR      Z,.DONE
        LD      A,B
        OR      C
        JR      Z,.DONE
        LD      A,(HL)
        LD      (DE),A
        INC     HL
        INC     DE
        PUSH    HL
        LD      HL,(LOAD_REMAIN)
        DEC     HL
        LD      (LOAD_REMAIN),HL
        POP     HL
        DEC     BC
        JR      .LOOP
.DONE:
        LD      (LOAD_DEST),DE
        RET

; Read the FAT32 entry belonging to WORK_CLUSTER and replace WORK_CLUSTER by
; the next cluster. Carry is set for an end-of-chain marker or invalid entry.
FAT_NEXT_CLUSTER:
        LD      HL,WORK_CLUSTER
        LD      DE,TEMP_CLUSTER
        LD      BC,4
        LDIR
        LD      B,7
.SHIFT:
        LD      HL,TEMP_CLUSTER+3
        SRL     (HL)
        DEC     HL
        RR      (HL)
        DEC     HL
        RR      (HL)
        DEC     HL
        RR      (HL)
        DJNZ    .SHIFT
        LD      HL,FAT_LBA
        LD      DE,WORK_LBA
        LD      BC,4
        LDIR
        LD      HL,TEMP_CLUSTER
        LD      DE,WORK_LBA
        CALL    ADD_QUAD_TO_QUAD
        CALL    READ_WORK_LBA
        JR      NC,.FAT_READ_OK
        LD      A,2
        SCF
        RET
.FAT_READ_OK:
        LD      A,(WORK_CLUSTER)
        AND     07Fh
        LD      L,A
        LD      H,0
        ADD     HL,HL
        ADD     HL,HL
        LD      DE,0E100h
        ADD     HL,DE
        LD      DE,WORK_CLUSTER
        LD      BC,4
        LDIR
        LD      A,(WORK_CLUSTER+3)
        AND     0Fh
        LD      (WORK_CLUSTER+3),A
        CP      0Fh
        JR      NZ,.VALID
        LD      A,(WORK_CLUSTER+2)
        CP      0FFh
        JR      NZ,.VALID
        LD      A,(WORK_CLUSTER+1)
        CP      0FFh
        JR      NZ,.VALID
        LD      A,(WORK_CLUSTER)
        CP      0F8h
        JR      C,.VALID
        LD      A,5
        SCF
        RET
.VALID:
        LD      A,(WORK_CLUSTER+1)
        LD      B,A
        LD      A,(WORK_CLUSTER+2)
        OR      B
        LD      B,A
        LD      A,(WORK_CLUSTER+3)
        OR      B
        JR      NZ,.VALID_CLUSTER
        LD      A,(WORK_CLUSTER)
        CP      2
        JR      NC,.VALID_CLUSTER
        LD      A,5
        SCF
        RET
.VALID_CLUSTER:
        OR      A
        RET

; WORK_LBA = DATA_LBA + ((WORK_CLUSTER - 2) * sectors-per-cluster)
CLUSTER_TO_LBA:
        LD      HL,DATA_LBA
        LD      DE,WORK_LBA
        LD      BC,4
        LDIR
        LD      HL,WORK_CLUSTER
        LD      DE,TEMP_CLUSTER
        LD      BC,4
        LDIR
        LD      HL,TEMP_CLUSTER
        CALL    DECREMENT_QUAD
        CALL    DECREMENT_QUAD
.MUL_LOOP:
        LD      HL,TEMP_CLUSTER
        CALL    QUAD_IS_ZERO
        RET     Z
        LD      A,(SECTORS_PER_CLUSTER)
        LD      E,A
        LD      D,0
        LD      HL,WORK_LBA
        CALL    ADD_WORD_TO_QUAD
        LD      HL,TEMP_CLUSTER
        CALL    DECREMENT_QUAD
        JR      .MUL_LOOP

; ---------------------------------------------------------------------------
; Raw sector read
; ---------------------------------------------------------------------------
READ_WORK_LBA:
.WAIT_READY:
        IN      A,(15h)
        BIT     1,A
        SCF
        RET     NZ
        BIT     2,A
        JR      Z,.WAIT_READY
        LD      A,(WORK_LBA)
        OUT     (10h),A
        LD      A,(WORK_LBA+1)
        OUT     (11h),A
        LD      A,(WORK_LBA+2)
        OUT     (12h),A
        LD      A,(WORK_LBA+3)
        OUT     (13h),A
        LD      A,1
        OUT     (14h),A
.WAIT_DONE:
        IN      A,(15h)
        BIT     1,A
        SCF
        RET     NZ
        BIT     0,A
        JR      NZ,.WAIT_DONE
        BIT     4,A
        JR      Z,.WAIT_DONE
        OR      A
        RET

; ---------------------------------------------------------------------------
; 32-bit helpers, little-endian byte order
; ---------------------------------------------------------------------------
ADD_WORD_TO_QUAD:                     ; (HL) += DE
        LD      A,(HL)
        ADD     A,E
        LD      (HL),A
        INC     HL
        LD      A,(HL)
        ADC     A,D
        LD      (HL),A
        INC     HL
        LD      A,(HL)
        ADC     A,0
        LD      (HL),A
        INC     HL
        LD      A,(HL)
        ADC     A,0
        LD      (HL),A
        RET

ADD_QUAD_TO_QUAD:                     ; (DE) += (HL)
        OR      A
        LD      A,(DE)
        ADC     A,(HL)
        LD      (DE),A
        INC     DE
        INC     HL
        LD      A,(DE)
        ADC     A,(HL)
        LD      (DE),A
        INC     DE
        INC     HL
        LD      A,(DE)
        ADC     A,(HL)
        LD      (DE),A
        INC     DE
        INC     HL
        LD      A,(DE)
        ADC     A,(HL)
        LD      (DE),A
        RET

INCREMENT_QUAD:
        INC     (HL)
        RET     NZ
        INC     HL
        INC     (HL)
        RET     NZ
        INC     HL
        INC     (HL)
        RET     NZ
        INC     HL
        INC     (HL)
        RET

DECREMENT_QUAD:
        LD      A,(HL)
        DEC     (HL)
        OR      A
        RET     NZ
        INC     HL
        LD      A,(HL)
        DEC     (HL)
        OR      A
        RET     NZ
        INC     HL
        LD      A,(HL)
        DEC     (HL)
        OR      A
        RET     NZ
        INC     HL
        DEC     (HL)
        RET

QUAD_IS_ZERO:
        LD      A,(HL)
        INC     HL
        OR      (HL)
        INC     HL
        OR      (HL)
        INC     HL
        OR      (HL)
        RET

COMPARE_BYTES:                         ; HL/DE, B bytes; returns Z if equal
.LOOP:
        LD      A,(DE)
        CP      (HL)
        RET     NZ
        INC     HL
        INC     DE
        DJNZ    .LOOP
        RET

; ---------------------------------------------------------------------------
; Monitor output through portable RST 20h services
; ---------------------------------------------------------------------------
OUTCH:
        PUSH    BC
        PUSH    DE
        PUSH    HL
        RST     20h
        DB      00h
        POP     HL
        POP     DE
        POP     BC
        RET

PRINT_CR:
        LD      A,0Dh
        JP      OUTCH

PRINT_Z:
        LD      A,(HL)
        OR      A
        RET     Z
        INC     HL
        CALL    OUTCH
        JR      PRINT_Z

PRINT_MESSAGE:
        CALL    PRINT_Z
        JP      PRINT_CR

PRINT_DIRECTORY_HEADER:
        LD      HL,TEXT_DIRECTORY_HEADER
        CALL    PRINT_MESSAGE
        LD      HL,TEXT_DIRECTORY_LINE
        JP      PRINT_Z

PRINT_DIRECTORY_ENTRY:
        JP      0D870h                  ; formatter and pagination in @DS area

PRINT_WORD_LE:
        INC     HL
        LD      A,(HL)
        CALL    PRINT_HEX_BYTE
        DEC     HL
        LD      A,(HL)
        JP      PRINT_HEX_BYTE

PRINT_HEX_BYTE:
        PUSH    AF
        RRCA
        RRCA
        RRCA
        RRCA
        AND     0Fh
        CALL    PRINT_HEX_NIBBLE
        POP     AF
        AND     0Fh
PRINT_HEX_NIBBLE:
        ADD     A,'0'
        CP      '9'+1
        JR      C,.DIGIT
        ADD     A,7
.DIGIT:
        JP      OUTCH

TEXT_FAT32:             DB "FAT32"
TEXT_AT_DD:             DB "@DD"
TEXT_NO_Z1013:          DB "KEINE Z1013-DATEI",0
TEXT_SD_READ_ERROR:     DB "SD-/LESEFEHLER",0
TEXT_NO_FAT32:          DB "KEIN FAT32-DATENTRAEGER",0
TEXT_NOT_AVAILABLE:     DB "FUNKTION NOCH NICHT AKTIV",0
TEXT_UNKNOWN:           DB "UNBEKANNTES @D-KOMMANDO",0
TEXT_FILE_PROMPT:       DB "DATEI NAME > ",0
TEXT_FILE_NOT_FOUND:    DB "DATEI NICHT VORHANDEN",0
TEXT_NOT_Z1013:         DB "KEINE Z1013-DATEI",0
TEXT_BAD_ADDRESS:       DB "UNGUELTIGER ADRESSBEREICH",0
TEXT_FILE_TOO_SHORT:    DB "DATEI/CLUSTERKETTE ZU KURZ",0
TEXT_DIRECTORY_HEADER:  DB "File            von   bis  start",0
TEXT_DIRECTORY_LINE:    DB "--------------+-----+-----+-----",0
TEXT_DIRECTORY_MORE:    DB "ENTER=WEITER ESC=ENDE",0

ZERO_QUAD:              DB 0,0,0,0
PARTITION_LBA:          DB 0,0,0,0
FAT_LBA:                DB 0,0,0,0
DATA_LBA:               DB 0,0,0,0
FAT_SIZE:               DB 0,0,0,0
ROOT_CLUSTER:           DB 0,0,0,0
WORK_CLUSTER:           DB 0,0,0,0
TEMP_CLUSTER:           DB 0,0,0,0
WORK_LBA:               DB 0,0,0,0
DIRECTORY_BASE_LBA:     DB 0,0,0,0
SECTORS_PER_CLUSTER:    DB 0
NUMBER_OF_FATS:         DB 0
DIRECTORY_SECTOR:       DB 0
DIRECTORY_ENTRY_INDEX:  DB 0
FOUND_COUNT:            DB 0
DIRECTORY_PAGE_COUNT:   DB 0
NAME_POSITION:          DB 0
NAME_IN_EXTENSION:      DB 0
NAME_CHARACTER_COUNT:   DB 0
NAME_CURSOR:            DB 0
NAME_LENGTH:            DB 0
INPUT_TEXT_NAME:        DS 12,0
INPUT_FAT_NAME:         DS 11,0
LOAD_DEST:              DW 0
LOAD_END:               DW 0
LOAD_START:             DW 0
LOAD_REMAIN:            DW 0
FIRST_FILE_SECTOR:      DB 0
FILE_SECTOR_IN_CLUSTER: DB 0
HEADER_COPY:            DS 9,0
DIRECTORY_ENTRY_COPY:   DS 32,0

IO_END:
        ASSERT  IO_END <= 0EC00h
        SAVEBIN "IO_FAT32_DL.BIN",0E300h,IO_END-0E300h
