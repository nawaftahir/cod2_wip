; FUN_1008576b @ 0x1008576b — auto-synthesized
.CODE
FUN_1008576b PROC
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    mov ecx, 0x60800000
    cmp eax, ecx
    ja L0
    je L1
    cmp eax, 0x10d00000
    je L1
    cmp eax, 0x10e00000
    je L1
    cmp eax, 0x60000000
    je L1
    cmp eax, 0x60200000
    je L1
    cmp eax, 0x60300000
    je L1
    cmp eax, 0x60500000
    je L1
    cmp eax, 0x60700000
    jmp L2
    cmp eax, 0x60a00000
    je L1
    cmp eax, 0x60c00000
    je L1
    cmp eax, 0x60d00000
    je L1
    cmp eax, 0x60f00000
    je L1
    cmp eax, 0x61100000
    je L1
    cmp eax, 0x61200000
    je L1
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
FUN_1008576b ENDP
END