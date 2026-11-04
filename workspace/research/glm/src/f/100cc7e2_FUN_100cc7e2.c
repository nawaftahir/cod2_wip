
__declspec(naked) void FUN_100cc7e2(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 0xc]
    xor eax, eax
    cmp esi, eax
    mov ecx, esi
    je L5
    mov edx, dword ptr [ebp + 8]
    cmp word ptr [edx], ax
    je L5
    inc edx
    inc edx
    dec esi
    jne L5
    cmp esi, eax
    jne L5
    mov eax, 0x80070057
    jmp L5
    mov edx, dword ptr [ebp + 0x10]
    cmp edx, eax
    je L5
    sub ecx, esi
    mov dword ptr [edx], ecx
    pop esi
    pop ebp
    ret 0xc
    }
}
