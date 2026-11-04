.686
.MODEL FLAT, C
EXTRN sub_10102F7A:PROC
EXTRN sub_10102FB5:PROC
EXTRN sub_10102FFA:PROC
EXTRN sub_10103017:PROC
EXTRN sub_10103051:PROC
EXTRN sub_1010AAB3:PROC
EXTRN sub_1010AABA:PROC
EXTRN sub_1010AACE:PROC
EXTRN EXTRN g_1017E308:DWORD:DWORD
EXTRN EXTRN g_1017E30A:DWORD:DWORD
EXTRN EXTRN g_101A5230:DWORD:DWORD
EXTRN EXTRN g_101AB090:DWORD:DWORD
EXTRN EXTRN g_101ADD90:DWORD:DWORD
.CODE
FUN_1010a9fd PROC
    push push edx
    wait wait
    fnstcw fnstcw word ptr [esp]
    je L2
    cmp cmp word ptr [esp], 027Fh
    je L0
    fldcw fldcw word ptr [g_1017E308]
    fptan fptan
    wait wait
    fnstsw fnstsw ax
    sahf sahf
    jp L1
    fstp fstp st(0)
    cmp cmp dword ptr [g_101ADD90], 0
    jne sub_10102FFA
    mov mov edx, 32
    lea lea ecx, [g_101AB090]
    jmp sub_10103017
    fld fld xword ptr [g_1017E30A]
    fxch fxch st(1)
    fprem1 fprem1
    wait wait
    fnstsw fnstsw ax
    sahf sahf
    jp L4
    fstp fstp st(1)
    fptan fptan
    fstp fstp st(0)
    jmp L3
    call sub_10102FB5
L1:
    jmp sub_1010AACE
    test test eax, 0FFFFFh
    jne sub_1010AAB3
L2:
    cmp cmp dword ptr [esp + 8], 0
    jne sub_1010AABA
    fstp fstp st(0)
    fld fld xword ptr [g_101A5230]
    mov mov eax, 1
    cmp cmp dword ptr [g_101ADD90], 0
    jne sub_10103051
    mov mov edx, 32
    lea lea ecx, [g_101AB090]
    call sub_10102F7A
    pop pop edx
    ret ret
FUN_1010a9fd ENDP
END
