
__declspec(naked) void FUN_10085604(void)
{
    __asm {
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    mov ecx, 0x73800000
    cmp eax, ecx
    ja L0
    je L1
    mov ecx, 0x20900000
    cmp eax, ecx
    ja L2
    je L1
    mov ecx, 0x11400000
    cmp eax, ecx
    ja L3
    je L1
    cmp eax, 0x10f00000
    je L1
    cmp eax, 0x11100000
    je L1
    cmp eax, 0x11200000
    je L1
    cmp eax, 0x11300000
    jmp L4
    cmp eax, 0x11500000
    je L1
    cmp eax, 0x20700000
    je L1
    cmp eax, 0x20800000
    jmp L4
    mov ecx, 0x73400000
    cmp eax, ecx
    ja L5
    je L1
    cmp eax, 0x73000000
    je L1
    cmp eax, 0x73100000
    je L1
    cmp eax, 0x73200000
    je L1
    cmp eax, 0x73300000
    jmp L4
    cmp eax, 0x73500000
    je L1
    cmp eax, 0x73600000
    je L1
    cmp eax, 0x73700000
    jmp L4
    mov ecx, 0x74100000
    cmp eax, ecx
    ja L6
    je L1
    mov ecx, 0x73d00000
    cmp eax, ecx
    ja L7
    je L1
    cmp eax, 0x73900000
    je L1
    cmp eax, 0x73a00000
    je L1
    cmp eax, 0x73b00000
    je L1
    cmp eax, 0x73c00000
    jmp L4
    cmp eax, 0x73e00000
    je L1
    cmp eax, 0x73f00000
    je L1
    cmp eax, 0x74000000
    jmp L4
    mov ecx, 0x74600000
    cmp eax, ecx
    ja L8
    je L1
    cmp eax, 0x74200000
    je L1
    cmp eax, 0x74300000
    je L1
    cmp eax, 0x74400000
    je L1
    cmp eax, 0x74500000
    jmp L4
    cmp eax, 0x74700000
    je L1
    cmp eax, 0x74a00000
    je L1
    cmp eax, 0x74b00000
    je L1
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
    }
}
