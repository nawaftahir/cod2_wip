; FUN_10063974 @ 0x10063974 — auto-synthesized
    EXTRN fp_1010c030:DWORD
    EXTRN fp_1010c034:DWORD
    EXTRN fp_1010c080:DWORD
    EXTRN fp_1010c0e0:DWORD
    EXTRN g_1010c0e4:DWORD
    EXTRN g_101abd70:DWORD
.CODE
FUN_10063974 PROC
    mov edi, edi
    push ebx
    push esi
    xor ebx, ebx
    push edi
    mov edi, dword ptr [g_1010c0e4]
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
    cmp dword ptr [g_101abd70], 0
    mov edi, 0x101abd58
    jne L2
    push edi
    call dword ptr [fp_1010c034]
    add dword ptr [g_101abd70], ebx
    push 0
    push esi
    call dword ptr [fp_1010c080]
    push edi
    call dword ptr [fp_1010c030]
    pop edi
    pop esi
    pop ebx
    ret
FUN_10063974 ENDP
END