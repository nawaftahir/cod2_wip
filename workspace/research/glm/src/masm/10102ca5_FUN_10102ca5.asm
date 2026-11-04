.686
.MODEL FLAT, C
EXTRN g_101A5210:DWORD
EXTRN g_101A521C:DWORD
.CODE
FUN_10102ca5 PROC
    push ecx
    push ecx
    mov cl, byte ptr [esp + 12]
    test cl, 1
    je L0
    fld xword ptr [g_101A5210]
    fistp dword ptr [esp + 12]
    wait
L0:
    test cl, 8
    je L1
    wait
    fnstsw ax
    fld xword ptr [g_101A5210]
    fstp qword ptr [esp]
    wait
    wait
    fnstsw ax
L1:
    test cl, 16
    je L2
    fld xword ptr [g_101A521C]
    fstp qword ptr [esp]
    wait
L2:
    test cl, 4
    je L3
    fldz
    fld1
    fdivrp st(1)
    fstp st(0)
    wait
L3:
    test cl, 32
    je L4
    fldpi
    fstp qword ptr [esp]
    wait
L4:
    pop ecx
    pop ecx
    ret
FUN_10102ca5 ENDP
END
