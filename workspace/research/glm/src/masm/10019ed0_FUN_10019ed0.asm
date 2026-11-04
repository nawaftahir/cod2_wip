.686
.MODEL FLAT, C
EXTRN sub_10019E22:PROC
EXTRN sub_10019E39:PROC
.CODE
FUN_10019ed0 PROC
    push esi
    push 01018F040h
    push edi
    push ebx
    mov word ptr [esi], 1
    call sub_10019E22
    add esp, 16
    test al, al
    je L0
    mov al, 1
    ret
L0:
    push esi
    push 01018F620h
    push edi
    push ebx
    call sub_10019E39
    add esp, 16
    test al, al
    setne al
    ret
FUN_10019ed0 ENDP
END
