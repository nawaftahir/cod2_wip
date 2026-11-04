
__declspec(naked) void __hw_cw(void)
{
    __asm {
    xor eax, eax
    test bl, 0x10
    je L12
    inc eax
    test bl, 8
    je L12
    or eax, 4
    test bl, 4
    je L12
    or eax, 8
    test bl, 2
    je L12
    or eax, 0x10
    test bl, 1
    je L12
    or eax, 0x20
    test ebx, 0x80000
    je L12
    or eax, 2
    mov ecx, ebx
    mov edx, 0x300
    and ecx, edx
    push esi
    mov esi, 0x200
    je L12
    cmp ecx, 0x100
    je L12
    cmp ecx, esi
    je L12
    cmp ecx, edx
    jne L12
    or eax, 0xc00
    jmp L12
    or eax, 0x800
    jmp L12
    or eax, 0x400
    mov ecx, ebx
    and ecx, 0x30000
    je L12
    cmp ecx, 0x10000
    jne L12
    or eax, esi
    jmp L12
    or eax, edx
    test ebx, 0x40000
    pop esi
    je L12
    or eax, 0x1000
    ret
    }
}
