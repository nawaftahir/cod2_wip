; FUN_1009a3ce @ 0x1009a3ce — auto-synthesized
.CODE
FUN_1009a3ce PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov ebx, ecx
    test esi, esi
    je L0
    mov eax, dword ptr [esi + 4]
    cmp eax, 1
    jne L1
    push dword ptr [esi + 8]
    mov ecx, ebx
    call L2
    test eax, eax
    jne L3
    mov esi, dword ptr [esi + 0xc]
    jmp L4
    cmp eax, 0xe
    je L5
    cmp eax, 0xd
    jne L0
    mov eax, dword ptr [esi + 0x1c]
    cmp eax, 0x17
    jg L6
    cmp eax, 0x16
    jge L7
    test eax, eax
    jl L3
    cmp eax, 1
    jg L8
    mov esi, dword ptr [esi + 0x20]
    jmp L4
    xor eax, eax
    cmp dword ptr [esi + 0x10], 6
    setne al
    jmp L9
    cmp eax, 0x13
    jle L3
    cmp eax, 0x15
    jmp L10
    cmp eax, 0x19
    jl L3
    cmp eax, 0x1a
    jle L0
    xor eax, eax
    inc eax
    jmp L9
    xor eax, eax
    pop esi
    pop ebx
    pop ebp
    ret 4
FUN_1009a3ce ENDP
END