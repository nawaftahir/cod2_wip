
__declspec(naked) void FUN_100c3da3(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    jmp L9
    mov eax, dword ptr [esi + 4]
    dec eax
    je L9
    sub eax, 5
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
    jmp L9
    mov esi, dword ptr [esi + 0x18]
    test esi, esi
    jne L9
    xor eax, eax
    jmp L9
    mov eax, dword ptr [esi + 0x1c]
    imul eax, dword ptr [esi + 0x18]
    jmp L9
    push dword ptr [esi + 0x10]
    call L9
    imul eax, dword ptr [esi + 0x14]
    jmp L9
    push edi
    push dword ptr [esi + 0xc]
    call L9
    push dword ptr [esi + 8]
    mov edi, eax
    call L9
    add eax, edi
    pop edi
    pop esi
    pop ebp
    ret 4
    }
}
