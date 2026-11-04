
__declspec(naked) void FUN_1008540c(void)
{
    __asm {
    mov eax, dword ptr [ecx]
    mov ecx, eax
    and ecx, 0xf0000000
    cmp ecx, 0x60000000
    je L1
    and eax, 0xfff00000
    cmp eax, 0x50100000
    je L1
    cmp eax, 0x50200000
    je L1
    cmp eax, 0x50300000
    je L1
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
    }
}
