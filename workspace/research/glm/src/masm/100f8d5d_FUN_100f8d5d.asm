.686
.MODEL FLAT, C
EXTRN sub_10102F59:PROC
EXTRN sub_10102F93:PROC
EXTRN sub_10102FCE:PROC
EXTRN sub_10103004:PROC
EXTRN sub_10103021:PROC
EXTRN sub_1010306A:PROC
EXTRN g_101A4810:DWORD
EXTRN g_101A5230:DWORD
EXTRN g_101A523A:DWORD
EXTRN g_101ADD90:DWORD
.CODE
FUN_100f8d5d PROC
    push edx
    wait
    fnstcw word ptr [esp]
    je L4
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
    fpatan
L1:
    cmp dword ptr [g_101ADD90], 0
    jne sub_10103004
    mov edx, 14
    lea ecx, [g_101A4810]
    jmp sub_10103021
L2:
    ja L5
    mov eax, dword ptr [esp + 12]
    mov ecx, eax
    and eax, 0000FFFFFh
    or eax, dword ptr [esp + 8]
    jne L5
    and ecx, 080000000h
    fstp st(0)
    fld xword ptr [g_101A523A]
    je L1
    fchs
    jmp L1
L3:
    call sub_10102FCE
    jmp L6
L4:
    test eax, 0000FFFFFh
    jne L3
    cmp dword ptr [esp + 8], 0
    jne L3
L5:
    fstp st(0)
    fld xword ptr [g_101A5230]
    mov eax, 1
L6:
    cmp dword ptr [g_101ADD90], 0
    jne sub_1010306A
    mov edx, 14
    lea ecx, [g_101A4810]
    call sub_10102F93
    pop edx
    ret
FUN_100f8d5d ENDP
END
