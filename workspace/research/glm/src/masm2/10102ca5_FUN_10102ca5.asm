.686
.MODEL FLAT, C
EXTRN sub_10102D0F:PROC
EXTRN sub_10102D2C:PROC
EXTRN sub_10102D45:PROC
EXTRN EXTRN g_101A5210:DWORD:DWORD
EXTRN EXTRN g_101A521C:DWORD:DWORD
.CODE
FUN_10102ca5 PROC
    push push ecx
    push push ecx
    mov mov cl, byte ptr [esp + 12]
    test test cl, 1
    je L0
    fld fld xword ptr [g_101A5210]
    fistp fistp dword ptr [esp + 12]
    wait wait
    test test cl, 8
    je L1
    wait wait
    fnstsw fnstsw ax
    fld fld xword ptr [g_101A5210]
    fstp fstp qword ptr [esp]
    wait wait
    wait wait
    fnstsw fnstsw ax
    test test cl, 16
    je sub_10102D0F
    fld fld xword ptr [g_101A521C]
    fstp fstp qword ptr [esp]
    wait wait
    test test cl, 4
    je sub_10102D2C
    fldz fldz
    fld1 fld1
    fdivrp fdivrp st(1)
    fstp fstp st(0)
    wait wait
    test test cl, 32
    je sub_10102D45
    fldpi fldpi
    fstp fstp qword ptr [esp]
    wait wait
    pop pop ecx
    pop pop ecx
    ret ret
FUN_10102ca5 ENDP
END
