; FUN_1010a9fd @ 0x1010a9fd — auto-synthesized
    EXTRN g_1017e308:DWORD
    EXTRN g_1017e30a:DWORD
    EXTRN g_101a5230:DWORD
    EXTRN g_101ab090:DWORD
    EXTRN g_101add90:DWORD
    sub_10102f7a PROTO C
    sub_10102fb5 PROTO C
    sub_10102ffa PROTO C
    sub_10103017 PROTO C
    sub_10103051 PROTO C
.CODE
FUN_1010a9fd PROC
    push edx
    wait
    fnstcw word ptr [esp]
    je L0
    cmp word ptr [esp], 0x27f
    je L1
    fldcw word ptr [g_1017e308]
    fptan
    wait
    fnstsw ax
    sahf
    jp L2
    fstp st(0)
    cmp dword ptr [g_101add90], 0
    jne sub_10102ffa
    mov edx, 0x20
    lea ecx, [g_101ab090]
    jmp sub_10103017
    fld xword ptr [g_1017e30a]
    fxch st(1)
    fprem1
    wait
    fnstsw ax
    sahf
    jp L3
    fstp st(1)
    fptan
    fstp st(0)
    jmp L4
    call sub_10102fb5
    jmp L5
    test eax, 0xfffff
    jne L6
    cmp dword ptr [esp + 8], 0
    jne L6
    fstp st(0)
    fld xword ptr [g_101a5230]
    mov eax, 1
    cmp dword ptr [g_101add90], 0
    jne sub_10103051
    mov edx, 0x20
    lea ecx, [g_101ab090]
    call sub_10102f7a
    pop edx
    ret
FUN_1010a9fd ENDP
END