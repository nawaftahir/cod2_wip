; FUN_10020790 @ 0x10020790 — auto-synthesized
    EXTRN g_1019bc78:DWORD
.CODE
FUN_10020790 PROC
    push ecx
    xor eax, eax
    mov ecx, dword ptr [eax + 0x10190398]
    dec ecx
    mov dword ptr [esp], ecx
    fild dword ptr [esp]
    add eax, 4
    cmp eax, 0xc
    fld dword ptr [eax + 0x101da988]
    fsub dword ptr [eax + 0x101da97c]
    fdivp st(1)
    fst dword ptr [eax + 0x101da994]
    fld dword ptr [g_1019bc78]
    fdiv st(1)
    fstp dword ptr [eax + 0x101da9a0]
    fstp st(0)
    fld dword ptr [eax + 0x101da994]
    fmul dword ptr [eax + 0x101da97c]
    fchs
    fstp dword ptr [eax + 0x101da9ac]
    jne L0
    pop ecx
    ret
FUN_10020790 ENDP
END