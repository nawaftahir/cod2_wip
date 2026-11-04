; FUN_100855e8 @ 0x100855e8 — auto-synthesized
.CODE
FUN_100855e8 PROC
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    cmp eax, 0x20700000
    je L0
    cmp eax, 0x73400000
    je L0
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
FUN_100855e8 ENDP
END