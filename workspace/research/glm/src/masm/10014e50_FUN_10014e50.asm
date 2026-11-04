.686
.MODEL FLAT, C
EXTRN g_101D4D04:DWORD
EXTRN g_101D4D08:DWORD
EXTRN g_101D4D0C:DWORD
.CODE
FUN_10014e50 PROC
    sub esp, 32
    mov edx, dword ptr [ecx + 16]
    mov dword ptr [esp], edx
    fld dword ptr [esp]
    fmul dword ptr [esp]
    mov edx, dword ptr [eax + 16]
    mov dword ptr [esp], edx
    fstp dword ptr [esp + 12]
    fld dword ptr [esp]
    fmul dword ptr [esp]
    fstp dword ptr [esp + 16]
    fld dword ptr [g_101D4D04]
    fsub dword ptr [ecx + 4]
    fstp dword ptr [esp]
    fld dword ptr [g_101D4D08]
    fsub dword ptr [ecx + 8]
    fstp dword ptr [esp + 4]
    fld dword ptr [g_101D4D0C]
    fsub dword ptr [ecx + 12]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fld dword ptr [esp]
    fmul dword ptr [esp]
    faddp st(1)
    fstp dword ptr [esp]
    fld dword ptr [g_101D4D04]
    fsub dword ptr [eax + 4]
    fstp dword ptr [esp + 20]
    fld dword ptr [g_101D4D08]
    fsub dword ptr [eax + 8]
    fstp dword ptr [esp + 24]
    fld dword ptr [g_101D4D0C]
    fsub dword ptr [eax + 12]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 28]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 24]
    faddp st(1)
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 20]
    faddp st(1)
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 12]
    fld dword ptr [esp]
    fmul dword ptr [esp + 16]
    fcompp
    fnstsw ax
    test ah, 65
    jp L0
    mov eax, 1
    add esp, 32
    ret
L0:
    xor eax, eax
    add esp, 32
    ret
FUN_10014e50 ENDP
END
