; FUN_100f8d5d @ 0x100f8d5d — auto-synthesized
    EXTRN g_101a4810:DWORD
    EXTRN g_101a5230:DWORD
    EXTRN g_101a523a:DWORD
    EXTRN g_101add90:DWORD
    sub_10102f59 PROTO C
    sub_10102f93 PROTO C
    sub_10102fce PROTO C
    sub_10103004 PROTO C
    sub_10103021 PROTO C
    sub_1010306a PROTO C
.CODE
FUN_100f8d5d PROC
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
    fpatan
    cmp dword ptr [g_101add90], 0
    jne sub_10103004
    mov edx, 0xe
    lea ecx, [g_101a4810]
    jmp sub_10103021
    ja L3
    mov eax, dword ptr [esp + 0xc]
    mov ecx, eax
    and eax, 0xfffff
    or eax, dword ptr [esp + 8]
    jne L3
    and ecx, 0x80000000
    fstp st(0)
    fld xword ptr [g_101a523a]
    je L4
    fchs
    jmp L4
    call sub_10102fce
    jmp L5
    test eax, 0xfffff
    jne L6
    cmp dword ptr [esp + 8], 0
    jne L6
    fstp st(0)
    fld xword ptr [g_101a5230]
    mov eax, 1
    cmp dword ptr [g_101add90], 0
    jne sub_1010306a
    mov edx, 0xe
    lea ecx, [g_101a4810]
    call sub_10102f93
    pop edx
    ret
FUN_100f8d5d ENDP
END