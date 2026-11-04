
__declspec(naked) void FUN_10085469(void)
{
    __asm {
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    cmp eax, 0x20000000
    je L1
    cmp eax, 0x20100000
    je L1
    cmp eax, 0x20400000
    je L1
    cmp eax, 0x20500000
    je L1
    cmp eax, 0x50000000
    je L1
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
    }
}
