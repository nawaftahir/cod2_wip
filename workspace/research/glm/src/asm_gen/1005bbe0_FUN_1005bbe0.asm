; FUN_1005bbe0 @ 0x1005bbe0 — auto-synthesized
    EXTRN g_1019bcb0:DWORD
    EXTRN g_1019bd8c:DWORD
    EXTRN g_1019bdcc:DWORD
    EXTRN g_1019bdd0:DWORD
    EXTRN g_1019bdd4:DWORD
    sub_1010aa07 PROTO C
    sub_1010aa32 PROTO C
.CODE
FUN_1005bbe0 PROC
    fld dword ptr [esp + 4]
    push edi
    fmul dword ptr [g_1019bcb0]
    xor eax, eax
    mov ecx, 0x10
    mov edi, esi
    fsubr dword ptr [g_1019bdd4]
    rep stosd dword ptr es:[edi], eax
    fmul dword ptr [g_1019bd8c]
    call sub_1010aa07
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fmul dword ptr [g_1019bdd0]
    fstp dword ptr [esi]
    fld dword ptr [esp + 0xc]
    fmul dword ptr [g_1019bcb0]
    fsubr dword ptr [g_1019bdd4]
    fmul dword ptr [g_1019bd8c]
    call sub_1010aa32
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    mov dword ptr [esi + 0x28], 0x3f7fdf40
    fmul dword ptr [g_1019bdd0]
    mov dword ptr [esi + 0x2c], 0x3f800000
    pop edi
    fstp dword ptr [esi + 0x14]
    fld dword ptr [esp + 0xc]
    fmul dword ptr [g_1019bdcc]
    fstp dword ptr [esi + 0x38]
    ret
FUN_1005bbe0 ENDP
END