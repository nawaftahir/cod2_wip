.686
.MODEL FLAT, C
EXTRN g_1019BC84:DWORD
.CODE
FUN_1005a0b0 PROC
    sub esp, 32
    fld dword ptr [eax]
    fsub dword ptr [ecx]
    fstp dword ptr [esp + 8]
    fld dword ptr [eax + 4]
    fsub dword ptr [ecx + 4]
    fstp dword ptr [esp + 12]
    fld dword ptr [eax + 8]
    fsub dword ptr [ecx + 8]
    fstp dword ptr [esp + 16]
    fld dword ptr [esi]
    fsub dword ptr [ecx]
    fstp dword ptr [esp + 20]
    fld dword ptr [esi + 4]
    fsub dword ptr [ecx + 4]
    fstp dword ptr [esp + 24]
    fld dword ptr [esi + 8]
    fsub dword ptr [ecx + 8]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 16]
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 16]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fstp dword ptr [esp]
    fld dword ptr [g_1019BC84]
    fld dword ptr [esp]
    fucompp
    fnstsw ax
    test ah, 68
    jp L0
    mov eax, dword ptr [ecx]
    mov dword ptr [edx], eax
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [edx + 4], eax
    mov ecx, dword ptr [ecx + 8]
    mov dword ptr [edx + 8], ecx
    add esp, 32
    ret
L0:
    fld dword ptr [esp + 4]
    fdiv dword ptr [esp]
    fstp dword ptr [esp]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp]
    fadd dword ptr [ecx]
    fstp dword ptr [edx]
    fld dword ptr [esp]
    fmul dword ptr [esp + 12]
    fadd dword ptr [ecx + 4]
    fstp dword ptr [edx + 4]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp]
    fadd dword ptr [ecx + 8]
    fstp dword ptr [edx + 8]
    add esp, 32
    ret
FUN_1005a0b0 ENDP
END
