
__declspec(naked) void FUN_10099bdd(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 0xc]
    push edi
    mov edi, dword ptr [ebp + 8]
    mov ebx, ecx
    test edi, edi
    je L9
    mov eax, dword ptr [edi + 4]
    cmp eax, 1
    jne L9
    test esi, esi
    je L9
    cmp dword ptr [esi + 4], eax
    jne L9
    push dword ptr [esi + 8]
    mov ecx, ebx
    push dword ptr [edi + 8]
    call L9
    test eax, eax
    je L9
    mov edi, dword ptr [edi + 0xc]
    mov esi, dword ptr [esi + 0xc]
    jmp L9
    test esi, esi
    je L9
    cmp eax, dword ptr [esi + 4]
    jne L9
    sub eax, 6
    je L9
    dec eax
    dec eax
    je L9
    dec eax
    je L9
    dec eax
    dec eax
    jne L9
    mov esi, dword ptr [esi + 0x20]
    mov edi, dword ptr [edi + 0x20]
    jmp L9
    mov eax, dword ptr [edi + 0x14]
    cmp eax, dword ptr [esi + 0x14]
    jne L9
    mov esi, dword ptr [esi + 0x10]
    mov edi, dword ptr [edi + 0x10]
    jmp L9
    mov esi, dword ptr [esi + 0x18]
    mov edi, dword ptr [edi + 0x18]
    jmp L9
    xor eax, eax
    test esi, esi
    sete al
    jmp L9
    mov eax, dword ptr [edi + 0x10]
    cmp eax, dword ptr [esi + 0x10]
    jne L9
    mov eax, dword ptr [edi + 0x14]
    cmp eax, dword ptr [esi + 0x14]
    jne L9
    mov eax, dword ptr [edi + 0x18]
    cmp eax, dword ptr [esi + 0x18]
    jne L9
    mov eax, dword ptr [edi + 0x1c]
    cmp eax, dword ptr [esi + 0x1c]
    jne L9
    xor eax, eax
    inc eax
    jmp L9
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
    }
}
