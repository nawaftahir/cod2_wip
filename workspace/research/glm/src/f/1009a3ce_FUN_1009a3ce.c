
__declspec(naked) void FUN_1009a3ce(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov ebx, ecx
    test esi, esi
    je L11
    mov eax, dword ptr [esi + 4]
    cmp eax, 1
    jne L11
    push dword ptr [esi + 8]
    mov ecx, ebx
    call L11
    test eax, eax
    jne L11
    mov esi, dword ptr [esi + 0xc]
    jmp L11
    cmp eax, 0xe
    je L11
    cmp eax, 0xd
    jne L11
    mov eax, dword ptr [esi + 0x1c]
    cmp eax, 0x17
    jg L11
    cmp eax, 0x16
    jge L11
    test eax, eax
    jl L11
    cmp eax, 1
    jg L11
    mov esi, dword ptr [esi + 0x20]
    jmp L11
    xor eax, eax
    cmp dword ptr [esi + 0x10], 6
    setne al
    jmp L11
    cmp eax, 0x13
    jle L11
    cmp eax, 0x15
    jmp L11
    cmp eax, 0x19
    jl L11
    cmp eax, 0x1a
    jle L11
    xor eax, eax
    inc eax
    jmp L11
    xor eax, eax
    pop esi
    pop ebx
    pop ebp
    ret 4
    }
}
