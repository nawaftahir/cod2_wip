; FUN_10062d3b @ 0x10062d3b — auto-synthesized
.CODE
FUN_10062d3b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x130
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L0
    mov ecx, dword ptr [eax]
    lea edx, [ebp - 0x130]
    push edx
    push eax
    call dword ptr [ecx + 0x1c]
    test eax, eax
    jge L1
    xor eax, eax
    jmp L2
    mov eax, dword ptr [ebp - 0x6c]
    and eax, 0xffff
    cmp eax, 0x200
    jae L3
    sub eax, 0x101
    neg eax
    sbb eax, eax
    not eax
    and eax, 0x1010c460
    jmp L2
    cmp eax, 0x300
    jae L4
    cmp dword ptr [ebp - 0x30], 0xd
    jl L5
    test byte ptr [ebp - 0x38], 1
    je L5
    cmp dword ptr [ebp - 0x34], 0x18
    jne L5
    mov eax, 0x1010c450
    jmp L2
    mov eax, 0x1010c458
    jmp L2
    mov eax, 0x1010c438
    leave
    ret 4
FUN_10062d3b ENDP
END