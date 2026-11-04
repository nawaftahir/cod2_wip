.686
.MODEL FLAT, C
EXTRN sub_1005F39D:PROC
EXTRN sub_1005FAFA:PROC
EXTRN sub_1005FB0F:PROC
EXTRN sub_1005FB41:PROC
EXTRN sub_1005FF5D:PROC
.CODE
FUN_100183c0 PROC
    push 1
    push eax
    mov ecx, esi
    call sub_1005FAFA
    add esp, 8
    test eax, eax
    je L0
    push 1
    push 0101958CCh
    mov ecx, esi
    call sub_1005FB0F
    add esp, 8
    test eax, eax
    je L0
    mov ecx, esi
    call sub_1005FF5D
    cmp eax, edi
    je L1
    push eax
    push edi
    push 0101958ACh
    call sub_1005F39D
    add esp, 12
L0:
    xor al, al
    ret
L1:
    push 1
    push 0101958A8h
    mov ecx, esi
    call sub_1005FB41
    add esp, 8
    test eax, eax
    setne al
    ret
FUN_100183c0 ENDP
END
