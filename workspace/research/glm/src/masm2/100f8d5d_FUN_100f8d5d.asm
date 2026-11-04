.686
.MODEL FLAT, C
EXTRN sub_100F8E27:PROC
EXTRN sub_100F8E38:PROC
EXTRN sub_100F8E45:PROC
EXTRN sub_100F8E4C:PROC
EXTRN sub_100F8E60:PROC
EXTRN sub_10102F59:PROC
EXTRN sub_10102F93:PROC
EXTRN sub_10102FCE:PROC
EXTRN sub_10103004:PROC
EXTRN sub_10103021:PROC
EXTRN sub_1010306A:PROC
EXTRN EXTRN g_101A4810:DWORD:DWORD
EXTRN EXTRN g_101A5230:DWORD:DWORD
EXTRN EXTRN g_101A523A:DWORD:DWORD
EXTRN EXTRN g_101ADD90:DWORD:DWORD
.CODE
FUN_100f8d5d PROC
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
    fpatan fpatan
    cmp cmp dword ptr [g_101ADD90], 0
    jne sub_10103004
    mov mov edx, 14
    lea lea ecx, [g_101A4810]
    jmp sub_10103021
    ja sub_100F8E27
    mov mov eax, dword ptr [esp + 12]
    mov mov ecx, eax
    and and eax, 0FFFFFh
    or or eax, dword ptr [esp + 8]
    jne sub_100F8E38
    and and ecx, 080000000h
    fstp fstp st(0)
L1:
    fld fld xword ptr [g_101A523A]
    je L3
    fchs fchs
    jmp L4
    call sub_10102FCE
    jmp sub_100F8E60
    test test eax, 0FFFFFh
    jne sub_100F8E45
L2:
    cmp cmp dword ptr [esp + 8], 0
    jne sub_100F8E4C
    fstp fstp st(0)
    fld fld xword ptr [g_101A5230]
    mov mov eax, 1
    cmp cmp dword ptr [g_101ADD90], 0
L4:
    jne sub_1010306A
    mov mov edx, 14
    lea lea ecx, [g_101A4810]
    call sub_10102F93
    pop pop edx
    ret ret
FUN_100f8d5d ENDP
END
