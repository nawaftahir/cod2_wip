
__declspec(naked) void FUN_1008576b(void)
{
    __asm {
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    mov ecx, 0x60800000
    cmp eax, ecx
    ja L3
    je L3
    cmp eax, 0x10d00000
    je L3
    cmp eax, 0x10e00000
    je L3
    cmp eax, 0x60000000
    je L3
    cmp eax, 0x60200000
    je L3
    cmp eax, 0x60300000
    je L3
    cmp eax, 0x60500000
    je L3
    cmp eax, 0x60700000
    jmp L3
    cmp eax, 0x60a00000
    je L3
    cmp eax, 0x60c00000
    je L3
    cmp eax, 0x60d00000
    je L3
    cmp eax, 0x60f00000
    je L3
    cmp eax, 0x61100000
    je L3
    cmp eax, 0x61200000
    je L3
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
    }
}
