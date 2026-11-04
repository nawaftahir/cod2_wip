
__declspec(naked) void FUN_1007d84c(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [ebp + 0xc]
    push 4
    pop ecx
    xor eax, eax
    repe cmpsd dword ptr [esi], dword ptr es:[edi]
    pop edi
    sete al
    pop esi
    pop ebp
    ret 8
    }
}
