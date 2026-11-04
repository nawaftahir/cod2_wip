; FUN_1008552a @ 0x1008552a — auto-synthesized
.CODE
FUN_1008552a PROC
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    mov ecx, 0x74200000
    cmp eax, ecx
    ja L0
    je L1
    mov ecx, 0x11500000
    cmp eax, ecx
    ja L2
    je L1
    cmp eax, 0x11100000
    je L1
    cmp eax, 0x11200000
    je L1
    cmp eax, 0x11300000
    je L1
    cmp eax, 0x11400000
    jmp L3
    cmp eax, 0x20800000
    je L1
    cmp eax, 0x20900000
    je L1
    cmp eax, 0x74100000
    jmp L3
    cmp eax, 0x74300000
    je L1
    cmp eax, 0x74400000
    je L1
    cmp eax, 0x74500000
    je L1
    cmp eax, 0x74600000
    je L1
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
FUN_1008552a ENDP
END