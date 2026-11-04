.686
.MODEL FLAT, C
EXTRN sub_10019E22:PROC
EXTRN sub_10019E39:PROC
EXTRN sub_10019F05:PROC
.CODE
FUN_10019ed0 PROC
    push push esi
    push push 01018F040h
    push push edi
    push push ebx
    mov mov word ptr [esi], 1
    call sub_10019E22
    add add esp, 16
    test test al, al
    je sub_10019F05
    mov mov al, 1
    ret ret
    push push esi
    push push 01018F620h
    push push edi
    push push ebx
    call sub_10019E39
    add add esp, 16
    test test al, al
    setne setne al
    ret ret
FUN_10019ed0 ENDP
END
