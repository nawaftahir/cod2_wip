; FUN_1005ac40 @ 0x1005ac40 — auto-synthesized
    EXTRN g_1019bc84:DWORD
.CODE
FUN_1005ac40 PROC
    sub esp, 0xc
    mov edx, dword ptr [ecx]
    fld dword ptr [g_1019bc84]
    mov dword ptr [eax], edx
    mov edx, dword ptr [ecx + 0xc]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [ecx + 0x18]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 0xc], edx
    mov edx, dword ptr [ecx + 0x10]
    mov dword ptr [eax + 0x10], edx
    mov edx, dword ptr [ecx + 0x1c]
    mov dword ptr [eax + 0x14], edx
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [eax + 0x18], edx
    mov edx, dword ptr [ecx + 0x14]
    mov dword ptr [eax + 0x1c], edx
    mov edx, dword ptr [ecx + 0x20]
    mov dword ptr [eax + 0x20], edx
    fsub dword ptr [ecx + 0x24]
    fstp dword ptr [esp]
    fld dword ptr [g_1019bc84]
    fsub dword ptr [ecx + 0x28]
    fstp dword ptr [esp + 4]
    fld dword ptr [g_1019bc84]
    fsub dword ptr [ecx + 0x2c]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 4]
    fmul dword ptr [eax + 0xc]
    fld dword ptr [esp + 8]
    fmul dword ptr [eax + 0x18]
    faddp st(1)
    fld dword ptr [esp]
    fmul dword ptr [eax]
    faddp st(1)
    fstp dword ptr [eax + 0x24]
    fld dword ptr [esp + 4]
    fmul dword ptr [eax + 0x10]
    fld dword ptr [esp + 8]
    fmul dword ptr [eax + 0x1c]
    faddp st(1)
    fld dword ptr [esp]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fstp dword ptr [eax + 0x28]
    fld dword ptr [esp + 8]
    fmul dword ptr [eax + 0x20]
    fld dword ptr [esp]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fld dword ptr [esp + 4]
    fmul dword ptr [eax + 0x14]
    faddp st(1)
    fstp dword ptr [eax + 0x2c]
    add esp, 0xc
    ret
FUN_1005ac40 ENDP
END