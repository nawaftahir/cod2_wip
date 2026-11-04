.686
.MODEL FLAT, C
EXTRN sub_10018FEE:PROC
EXTRN sub_10019002:PROC
EXTRN sub_1005F39E:PROC
EXTRN sub_1005FB01:PROC
EXTRN sub_1005FB3F:PROC
EXTRN sub_1005FF53:PROC
.CODE
FUN_10018f90 PROC
    push push edi
    push push 1
    push push 0101958CCh
    mov mov ecx, esi
    mov mov edi, eax
    call sub_1005FB01
    add add esp, 8
    test test eax, eax
    jne L0
    xor xor al, al
    pop pop edi
    ret ret
    mov mov ecx, esi
    call sub_1005FF53
    test test eax, eax
    mov mov ecx, dword ptr [esp + 8]
    mov mov dword ptr [ecx], eax
    jl sub_10018FEE
    cmp cmp eax, edi
    jl sub_10019002
    dec dec edi
    push push edi
    push push eax
L0:
    push push 0101956ACh
    call sub_1005F39E
    add add esp, 12
    push push 1
    push push 0101958A8h
    mov mov ecx, esi
    call sub_1005FB3F
    add add esp, 8
    test test eax, eax
    setne setne al
    pop pop edi
    ret ret
FUN_10018f90 ENDP
END
