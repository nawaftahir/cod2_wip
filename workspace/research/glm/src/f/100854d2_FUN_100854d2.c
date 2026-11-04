
__declspec(naked) void FUN_100854d2(void)
{
    __asm {
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    mov ecx, 0x70700000
    cmp eax, ecx
    ja L3
    je L3
    cmp eax, 0x50300000
    je L3
    cmp eax, 0x70100000
    je L3
    cmp eax, 0x70200000
    je L3
    cmp eax, 0x70500000
    je L3
    cmp eax, 0x70600000
    jmp L3
    cmp eax, 0x70b00000
    je L3
    cmp eax, 0x70c00000
    je L3
    cmp eax, 0x70d00000
    je L3
    cmp eax, 0x71000000
    je L3
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
    }
}
