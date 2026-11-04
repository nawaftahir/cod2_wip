
__declspec(naked) void FUN_1006dc2f(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    test esi, esi
    push edi
    mov edi, ecx
    jne L6
    xor eax, eax
    jmp L6
    mov eax, dword ptr [esi + 4]
    sub eax, 6
    je L6
    sub eax, 5
    je L6
    dec eax
    je L6
    dec eax
    jne L6
    lea eax, [esi + 0x30]
    jmp L6
    push dword ptr [esi + 0x14]
    mov ecx, edi
    call L6
    test eax, eax
    jne L6
    push dword ptr [esi + 0x18]
    mov ecx, edi
    call L6
    test eax, eax
    jne L6
    push dword ptr [esi + 0x1c]
    mov ecx, edi
    call L6
    test eax, eax
    jne L6
    push dword ptr [esi + 0x20]
    mov ecx, edi
    call L6
    test eax, eax
    jne L6
    jmp L6
    mov eax, dword ptr [esi + 0x14]
    add eax, 0x10
    pop edi
    pop esi
    pop ebp
    ret 4
    }
}
