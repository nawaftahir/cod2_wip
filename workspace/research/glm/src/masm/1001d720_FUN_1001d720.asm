.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
.CODE
FUN_1001d720 PROC
    sub esp, 24
    fld dword ptr [ecx + 28]
    xor edx, edx
    fld st(0)
    fmul dword ptr [ecx]
    fld st(1)
    fmul dword ptr [ecx + 4]
    fstp dword ptr [esp + 16]
    fxch st(1)
    fmul dword ptr [ecx + 8]
    fstp dword ptr [esp + 20]
    fld st(0)
    fmul dword ptr [ecx]
    fstp dword ptr [esp + 8]
    fld st(0)
    fmul dword ptr [ecx + 4]
    fstp dword ptr [esp]
    fld st(0)
    fmul dword ptr [ecx + 8]
    fstp dword ptr [esp + 4]
    fmul dword ptr [ecx + 12]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 4]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 8]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 12]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 8]
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx + 12]
    mov dword ptr [eax + 12], edx
    fld st(1)
    mov dword ptr [eax + 28], edx
    fadd st(5)
    mov dword ptr [eax + 44], edx
    fsubr dword ptr [g_1019BC78]
    fstp dword ptr [eax]
    fld dword ptr [esp]
    fadd st(1)
    fstp dword ptr [eax + 4]
    fld dword ptr [esp + 4]
    fsub st(3)
    fstp dword ptr [eax + 8]
    fld dword ptr [esp]
    fsub st(1)
    fstp dword ptr [eax + 16]
    fstp st(0)
    fadd dword ptr [esp + 8]
    fsubr dword ptr [g_1019BC78]
    fstp dword ptr [eax + 20]
    fld st(1)
    fadd st(4)
    fstp dword ptr [eax + 24]
    fadd dword ptr [esp + 4]
    fstp dword ptr [eax + 32]
    fsub st(2)
    fstp dword ptr [eax + 36]
    fadd dword ptr [esp + 8]
    fsubr dword ptr [g_1019BC78]
    fstp dword ptr [eax + 40]
    mov edx, dword ptr [ecx + 16]
    mov dword ptr [eax + 48], edx
    mov edx, dword ptr [ecx + 20]
    fstp st(0)
    mov dword ptr [eax + 52], edx
    mov ecx, dword ptr [ecx + 24]
    mov dword ptr [eax + 56], ecx
    mov dword ptr [eax + 60], 03F800000h
    add esp, 24
    ret
FUN_1001d720 ENDP
END
