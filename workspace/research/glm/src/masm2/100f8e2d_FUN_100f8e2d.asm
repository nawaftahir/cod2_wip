.686
.MODEL FLAT, C
EXTRN sub_100F8EF9:PROC
EXTRN sub_100F8EFB:PROC
EXTRN sub_100F8F0A:PROC
EXTRN sub_100F8F15:PROC
EXTRN sub_100F8F1C:PROC
EXTRN sub_100F8F30:PROC
EXTRN sub_10102F59:PROC
EXTRN sub_10102F93:PROC
EXTRN sub_10102FCE:PROC
EXTRN sub_10103006:PROC
EXTRN sub_10103023:PROC
EXTRN sub_1010306A:PROC
EXTRN EXTRN g_101A4820:DWORD:DWORD
EXTRN EXTRN g_101A5230:DWORD:DWORD
EXTRN EXTRN g_101ADD90:DWORD:DWORD
.CODE
FUN_100f8e2d PROC
    push push edx
    wait wait
    fnstcw fnstcw word ptr [esp]
    je L2
    cmp cmp word ptr [esp], 027Fh
    je L0
    call sub_10102F59
    cmp cmp eax, 03FF00000h
    jae L1
    fld1 fld1
    fadd fadd st(1)
    fld1 fld1
    fsub fsub st(2)
L0:
    fmulp fmulp st(1)
    fsqrt fsqrt
    fxch fxch st(1)
    fpatan fpatan
    cmp cmp dword ptr [g_101ADD90], 0
    jne sub_10103006
    mov mov edx, 13
    lea lea ecx, [g_101A4820]
    jmp sub_10103023
    ja sub_100F8EF9
    mov mov eax, dword ptr [esp + 12]
    mov mov ecx, eax
    and and eax, 0FFFFFh
    or or eax, dword ptr [esp + 8]
    jne sub_100F8F0A
    and and ecx, 080000000h
    fstp fstp st(0)
L1:
    je sub_100F8EFB
    fldpi fldpi
    jmp L3
    fldz fldz
    jmp L4
    call sub_10102FCE
    jmp sub_100F8F30
    test test eax, 0FFFFFh
    jne sub_100F8F15
L2:
    cmp cmp dword ptr [esp + 8], 0
    jne sub_100F8F1C
    fstp fstp st(0)
    fld fld xword ptr [g_101A5230]
    mov mov eax, 1
    cmp cmp dword ptr [g_101ADD90], 0
    jne sub_1010306A
    mov mov edx, 13
    lea lea ecx, [g_101A4820]
    call sub_10102F93
    pop pop edx
    ret ret
FUN_100f8e2d ENDP
END
