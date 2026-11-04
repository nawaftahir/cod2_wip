
__declspec(naked) void FUN_100997e2(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    push ebx
    push esi
    push edi
    mov edi, dword ptr [eax + 0x1c]
    test edi, edi
    je L10
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [eax + 8]
    mov eax, dword ptr [edi + 0x10]
    mov esi, edx
    mov bl, byte ptr [esi]
    mov cl, bl
    cmp bl, byte ptr [eax]
    jne L10
    test cl, cl
    je L10
    mov bl, byte ptr [esi + 1]
    mov cl, bl
    cmp bl, byte ptr [eax + 1]
    jne L10
    inc esi
    inc esi
    inc eax
    inc eax
    test cl, cl
    jne L10
    xor eax, eax
    jmp L10
    sbb eax, eax
    sbb eax, -1
    test eax, eax
    je L10
    jge L10
    mov edi, dword ptr [edi + 8]
    jmp L10
    mov edi, dword ptr [edi + 0xc]
    test edi, edi
    jne L10
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
    mov eax, dword ptr [edi + 0x14]
    jmp L10
    }
}
