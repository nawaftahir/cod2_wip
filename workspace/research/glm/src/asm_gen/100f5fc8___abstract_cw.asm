; __abstract_cw @ 0x100f5fc8 — auto-synthesized
.CODE
__abstract_cw PROC
    xor eax, eax
    test bl, 1
    je L0
    push 0x10
    pop eax
    test bl, 4
    je L1
    or eax, 8
    test bl, 8
    je L2
    or eax, 4
    test bl, 0x10
    je L3
    or eax, 2
    test bl, 0x20
    je L4
    or eax, 1
    test bl, 2
    je L5
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
    je L6
    cmp ecx, 0x400
    je L7
    cmp ecx, 0x800
    je L8
    cmp ecx, esi
    jne L6
    or eax, edi
    jmp L6
    or eax, ebp
    jmp L6
    or eax, 0x100
    and edx, edi
    je L9
    cmp edx, ebp
    jne L10
    or eax, 0x10000
    jmp L10
    or eax, 0x20000
    test bh, 0x10
    pop edi
    pop esi
    pop ebp
    je L11
    or eax, 0x40000
    ret
__abstract_cw ENDP
END