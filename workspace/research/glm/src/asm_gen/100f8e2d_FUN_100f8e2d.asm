; FUN_100f8e2d @ 0x100f8e2d — auto-synthesized
    EXTRN g_101a4820:DWORD
    EXTRN g_101a5230:DWORD
    EXTRN g_101add90:DWORD
    sub_10102f59 PROTO C
    sub_10102f93 PROTO C
    sub_10102fce PROTO C
    sub_10103006 PROTO C
    sub_10103023 PROTO C
    sub_1010306a PROTO C
.CODE
FUN_100f8e2d PROC
    push edx
    wait
    fnstcw word ptr [esp]
    je L0
    cmp word ptr [esp], 0x27f
    je L1
    call sub_10102f59
    cmp eax, 0x3ff00000
    jae L2
    fld1
    fadd st(1)
    fld1
    fsub st(2)
    fmulp st(1)
    fsqrt
    fxch st(1)
    fpatan
    cmp dword ptr [g_101add90], 0
    jne sub_10103006
    mov edx, 0xd
    lea ecx, [g_101a4820]
    jmp sub_10103023
    ja L3
    mov eax, dword ptr [esp + 0xc]
    mov ecx, eax
    and eax, 0xfffff
    or eax, dword ptr [esp + 8]
    jne L3
    and ecx, 0x80000000
    fstp st(0)
    je L4
    fldpi
    jmp L5
    fldz
    jmp L5
    call sub_10102fce
    jmp L6
    test eax, 0xfffff
    jne L7
    cmp dword ptr [esp + 8], 0
    jne L7
    fstp st(0)
    fld xword ptr [g_101a5230]
    mov eax, 1
    cmp dword ptr [g_101add90], 0
    jne sub_1010306a
    mov edx, 0xd
    lea ecx, [g_101a4820]
    call sub_10102f93
    pop edx
    ret
FUN_100f8e2d ENDP
END