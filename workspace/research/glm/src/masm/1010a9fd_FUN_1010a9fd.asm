.686
.MODEL FLAT, C
EXTRN sub_10102F7A:PROC
EXTRN sub_10102FB5:PROC
EXTRN sub_10102FFA:PROC
EXTRN sub_10103017:PROC
EXTRN sub_10103051:PROC
EXTRN g_1017E308:DWORD
EXTRN g_1017E30A:DWORD
EXTRN g_101A5230:DWORD
EXTRN g_101AB090:DWORD
EXTRN g_101ADD90:DWORD
.CODE
FUN_1010a9fd PROC
    push edx
    wait
    fnstcw word ptr [esp]
    je L5
    cmp word ptr [esp], 00000027Fh
    je L0
    fldcw word ptr [g_1017E308]
L0:
    fptan
    wait
    fnstsw ax
    sahf
    jp L2
    fstp st(0)
L1:
    cmp dword ptr [g_101ADD90], 0
    jne sub_10102FFA
    mov edx, 32
    lea ecx, [g_101AB090]
    jmp sub_10103017
L2:
    fld xword ptr [g_1017E30A]
    fxch st(1)
L3:
    fprem1
    wait
    fnstsw ax
    sahf
    jp L3
    fstp st(1)
    fptan
    fstp st(0)
    jmp L1
L4:
    call sub_10102FB5
    jmp L6
L5:
    test eax, 0000FFFFFh
    jne L4
    cmp dword ptr [esp + 8], 0
    jne L4
    fstp st(0)
    fld xword ptr [g_101A5230]
    mov eax, 1
L6:
    cmp dword ptr [g_101ADD90], 0
    jne sub_10103051
    mov edx, 32
    lea ecx, [g_101AB090]
    call sub_10102F7A
    pop edx
    ret
FUN_1010a9fd ENDP
END
