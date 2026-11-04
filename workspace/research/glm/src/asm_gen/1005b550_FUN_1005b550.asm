; FUN_1005b550 @ 0x1005b550 — auto-synthesized
    EXTRN g_1019bd8c:DWORD
.CODE
FUN_1005b550 PROC
    sub esp, 0x10
    fld dword ptr [esp + 0x14]
    lea eax, [esp]
    fmul dword ptr [g_1019bd8c]
    lea ecx, [esp + 0x14]
    mov dword ptr [esp + 8], eax
    mov dword ptr [esp + 4], ecx
    fstp dword ptr [esp + 0xc]
    push eax
    push ecx
    fld dword ptr [esp + 0x14]
    fsincos
    mov ecx, dword ptr [esp + 0x10]
    mov eax, dword ptr [esp + 0xc]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [esp]
    fmul dword ptr [edx]
    fld dword ptr [esp + 0x14]
    fmul dword ptr [edx + 4]
    fsubp st(1)
    fstp dword ptr [esp + 0xc]
    mov eax, dword ptr [esp + 0xc]
    fld dword ptr [esp + 0x14]
    fmul dword ptr [edx]
    mov dword ptr [edx], eax
    fld dword ptr [esp]
    fmul dword ptr [edx + 4]
    faddp st(1)
    fstp dword ptr [edx + 4]
    add esp, 0x10
    ret
FUN_1005b550 ENDP
END