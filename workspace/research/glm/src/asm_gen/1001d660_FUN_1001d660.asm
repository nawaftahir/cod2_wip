; FUN_1001d660 @ 0x1001d660 — auto-synthesized
    EXTRN g_1019bc78:DWORD
.CODE
FUN_1001d660 PROC
    sub esp, 0x18
    fld dword ptr [eax + 0x1c]
    fld st(0)
    fmul dword ptr [eax]
    fld st(1)
    fmul dword ptr [eax + 4]
    fstp dword ptr [esp + 0x10]
    fxch st(1)
    fmul dword ptr [eax + 8]
    fstp dword ptr [esp + 0x14]
    fld st(0)
    fmul dword ptr [eax]
    fstp dword ptr [esp + 8]
    fld st(0)
    fmul dword ptr [eax + 4]
    fstp dword ptr [esp]
    fld st(0)
    fmul dword ptr [eax + 8]
    fstp dword ptr [esp + 4]
    fmul dword ptr [eax + 0xc]
    fld dword ptr [esp + 0x10]
    fmul dword ptr [eax + 4]
    fld dword ptr [esp + 0x10]
    fmul dword ptr [eax + 8]
    fld dword ptr [esp + 0x10]
    fmul dword ptr [eax + 0xc]
    fld dword ptr [esp + 0x14]
    fmul dword ptr [eax + 8]
    fld dword ptr [esp + 0x14]
    fmul dword ptr [eax + 0xc]
    fld st(1)
    fadd st(5)
    fsubr dword ptr [g_1019bc78]
    fstp dword ptr [ecx]
    fld dword ptr [esp]
    fadd st(1)
    fstp dword ptr [ecx + 4]
    fld dword ptr [esp + 4]
    fsub st(3)
    fstp dword ptr [ecx + 8]
    fld dword ptr [esp]
    fsub st(1)
    fstp dword ptr [ecx + 0xc]
    fstp st(0)
    fadd dword ptr [esp + 8]
    fsubr dword ptr [g_1019bc78]
    fstp dword ptr [ecx + 0x10]
    fld st(1)
    fadd st(4)
    fstp dword ptr [ecx + 0x14]
    fadd dword ptr [esp + 4]
    fstp dword ptr [ecx + 0x18]
    fsub st(2)
    fstp dword ptr [ecx + 0x1c]
    fadd dword ptr [esp + 8]
    fsubr dword ptr [g_1019bc78]
    fstp dword ptr [ecx + 0x20]
    fstp st(0)
    add esp, 0x18
    ret
FUN_1001d660 ENDP
END