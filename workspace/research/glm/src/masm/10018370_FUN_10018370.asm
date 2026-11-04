.686
.MODEL FLAT, C
EXTRN sub_1005F38C:PROC
EXTRN sub_1005FAFE:PROC
EXTRN sub_1005FB30:PROC
EXTRN sub_1005FF4C:PROC
.CODE
FUN_10018370 PROC
    push 1
    push 0101958CCh
    mov ecx, esi
    call sub_1005FAFE
    add esp, 8
    test eax, eax
    je L0
    mov ecx, esi
    call sub_1005FF4C
    cmp eax, edi
    je L1
    push eax
    push edi
    push 0101958ACh
    call sub_1005F38C
    add esp, 12
L0:
    xor al, al
    ret
L1:
    push 1
    push 0101958A8h
    mov ecx, esi
    call sub_1005FB30
    add esp, 8
    test eax, eax
    setne al
    ret
FUN_10018370 ENDP
END
