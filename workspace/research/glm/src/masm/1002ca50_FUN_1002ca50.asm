.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
EXTRN g_1019BDE4:DWORD
EXTRN g_1019BEA0:DWORD
EXTRN g_1019BEA8:DWORD
.CODE
FUN_1002ca50 PROC
    push ecx
    mov eax, dword ptr [edx + 12]
    cmp eax, dword ptr [ecx + 12]
    jne L0
    mov eax, dword ptr [edx + 16]
    cmp eax, dword ptr [ecx + 16]
    jne L0
    fld dword ptr [ecx + 20]
    fld dword ptr [edx + 20]
    fucompp
    fnstsw ax
    test ah, 68
    jp L0
    fld dword ptr [ecx + 24]
    fld dword ptr [edx + 24]
    fucompp
    fnstsw ax
    test ah, 68
    jp L0
    fld dword ptr [edx + 44]
    fsub dword ptr [ecx + 44]
    fabs
    fcomp dword ptr [g_1019BDE4]
    fnstsw ax
    test ah, 65
    je L0
    fld dword ptr [edx + 28]
    fsub dword ptr [ecx + 28]
    fabs
    fcomp qword ptr [g_1019BEA8]
    fnstsw ax
    test ah, 65
    je L0
    fld dword ptr [edx + 32]
    fsub dword ptr [ecx + 32]
    fabs
    fcomp qword ptr [g_1019BEA8]
    fnstsw ax
    test ah, 65
    je L0
    fld dword ptr [edx + 40]
    fld dword ptr [edx + 36]
    fld dword ptr [ecx + 40]
    fld dword ptr [ecx + 36]
    fld dword ptr [edx + 40]
    fmul dword ptr [ecx + 40]
    fld dword ptr [ecx + 36]
    fmul dword ptr [edx + 36]
    faddp st(1)
    fld st(1)
    fmul st(2)
    fld st(3)
    fmul st(4)
    faddp st(1)
    fld st(4)
    fmul st(5)
    fld st(6)
    fmul st(7)
    faddp st(1)
    fmulp st(1)
    fsqrt
    fst dword ptr [esp]
    fadd qword ptr [g_1019BEA0]
    fst dword ptr [esp]
    fdivp st(1)
    fsub dword ptr [g_1019BC78]
    fabs
    fstp dword ptr [esp]
    fstp st(0)
    fstp st(0)
    fstp st(0)
    fstp st(0)
    fld dword ptr [esp]
    fcomp dword ptr [g_1019BDE4]
    fnstsw ax
    test ah, 65
    je L0
    mov eax, 1
    pop ecx
    ret
L0:
    xor eax, eax
    pop ecx
    ret
FUN_1002ca50 ENDP
END
