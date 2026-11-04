.686
.MODEL FLAT, C
.CODE
FUN_10062d3b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000130h
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L0
    mov ecx, dword ptr [eax]
    lea edx, [ebp - 000000130h]
    push edx
    push eax
    call dword ptr [ecx + 0x1c]
    test eax, eax
    jge L1
L0:
    xor eax, eax
    jmp L5
L1:
    mov eax, dword ptr [ebp - 108]
    and eax, 00000FFFFh
    cmp eax, 000000200h
    jae L2
    sub eax, 000000101h
    neg eax
    sbb eax, eax
    not eax
    and eax, 01010C460h
    jmp L5
L2:
    cmp eax, 000000300h
    jae L4
    cmp dword ptr [ebp - 48], 13
    jl L3
    test byte ptr [ebp - 56], 1
    je L3
    cmp dword ptr [ebp - 52], 24
    jne L3
    mov eax, 01010C450h
    jmp L5
L3:
    mov eax, 01010C458h
    jmp L5
L4:
    mov eax, 01010C438h
L5:
    leave
    ret 4
FUN_10062d3b ENDP
END
