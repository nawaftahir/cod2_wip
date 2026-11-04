.686
.MODEL FLAT, C
EXTRN sub_10059AFC:PROC
EXTRN sub_1010A99B:PROC
EXTRN sub_1010AB43:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BC9C:DWORD:DWORD
EXTRN EXTRN g_1019BCA0:DWORD:DWORD
EXTRN EXTRN g_1019BD98:DWORD:DWORD
.CODE
FUN_10059970 PROC
    fld fld dword ptr [g_1019BC84]
    sub sub esp, 8
    fld fld dword ptr [esi + 4]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L0
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [esi]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L1
    fld fld dword ptr [esi + 8]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne L2
    mov mov dword ptr [esp], 043870000h
    fld fld dword ptr [esp]
    add add esp, 8
    ret ret
    mov mov dword ptr [esp], 042B40000h
    fld fld dword ptr [esp]
    add add esp, 8
    ret ret
    mov mov eax, dword ptr [esi + 4]
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [esp], eax
    fld fld dword ptr [esp]
    mov mov dword ptr [esp + 4], ecx
    fmul fmul dword ptr [esp]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 4]
    call sub_1010A99B
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 4]
    mov mov edx, dword ptr [esi + 8]
    fstp fstp dword ptr [esp]
    mov mov dword ptr [esp + 4], edx
    fld fld dword ptr [esp + 4]
    fld fld dword ptr [esp]
    call sub_1010AB43
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [g_1019BCA0]
    fdiv fdiv dword ptr [g_1019BD98]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10059AFC
    fld fld dword ptr [esp]
    fadd fadd dword ptr [g_1019BC9C]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    add add esp, 8
    ret ret
FUN_10059970 ENDP
END
