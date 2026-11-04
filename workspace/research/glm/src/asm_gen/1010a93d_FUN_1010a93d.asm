; FUN_1010a93d @ 0x1010a93d — auto-synthesized
    EXTRN g_101a5230:DWORD
    EXTRN g_101ab080:DWORD
    EXTRN g_101add90:DWORD
    sub_10102f5d PROTO C
    sub_10102f82 PROTO C
    sub_10102fb6 PROTO C
    sub_10102ffc PROTO C
    sub_10103019 PROTO C
    sub_10103059 PROTO C
.CODE
FUN_1010a93d PROC
    push edx
    wait
    fnstcw word ptr [esp]
    mov eax, dword ptr [esp + 0xc]
    je L0
    cmp word ptr [esp], 0x27f
    je L1
    call sub_10102f5d
    test eax, 0x80000000
    jne L2
    fsqrt
    cmp dword ptr [g_101add90], 0
    jne sub_10102ffc
    mov edx, 5
    lea ecx, [g_101ab080]
    jmp sub_10103019
    test eax, 0x7ff00000
    jne L3
    test eax, 0xfffff
    jne L3
    cmp dword ptr [esp + 8], 0
    jne L3
    jmp L4
    call sub_10102fb6
    jmp L5
    test eax, 0xfffff
    jne L6
    cmp dword ptr [esp + 8], 0
    jne L6
    and eax, 0x80000000
    je L4
    fstp st(0)
    fld xword ptr [g_101a5230]
    mov eax, 1
    cmp dword ptr [g_101add90], 0
    jne sub_10103059
    mov edx, 5
    lea ecx, [g_101ab080]
    call sub_10102f82
    pop edx
    ret
FUN_1010a93d ENDP
END