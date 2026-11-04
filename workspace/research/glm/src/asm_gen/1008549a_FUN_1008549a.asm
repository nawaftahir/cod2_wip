; FUN_1008549a @ 0x1008549a — auto-synthesized
.CODE
FUN_1008549a PROC
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    cmp eax, 0x10000000
    je L0
    cmp eax, 0x10100000
    je L0
    cmp eax, 0x11200000
    je L0
    cmp eax, 0x20700000
    je L0
    cmp eax, 0x20800000
    je L0
    cmp eax, 0x20900000
    je L0
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
FUN_1008549a ENDP
END