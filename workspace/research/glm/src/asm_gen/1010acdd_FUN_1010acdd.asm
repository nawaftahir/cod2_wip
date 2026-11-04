; FUN_1010acdd @ 0x1010acdd — auto-synthesized
    EXTRN g_1017e308:DWORD
    EXTRN g_1017e30a:DWORD
    EXTRN g_101a5230:DWORD
    EXTRN g_101ab0c0:DWORD
    EXTRN g_101add90:DWORD
    sub_10102f76 PROTO C
    sub_10102fb1 PROTO C
    sub_10102ff8 PROTO C
    sub_10103015 PROTO C
    sub_1010304d PROTO C
.CODE
FUN_1010acdd PROC
    push edx
    wait
    fnstcw word ptr [esp]
    je L0
    cmp word ptr [esp], 0x27f
    je L1
    fldcw word ptr [g_1017e308]
    fcos
    wait
    fnstsw ax
    sahf
    jp L2
    cmp dword ptr [g_101add90], 0
    jne sub_10102ff8
    mov edx, 0x12
    lea ecx, [g_101ab0c0]
    jmp sub_10103015
    fld xword ptr [g_1017e30a]
    fxch st(1)
    fprem1
    wait
    fnstsw ax
    sahf
    jp L3
    fstp st(1)
    fcos
    jmp L4
    call sub_10102fb1
    jmp L5
    test eax, 0xfffff
    jne L6
    cmp dword ptr [esp + 8], 0
    jne L6
    fstp st(0)
    fld xword ptr [g_101a5230]
    mov eax, 1
    cmp dword ptr [g_101add90], 0
    jne sub_1010304d
    mov edx, 0x12
    lea ecx, [g_101ab0c0]
    call sub_10102f76
    pop edx
    ret
FUN_1010acdd ENDP
END