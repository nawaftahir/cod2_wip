.686
.MODEL FLAT, C
EXTRN sub_10102F76:PROC
EXTRN sub_10102FB1:PROC
EXTRN sub_10102FF8:PROC
EXTRN sub_10103015:PROC
EXTRN sub_1010304D:PROC
EXTRN sub_1010AD8B:PROC
EXTRN sub_1010AD92:PROC
EXTRN sub_1010ADA6:PROC
EXTRN EXTRN g_1017E308:DWORD:DWORD
EXTRN EXTRN g_1017E30A:DWORD:DWORD
EXTRN EXTRN g_101A5230:DWORD:DWORD
EXTRN EXTRN g_101AB0C0:DWORD:DWORD
EXTRN EXTRN g_101ADD90:DWORD:DWORD
.CODE
FUN_1010acdd PROC
    push push edx
    wait wait
    fnstcw fnstcw word ptr [esp]
    je L2
    cmp cmp word ptr [esp], 027Fh
    je L0
    fldcw fldcw word ptr [g_1017E308]
    fcos fcos
    wait wait
    fnstsw fnstsw ax
    sahf sahf
    jp L1
    cmp cmp dword ptr [g_101ADD90], 0
L0:
    jne sub_10102FF8
    mov mov edx, 18
    lea lea ecx, [g_101AB0C0]
    jmp sub_10103015
    fld fld xword ptr [g_1017E30A]
    fxch fxch st(1)
    fprem1 fprem1
    wait wait
    fnstsw fnstsw ax
    sahf sahf
    jp L4
    fstp fstp st(1)
    fcos fcos
    jmp L3
    call sub_10102FB1
    jmp sub_1010ADA6
L1:
    test test eax, 0FFFFFh
    jne sub_1010AD8B
L2:
    cmp cmp dword ptr [esp + 8], 0
    jne sub_1010AD92
    fstp fstp st(0)
    fld fld xword ptr [g_101A5230]
L3:
    mov mov eax, 1
    cmp cmp dword ptr [g_101ADD90], 0
    jne sub_1010304D
    mov mov edx, 18
    lea lea ecx, [g_101AB0C0]
    call sub_10102F76
    pop pop edx
    ret ret
FUN_1010acdd ENDP
END
