.686
.MODEL FLAT, C
EXTRN sub_10102F76:PROC
EXTRN sub_10102FB1:PROC
EXTRN sub_10102FF8:PROC
EXTRN sub_10103015:PROC
EXTRN sub_1010304D:PROC
EXTRN g_1017E308:DWORD
EXTRN g_1017E30A:DWORD
EXTRN g_101A5230:DWORD
EXTRN g_101AB0C0:DWORD
EXTRN g_101ADD90:DWORD
.CODE
FUN_1010acdd PROC
    push edx
    wait
    fnstcw word ptr [esp]
    je L5
    cmp word ptr [esp], 00000027Fh
    je L0
    fldcw word ptr [g_1017E308]
L0:
    fcos
    wait
    fnstsw ax
    sahf
    jp L2
L1:
    cmp dword ptr [g_101ADD90], 0
    jne sub_10102FF8
    mov edx, 18
    lea ecx, [g_101AB0C0]
    jmp sub_10103015
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
    fcos
    jmp L1
L4:
    call sub_10102FB1
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
    jne sub_1010304D
    mov edx, 18
    lea ecx, [g_101AB0C0]
    call sub_10102F76
    pop edx
    ret
FUN_1010acdd ENDP
END
