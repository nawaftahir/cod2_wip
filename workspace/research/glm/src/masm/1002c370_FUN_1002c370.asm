.686
.MODEL FLAT, C
EXTRN sub_100F8D9A:PROC
EXTRN sub_100F8E22:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BC88:DWORD
EXTRN g_1019BEB0:DWORD
EXTRN g_1019BEB8:DWORD
.CODE
FUN_1002c370 PROC
    sub esp, 16
    fld dword ptr [esp + 28]
    fabs
    fst dword ptr [esp + 28]
    call sub_100F8E22
    fst qword ptr [esp + 8]
    fsin
    fld dword ptr [esp + 20]
    fdiv dword ptr [esp + 24]
    fmulp st(1)
    fcom qword ptr [g_1019BC88]
    fst qword ptr [esp]
    fnstsw ax
    test ah, 65
    jne L0
    fstp st(0)
    fld qword ptr [g_1019BC88]
    jmp L1
L0:
    fcomp qword ptr [g_1019BEB8]
    fnstsw ax
    test ah, 5
    jp L2
    fld qword ptr [g_1019BEB8]
L1:
    fstp qword ptr [esp]
L2:
    fld qword ptr [esp]
    call sub_100F8D9A
    fld qword ptr [esp + 8]
    fadd st(1)
    fstp qword ptr [esp]
    fsubr qword ptr [esp + 8]
    fld st(0)
    fsin
    fld qword ptr [esp]
    fsin
    fdivp st(1)
    fxch st(1)
    fptan
    fstp st(0)
    fld qword ptr [esp]
    fptan
    fstp st(0)
    fdivp st(1)
    fld st(0)
    fmul st(1)
    fld st(2)
    fmul st(3)
    faddp st(1)
    fmul qword ptr [g_1019BEB0]
    fxch st(2)
    fstp st(1)
    fstp st(0)
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 5
    jp L3
    fstp st(0)
    fld dword ptr [g_1019BC84]
    add esp, 16
    ret
L3:
    fcom dword ptr [g_1019BC78]
    fnstsw ax
    test ah, 65
    jne L4
    fstp st(0)
    fld dword ptr [g_1019BC78]
L4:
    add esp, 16
    ret
FUN_1002c370 ENDP
END
