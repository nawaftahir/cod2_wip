.686
.MODEL FLAT, C
EXTRN sub_10102F59:PROC
EXTRN sub_10102F93:PROC
EXTRN sub_10102FCE:PROC
EXTRN sub_10103006:PROC
EXTRN sub_10103023:PROC
EXTRN sub_1010306A:PROC
EXTRN g_101A4820:DWORD
EXTRN g_101A5230:DWORD
EXTRN g_101ADD90:DWORD
.CODE
FUN_100f8e2d PROC
    push edx
    wait
    fnstcw word ptr [esp]
    je L5
    cmp word ptr [esp], 00000027Fh
    je L0
    call sub_10102F59
L0:
    cmp eax, 03FF00000h
    jae L2
    fld1
    fadd st(1)
    fld1
    fsub st(2)
    fmulp st(1)
    fsqrt
    fxch st(1)
    fpatan
L1:
    cmp dword ptr [g_101ADD90], 0
    jne sub_10103006
    mov edx, 13
    lea ecx, [g_101A4820]
    jmp sub_10103023
L2:
    ja L6
    mov eax, dword ptr [esp + 12]
    mov ecx, eax
    and eax, 0000FFFFFh
    or eax, dword ptr [esp + 8]
    jne L6
    and ecx, 080000000h
    fstp st(0)
    je L3
    fldpi
    jmp L1
L3:
    fldz
    jmp L1
L4:
    call sub_10102FCE
    jmp L7
L5:
    test eax, 0000FFFFFh
    jne L4
    cmp dword ptr [esp + 8], 0
    jne L4
L6:
    fstp st(0)
    fld xword ptr [g_101A5230]
    mov eax, 1
L7:
    cmp dword ptr [g_101ADD90], 0
    jne sub_1010306A
    mov edx, 13
    lea ecx, [g_101A4820]
    call sub_10102F93
    pop edx
    ret
FUN_100f8e2d ENDP
END
