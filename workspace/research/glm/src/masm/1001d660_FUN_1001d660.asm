.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
.CODE
FUN_1001d660 PROC
    sub esp, 24
    fld dword ptr [eax + 28]
    fld st(0)
    fmul dword ptr [eax]
    fld st(1)
    fmul dword ptr [eax + 4]
    fstp dword ptr [esp + 16]
    fxch st(1)
    fmul dword ptr [eax + 8]
    fstp dword ptr [esp + 20]
    fld st(0)
    fmul dword ptr [eax]
    fstp dword ptr [esp + 8]
    fld st(0)
    fmul dword ptr [eax + 4]
    fstp dword ptr [esp]
    fld st(0)
    fmul dword ptr [eax + 8]
    fstp dword ptr [esp + 4]
    fmul dword ptr [eax + 12]
    fld dword ptr [esp + 16]
    fmul dword ptr [eax + 4]
    fld dword ptr [esp + 16]
    fmul dword ptr [eax + 8]
    fld dword ptr [esp + 16]
    fmul dword ptr [eax + 12]
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 8]
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 12]
    fld st(1)
    fadd st(5)
    fsubr dword ptr [g_1019BC78]
    fstp dword ptr [ecx]
    fld dword ptr [esp]
    fadd st(1)
    fstp dword ptr [ecx + 4]
    fld dword ptr [esp + 4]
    fsub st(3)
    fstp dword ptr [ecx + 8]
    fld dword ptr [esp]
    fsub st(1)
    fstp dword ptr [ecx + 12]
    fstp st(0)
    fadd dword ptr [esp + 8]
    fsubr dword ptr [g_1019BC78]
    fstp dword ptr [ecx + 16]
    fld st(1)
    fadd st(4)
    fstp dword ptr [ecx + 20]
    fadd dword ptr [esp + 4]
    fstp dword ptr [ecx + 24]
    fsub st(2)
    fstp dword ptr [ecx + 28]
    fadd dword ptr [esp + 8]
    fsubr dword ptr [g_1019BC78]
    fstp dword ptr [ecx + 32]
    fstp st(0)
    add esp, 24
    ret
FUN_1001d660 ENDP
END
