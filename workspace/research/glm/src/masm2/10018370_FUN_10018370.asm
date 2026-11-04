.686
.MODEL FLAT, C
EXTRN sub_100183C2:PROC
EXTRN sub_1005F38C:PROC
EXTRN sub_1005FAFE:PROC
EXTRN sub_1005FB30:PROC
EXTRN sub_1005FF4C:PROC
.CODE
FUN_10018370 PROC
    push push 1
    push push 0101958CCh
    mov mov ecx, esi
    call sub_1005FAFE
    add add esp, 8
    test test eax, eax
    je L0
    mov mov ecx, esi
    call sub_1005FF4C
    cmp cmp eax, edi
    je sub_100183C2
    push push eax
    push push edi
    push push 0101958ACh
    call sub_1005F38C
    add add esp, 12
    xor xor al, al
    ret ret
    push push 1
    push push 0101958A8h
    mov mov ecx, esi
    call sub_1005FB30
    add add esp, 8
    test test eax, eax
    setne setne al
    ret ret
FUN_10018370 ENDP
END
