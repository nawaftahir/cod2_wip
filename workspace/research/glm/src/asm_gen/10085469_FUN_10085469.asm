; FUN_10085469 @ 0x10085469 — auto-synthesized
.CODE
FUN_10085469 PROC
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    cmp eax, 0x20000000
    je L0
    cmp eax, 0x20100000
    je L0
    cmp eax, 0x20400000
    je L0
    cmp eax, 0x20500000
    je L0
    cmp eax, 0x50000000
    je L0
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
FUN_10085469 ENDP
END