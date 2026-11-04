.686
.MODEL FLAT, C
EXTRN EXTRN g_1019BC78:DWORD:DWORD
.CODE
FUN_1001d720 PROC
    sub sub esp, 24
    fld fld dword ptr [ecx + 28]
    xor xor edx, edx
    fld fld st(0)
    fmul fmul dword ptr [ecx]
    fld fld st(1)
    fmul fmul dword ptr [ecx + 4]
    fstp fstp dword ptr [esp + 16]
    fxch fxch st(1)
    fmul fmul dword ptr [ecx + 8]
    fstp fstp dword ptr [esp + 20]
    fld fld st(0)
    fmul fmul dword ptr [ecx]
    fstp fstp dword ptr [esp + 8]
    fld fld st(0)
    fmul fmul dword ptr [ecx + 4]
    fstp fstp dword ptr [esp]
    fld fld st(0)
    fmul fmul dword ptr [ecx + 8]
    fstp fstp dword ptr [esp + 4]
    fmul fmul dword ptr [ecx + 12]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [ecx + 4]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [ecx + 8]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [ecx + 12]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [ecx + 8]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [ecx + 12]
    mov mov dword ptr [eax + 12], edx
    fld fld st(1)
    mov mov dword ptr [eax + 28], edx
    fadd fadd st(5)
    mov mov dword ptr [eax + 44], edx
    fsubr fsubr dword ptr [g_1019BC78]
    fstp fstp dword ptr [eax]
    fld fld dword ptr [esp]
    fadd fadd st(1)
    fstp fstp dword ptr [eax + 4]
    fld fld dword ptr [esp + 4]
    fsub fsub st(3)
    fstp fstp dword ptr [eax + 8]
    fld fld dword ptr [esp]
    fsub fsub st(1)
    fstp fstp dword ptr [eax + 16]
    fstp fstp st(0)
    fadd fadd dword ptr [esp + 8]
    fsubr fsubr dword ptr [g_1019BC78]
    fstp fstp dword ptr [eax + 20]
    fld fld st(1)
    fadd fadd st(4)
    fstp fstp dword ptr [eax + 24]
    fadd fadd dword ptr [esp + 4]
    fstp fstp dword ptr [eax + 32]
    fsub fsub st(2)
    fstp fstp dword ptr [eax + 36]
    fadd fadd dword ptr [esp + 8]
    fsubr fsubr dword ptr [g_1019BC78]
    fstp fstp dword ptr [eax + 40]
    mov mov edx, dword ptr [ecx + 16]
    mov mov dword ptr [eax + 48], edx
    mov mov edx, dword ptr [ecx + 20]
    fstp fstp st(0)
    mov mov dword ptr [eax + 52], edx
    mov mov ecx, dword ptr [ecx + 24]
    mov mov dword ptr [eax + 56], ecx
    mov mov dword ptr [eax + 60], 03F800000h
    add add esp, 24
    ret ret
FUN_1001d720 ENDP
END
