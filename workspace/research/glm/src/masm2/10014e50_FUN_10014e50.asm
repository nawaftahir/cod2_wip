.686
.MODEL FLAT, C
EXTRN sub_10014FE3:PROC
EXTRN EXTRN g_101D4D04:DWORD:DWORD
EXTRN EXTRN g_101D4D08:DWORD:DWORD
EXTRN EXTRN g_101D4D0C:DWORD:DWORD
.CODE
FUN_10014e50 PROC
    sub sub esp, 32
    mov mov edx, dword ptr [ecx + 16]
    mov mov dword ptr [esp], edx
    fld fld dword ptr [esp]
    fmul fmul dword ptr [esp]
    mov mov edx, dword ptr [eax + 16]
    mov mov dword ptr [esp], edx
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [esp]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [g_101D4D04]
    fsub fsub dword ptr [ecx + 4]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [g_101D4D08]
    fsub fsub dword ptr [ecx + 8]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [g_101D4D0C]
    fsub fsub dword ptr [ecx + 12]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 8]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp]
    fmul fmul dword ptr [esp]
    faddp faddp st(1)
    fstp fstp dword ptr [esp]
    fld fld dword ptr [g_101D4D04]
    fsub fsub dword ptr [eax + 4]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [g_101D4D08]
    fsub fsub dword ptr [eax + 8]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [g_101D4D0C]
    fsub fsub dword ptr [eax + 12]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 28]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 24]
    faddp faddp st(1)
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 20]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esp + 12]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [esp + 16]
    fcompp fcompp
    fnstsw fnstsw ax
    test test ah, 65
    jp sub_10014FE3
    mov mov eax, 1
    add add esp, 32
    ret ret
    xor xor eax, eax
    add add esp, 32
    ret ret
FUN_10014e50 ENDP
END
