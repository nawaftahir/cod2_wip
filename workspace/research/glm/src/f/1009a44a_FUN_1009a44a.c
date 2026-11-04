
__declspec(naked) void FUN_1009a44a(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, ecx
    test esi, esi
    je L0
    mov eax, dword ptr [esi + 4]
    cmp eax, 1
    jne L1
    push dword ptr [esi + 8]
    mov ecx, edi
    call L2
    test eax, eax
    je L3
    mov esi, dword ptr [esi + 0xc]
    jmp L4
    cmp eax, 0xe
    je L5
    cmp eax, 0xd
    jne L0
    mov eax, dword ptr [esi + 0x1c]
    cmp eax, 0x14
    jl L6
    cmp eax, 0x15
    jle L3
    cmp eax, 0x19
    je L3
    cmp eax, 0x1a
    je L7
    cmp eax, 0x1b
    jne L6
    mov esi, dword ptr [esi + 0x24]
    test esi, esi
    je L3
    cmp dword ptr [esi + 4], 0xd
    jne L3
    mov esi, dword ptr [esi + 0x24]
    jmp L4
    xor eax, eax
    cmp dword ptr [esi + 0x10], 6
    setne al
    jmp L8
    mov eax, dword ptr [esi + 0x20]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 0x18]
    cmp eax, 0x46
    jg L9
    cmp eax, 0x44
    jge L3
    cmp eax, 9
    je L3
    cmp eax, 0x1a
    je L3
    cmp eax, 0x28
    je L3
    cmp eax, 0x3d
    je L3
    jmp L10
    cmp eax, 0x49
    jl L10
    cmp eax, 0x4b
    jle L3
    cmp eax, 0x4d
    jle L10
    cmp eax, 0x50
    jle L3
    cmp eax, 0x52
    jle L10
    cmp eax, 0x55
    jle L3
    mov eax, dword ptr [esi + 0x24]
    push dword ptr [eax + 8]
    mov ecx, edi
    call L2
    test eax, eax
    je L3
    mov eax, dword ptr [esi + 0x24]
    push dword ptr [eax + 0xc]
    jmp L11
    push dword ptr [esi + 0x20]
    mov ecx, edi
    call L2
    test eax, eax
    je L3
    push dword ptr [esi + 0x24]
    mov ecx, edi
    call L2
    test eax, eax
    jne L0
    xor eax, eax
    jmp L8
    xor eax, eax
    inc eax
    pop edi
    pop esi
    pop ebp
    ret 4
    }
}
