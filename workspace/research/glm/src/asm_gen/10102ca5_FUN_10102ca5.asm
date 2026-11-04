; FUN_10102ca5 @ 0x10102ca5 — auto-synthesized
    EXTRN g_101a5210:DWORD
    EXTRN g_101a521c:DWORD
.CODE
FUN_10102ca5 PROC
    push ecx
    push ecx
    mov cl, byte ptr [esp + 0xc]
    test cl, 1
    je L0
    fld xword ptr [g_101a5210]
    fistp dword ptr [esp + 0xc]
    wait
    test cl, 8
    je L1
    wait
    fnstsw ax
    fld xword ptr [g_101a5210]
    fstp qword ptr [esp]
    wait
    wait
    fnstsw ax
    test cl, 0x10
    je L2
    fld xword ptr [g_101a521c]
    fstp qword ptr [esp]
    wait
    test cl, 4
    je L3
    fldz
    fld1
    fdivrp st(1)
    fstp st(0)
    wait
    test cl, 0x20
    je L4
    fldpi
    fstp qword ptr [esp]
    wait
    pop ecx
    pop ecx
    ret
FUN_10102ca5 ENDP
END