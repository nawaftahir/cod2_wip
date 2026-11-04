.686
.MODEL FLAT, C
EXTRN EXTRN g_1019BC78:DWORD:DWORD
.CODE
FUN_1001d660 PROC
    sub sub esp, 24
    fld fld dword ptr [eax + 28]
    fld fld st(0)
    fmul fmul dword ptr [eax]
    fld fld st(1)
    fmul fmul dword ptr [eax + 4]
    fstp fstp dword ptr [esp + 16]
    fxch fxch st(1)
    fmul fmul dword ptr [eax + 8]
    fstp fstp dword ptr [esp + 20]
    fld fld st(0)
    fmul fmul dword ptr [eax]
    fstp fstp dword ptr [esp + 8]
    fld fld st(0)
    fmul fmul dword ptr [eax + 4]
    fstp fstp dword ptr [esp]
    fld fld st(0)
    fmul fmul dword ptr [eax + 8]
    fstp fstp dword ptr [esp + 4]
    fmul fmul dword ptr [eax + 12]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [eax + 4]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [eax + 8]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [eax + 12]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [eax + 8]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [eax + 12]
    fld fld st(1)
    fadd fadd st(5)
    fsubr fsubr dword ptr [g_1019BC78]
    fstp fstp dword ptr [ecx]
    fld fld dword ptr [esp]
    fadd fadd st(1)
    fstp fstp dword ptr [ecx + 4]
    fld fld dword ptr [esp + 4]
    fsub fsub st(3)
    fstp fstp dword ptr [ecx + 8]
    fld fld dword ptr [esp]
    fsub fsub st(1)
    fstp fstp dword ptr [ecx + 12]
    fstp fstp st(0)
    fadd fadd dword ptr [esp + 8]
    fsubr fsubr dword ptr [g_1019BC78]
    fstp fstp dword ptr [ecx + 16]
    fld fld st(1)
    fadd fadd st(4)
    fstp fstp dword ptr [ecx + 20]
    fadd fadd dword ptr [esp + 4]
    fstp fstp dword ptr [ecx + 24]
    fsub fsub st(2)
    fstp fstp dword ptr [ecx + 28]
    fadd fadd dword ptr [esp + 8]
    fsubr fsubr dword ptr [g_1019BC78]
    fstp fstp dword ptr [ecx + 32]
    fstp fstp st(0)
    add add esp, 24
    ret ret
FUN_1001d660 ENDP
END
