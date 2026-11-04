.686
.MODEL FLAT, C
EXTRN sub_10018426:PROC
EXTRN sub_10018434:PROC
EXTRN sub_1005F39D:PROC
EXTRN sub_1005FAFA:PROC
EXTRN sub_1005FB0F:PROC
EXTRN sub_1005FB41:PROC
EXTRN sub_1005FF5D:PROC
.CODE
FUN_100183c0 PROC
    push push 1
    push push eax
    mov mov ecx, esi
    call sub_1005FAFA
    add add esp, 8
    test test eax, eax
    je L0
    push push 1
    push push 0101958CCh
    mov mov ecx, esi
    call sub_1005FB0F
    add add esp, 8
    test test eax, eax
    je sub_10018426
    mov mov ecx, esi
    call sub_1005FF5D
    cmp cmp eax, edi
    je sub_10018434
    push push eax
    push push edi
    push push 0101958ACh
    call sub_1005F39D
    add add esp, 12
    xor xor al, al
    ret ret
    push push 1
    push push 0101958A8h
    mov mov ecx, esi
    call sub_1005FB41
L0:
    add add esp, 8
    test test eax, eax
    setne setne al
    ret ret
FUN_100183c0 ENDP
END
