.686
.MODEL FLAT, C
EXTRN sub_1002C4C4:PROC
EXTRN sub_1002C4F2:PROC
EXTRN sub_100F8D9A:PROC
EXTRN sub_100F8E22:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BC88:DWORD:DWORD
EXTRN EXTRN g_1019BEB0:DWORD:DWORD
EXTRN EXTRN g_1019BEB8:DWORD:DWORD
.CODE
FUN_1002c370 PROC
    sub sub esp, 16
    fld fld dword ptr [esp + 28]
    fabs fabs
    fst fst dword ptr [esp + 28]
    call sub_100F8E22
    fst fst qword ptr [esp + 8]
    fsin fsin
    fld fld dword ptr [esp + 20]
    fdiv fdiv dword ptr [esp + 24]
    fmulp fmulp st(1)
    fcom fcom qword ptr [g_1019BC88]
    fst fst qword ptr [esp]
    fnstsw fnstsw ax
    test test ah, 65
    jne L0
    fstp fstp st(0)
    fld fld qword ptr [g_1019BC88]
    jmp L1
    fcomp fcomp qword ptr [g_1019BEB8]
    fnstsw fnstsw ax
    test test ah, 5
    jp L2
    fld fld qword ptr [g_1019BEB8]
    fstp fstp qword ptr [esp]
    fld fld qword ptr [esp]
    call sub_100F8D9A
    fld fld qword ptr [esp + 8]
    fadd fadd st(1)
    fstp fstp qword ptr [esp]
    fsubr fsubr qword ptr [esp + 8]
    fld fld st(0)
    fsin fsin
    fld fld qword ptr [esp]
L0:
    fsin fsin
    fdivp fdivp st(1)
    fxch fxch st(1)
    fptan fptan
    fstp fstp st(0)
    fld fld qword ptr [esp]
    fptan fptan
    fstp fstp st(0)
    fdivp fdivp st(1)
    fld fld st(0)
    fmul fmul st(1)
    fld fld st(2)
    fmul fmul st(3)
    faddp faddp st(1)
L1:
    fmul fmul qword ptr [g_1019BEB0]
    fxch fxch st(2)
    fstp fstp st(1)
    fstp fstp st(0)
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_1002C4C4
    fstp fstp st(0)
    fld fld dword ptr [g_1019BC84]
    add add esp, 16
    ret ret
    fcom fcom dword ptr [g_1019BC78]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1002C4F2
    fstp fstp st(0)
    fld fld dword ptr [g_1019BC78]
    add add esp, 16
    ret ret
FUN_1002c370 ENDP
END
