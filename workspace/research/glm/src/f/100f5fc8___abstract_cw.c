
__declspec(naked) void __abstract_cw(void)
{
    __asm {
    xor eax, eax
    test bl, 1
    je L12
    push 0x10
    pop eax
    test bl, 4
    je L12
    or eax, 8
    test bl, 8
    je L12
    or eax, 4
    test bl, 0x10
    je L12
    or eax, 2
    test bl, 0x20
    je L12
    or eax, 1
    test bl, 2
    je L12
    or eax, 0x80000
    push ebp
    movzx edx, bx
    push esi
    mov ecx, edx
    mov esi, 0xc00
    and ecx, esi
    push edi
    mov edi, 0x300
    mov ebp, 0x200
    je L12
    cmp ecx, 0x400
    je L12
    cmp ecx, 0x800
    je L12
    cmp ecx, esi
    jne L12
    or eax, edi
    jmp L12
    or eax, ebp
    jmp L12
    or eax, 0x100
    and edx, edi
    je L12
    cmp edx, ebp
    jne L12
    or eax, 0x10000
    jmp L12
    or eax, 0x20000
    test bh, 0x10
    pop edi
    pop esi
    pop ebp
    je L12
    or eax, 0x40000
    ret
    }
}
