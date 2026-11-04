; FUN_100639c9 @ 0x100639c9 — auto-synthesized
    EXTRN fp_1010c038:DWORD
    EXTRN fp_1010c03c:DWORD
    EXTRN fp_1010c080:DWORD
    EXTRN fp_1010c0e0:DWORD
    EXTRN g_1010c0e4:DWORD
    EXTRN g_101abd70:DWORD
.CODE
FUN_100639c9 PROC
    mov edi, edi
    push ebx
    push esi
    push edi
    push 0x101abd58
    call dword ptr [fp_1010c03c]
    mov edi, dword ptr [g_1010c0e4]
    xor ebx, ebx
    inc ebx
    mov esi, 0x101abd74
    jmp L0
    push ebx
    call dword ptr [fp_1010c0e0]
    push 0
    push ebx
    push esi
    call edi
    cmp eax, ebx
    je L1
    sub dword ptr [g_101abd70], ebx
    jne L2
    push 0x101abd58
    call dword ptr [fp_1010c038]
    push 0
    push esi
    call dword ptr [fp_1010c080]
    pop edi
    pop esi
    pop ebx
    ret
FUN_100639c9 ENDP
END