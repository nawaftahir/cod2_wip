; FUN_1008543f @ 0x1008543f — auto-synthesized
.CODE
FUN_1008543f PROC
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    cmp eax, 0x10300000
    je L0
    cmp eax, 0x10500000
    je L0
    cmp eax, 0x10600000
    je L0
    cmp eax, 0x10700000
    je L0
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
FUN_1008543f ENDP
END