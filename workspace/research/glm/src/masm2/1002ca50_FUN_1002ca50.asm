.686
.MODEL FLAT, C
EXTRN sub_1002CB49:PROC
EXTRN sub_1002CB55:PROC
EXTRN sub_1002CB68:PROC
EXTRN sub_1002CB7B:PROC
EXTRN sub_1002CB94:PROC
EXTRN sub_1002CBA9:PROC
EXTRN sub_1002CBBE:PROC
EXTRN sub_1002CC21:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BDE4:DWORD:DWORD
EXTRN EXTRN g_1019BEA0:DWORD:DWORD
EXTRN EXTRN g_1019BEA8:DWORD:DWORD
.CODE
FUN_1002ca50 PROC
    push push ecx
    mov mov eax, dword ptr [edx + 12]
    cmp cmp eax, dword ptr [ecx + 12]
    jne sub_1002CB49
    mov mov eax, dword ptr [edx + 16]
    cmp cmp eax, dword ptr [ecx + 16]
    jne sub_1002CB55
    fld fld dword ptr [ecx + 20]
    fld fld dword ptr [edx + 20]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_1002CB68
    fld fld dword ptr [ecx + 24]
    fld fld dword ptr [edx + 24]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_1002CB7B
    fld fld dword ptr [edx + 44]
    fsub fsub dword ptr [ecx + 44]
    fabs fabs
    fcomp fcomp dword ptr [g_1019BDE4]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_1002CB94
    fld fld dword ptr [edx + 28]
    fsub fsub dword ptr [ecx + 28]
    fabs fabs
    fcomp fcomp qword ptr [g_1019BEA8]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_1002CBA9
    fld fld dword ptr [edx + 32]
    fsub fsub dword ptr [ecx + 32]
    fabs fabs
    fcomp fcomp qword ptr [g_1019BEA8]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_1002CBBE
    fld fld dword ptr [edx + 40]
    fld fld dword ptr [edx + 36]
    fld fld dword ptr [ecx + 40]
    fld fld dword ptr [ecx + 36]
    fld fld dword ptr [edx + 40]
    fmul fmul dword ptr [ecx + 40]
    fld fld dword ptr [ecx + 36]
    fmul fmul dword ptr [edx + 36]
    faddp faddp st(1)
    fld fld st(1)
    fmul fmul st(2)
    fld fld st(3)
    fmul fmul st(4)
    faddp faddp st(1)
    fld fld st(4)
    fmul fmul st(5)
    fld fld st(6)
    fmul fmul st(7)
    faddp faddp st(1)
    fmulp fmulp st(1)
    fsqrt fsqrt
    fst fst dword ptr [esp]
    fadd fadd qword ptr [g_1019BEA0]
    fst fst dword ptr [esp]
    fdivp fdivp st(1)
    fsub fsub dword ptr [g_1019BC78]
    fabs fabs
    fstp fstp dword ptr [esp]
    fstp fstp st(0)
    fstp fstp st(0)
    fstp fstp st(0)
    fstp fstp st(0)
    fld fld dword ptr [esp]
    fcomp fcomp dword ptr [g_1019BDE4]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_1002CC21
    mov mov eax, 1
    pop pop ecx
    ret ret
    xor xor eax, eax
    pop pop ecx
    ret ret
FUN_1002ca50 ENDP
END
