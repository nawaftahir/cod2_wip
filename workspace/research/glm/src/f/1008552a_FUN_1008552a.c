
__declspec(naked) void FUN_1008552a(void)
{
    __asm {
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    mov ecx, 0x74200000
    cmp eax, ecx
    ja L4
    je L4
    mov ecx, 0x11500000
    cmp eax, ecx
    ja L4
    je L4
    cmp eax, 0x11100000
    je L4
    cmp eax, 0x11200000
    je L4
    cmp eax, 0x11300000
    je L4
    cmp eax, 0x11400000
    jmp L4
    cmp eax, 0x20800000
    je L4
    cmp eax, 0x20900000
    je L4
    cmp eax, 0x74100000
    jmp L4
    cmp eax, 0x74300000
    je L4
    cmp eax, 0x74400000
    je L4
    cmp eax, 0x74500000
    je L4
    cmp eax, 0x74600000
    je L4
    cmp eax, 0x74700000
    je L4
    cmp eax, 0x74a00000
    je L4
    cmp eax, 0x74b00000
    je L4
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
    }
}
