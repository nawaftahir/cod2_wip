; __hw_cw @ 0x100f605a — auto-synthesized
.CODE
__hw_cw PROC
    xor eax, eax
    test bl, 0x10
    je L0
    inc eax
    test bl, 8
    je L1
    or eax, 4
    test bl, 4
    je L2
    or eax, 8
    test bl, 2
    je L3
    or eax, 0x10
    test bl, 1
    je L4
    or eax, 0x20
    test ebx, 0x80000
    je L5
    or eax, 2
    mov ecx, ebx
    mov edx, 0x300
    and ecx, edx
    push esi
    mov esi, 0x200
    je L6
    cmp ecx, 0x100
    je L7
    cmp ecx, esi
    je L8
    cmp ecx, edx
    jne L6
    or eax, 0xc00
    jmp L6
    or eax, 0x800
    jmp L6
    or eax, 0x400
    mov ecx, ebx
    and ecx, 0x30000
    je L9
    cmp ecx, 0x10000
    jne L10
    or eax, esi
    jmp L10
    or eax, edx
    test ebx, 0x40000
    pop esi
    je L11
    or eax, 0x1000
    ret
__hw_cw ENDP
END