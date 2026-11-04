; FUN_100855b0 @ 0x100855b0 — auto-synthesized
.CODE
FUN_100855b0 PROC
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    cmp eax, 0x73100000
    je L0
    cmp eax, 0x73300000
    je L0
    cmp eax, 0x73d00000
    je L0
    cmp eax, 0x73e00000
    je L0
    cmp eax, 0x73f00000
    je L0
    cmp eax, 0x74000000
    je L0
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
FUN_100855b0 ENDP
END