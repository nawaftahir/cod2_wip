; FUN_100854d2 @ 0x100854d2 — auto-synthesized
.CODE
FUN_100854d2 PROC
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    mov ecx, 0x70700000
    cmp eax, ecx
    ja L0
    je L1
    cmp eax, 0x50300000
    je L1
    cmp eax, 0x70100000
    je L1
    cmp eax, 0x70200000
    je L1
    cmp eax, 0x70500000
    je L1
    cmp eax, 0x70600000
    jmp L2
    cmp eax, 0x70b00000
    je L1
    cmp eax, 0x70c00000
    je L1
    cmp eax, 0x70d00000
    je L1
    cmp eax, 0x71000000
    je L1
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
FUN_100854d2 ENDP
END