
__declspec(naked) void FUN_10084323(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 0x10]
    test edi, edi
    jne L12
    lea edi, [ebp + 8]
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi + 4]
    cmp eax, 9
    jne L12
    mov ecx, dword ptr [esi + 0x10]
    xor eax, eax
    inc eax
    cmp ecx, eax
    je L12
    test ecx, ecx
    je L12
    cmp ecx, 2
    jne L12
    mov eax, dword ptr [esi + 0x1c]
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esi + 0x18]
    jmp L12
    cmp ecx, 3
    jne L12
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [ecx], eax
    mov dword ptr [edi], eax
    jmp L12
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esi + 0x1c]
    jmp L12
    cmp eax, 8
    jne L12
    push edi
    mov edi, dword ptr [ebp + 0xc]
    push edi
    push dword ptr [esi + 0x10]
    call L12
    test eax, eax
    jl L12
    mov eax, dword ptr [esi + 0x14]
    imul eax, dword ptr [edi]
    jmp L12
    cmp eax, 1
    jne L12
    mov ebx, dword ptr [ebp + 0xc]
    and dword ptr [ebx], 0
    and dword ptr [edi], 0
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [eax + 0x18]
    lea ecx, [ebp + 0xc]
    push ecx
    lea ecx, [ebp + 0x10]
    push ecx
    push dword ptr [eax + 0x20]
    call L12
    test eax, eax
    jl L12
    mov eax, dword ptr [ebp + 0x10]
    add dword ptr [ebx], eax
    mov eax, dword ptr [edi]
    cmp dword ptr [ebp + 0xc], eax
    jbe L12
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [edi], eax
    mov esi, dword ptr [esi + 0xc]
    test esi, esi
    jne L12
    xor eax, eax
    jmp L12
    mov eax, 0x80004005
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 0xc
    }
}
