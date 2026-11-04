.686
.MODEL FLAT, C
EXTRN sub_1010A99B:PROC
EXTRN sub_1010AB43:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_1019BC9C:DWORD
EXTRN g_1019BCA0:DWORD
EXTRN g_1019BD98:DWORD
.CODE
FUN_10059970 PROC
    fld dword ptr [g_1019BC84]
    sub esp, 8
    fld dword ptr [esi + 4]
    fucompp
    fnstsw ax
    test ah, 68
    jp L1
    fld dword ptr [g_1019BC84]
    fld dword ptr [esi]
    fucompp
    fnstsw ax
    test ah, 68
    jp L1
    fld dword ptr [esi + 8]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L0
    mov dword ptr [esp], 043870000h
    fld dword ptr [esp]
    add esp, 8
    ret
L0:
    mov dword ptr [esp], 042B40000h
    fld dword ptr [esp]
    add esp, 8
    ret
L1:
    mov eax, dword ptr [esi + 4]
    mov ecx, dword ptr [esi]
    mov dword ptr [esp], eax
    fld dword ptr [esp]
    mov dword ptr [esp + 4], ecx
    fmul dword ptr [esp]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    call sub_1010A99B
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    mov edx, dword ptr [esi + 8]
    fstp dword ptr [esp]
    mov dword ptr [esp + 4], edx
    fld dword ptr [esp + 4]
    fld dword ptr [esp]
    call sub_1010AB43
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [g_1019BCA0]
    fdiv dword ptr [g_1019BD98]
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 5
    jp L2
    fld dword ptr [esp]
    fadd dword ptr [g_1019BC9C]
    fstp dword ptr [esp]
L2:
    fld dword ptr [esp]
    add esp, 8
    ret
FUN_10059970 ENDP
END
