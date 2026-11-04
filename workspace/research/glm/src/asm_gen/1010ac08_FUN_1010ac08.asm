; FUN_1010ac08 @ 0x1010ac08 — auto-synthesized
    EXTRN g_1017e308:DWORD
    EXTRN g_101a5230:DWORD
    EXTRN g_101a526a:DWORD
    EXTRN g_101ab0b0:DWORD
    EXTRN g_101add90:DWORD
    sub_10102f9d PROTO C
    sub_10102fd8 PROTO C
    sub_10103008 PROTO C
    sub_10103025 PROTO C
    sub_10103074 PROTO C
.CODE
FUN_1010ac08 PROC
    push edx
    wait
    fnstcw word ptr [esp]
    je L0
    mov eax, dword ptr [esp + 0xc]
    cmp word ptr [esp], 0x27f
    je L1
    fldcw word ptr [g_1017e308]
    test eax, 0x7ff00000
    je L2
    test eax, 0x80000000
    jne L3
    fldln2
    fxch st(1)
    fyl2x
    cmp dword ptr [g_101add90], 0
    jne sub_10103008
    lea ecx, [g_101ab0b0]
    mov edx, 0x1a
    jmp sub_10103025
    test eax, 0x80000000
    jne L3
    jmp L4
    test eax, 0xfffff
    jne L5
    cmp dword ptr [esp + 8], 0
    jne L5
    and eax, 0x80000000
    je L6
    fstp st(0)
    fld xword ptr [g_101a5230]
    mov eax, 1
    jmp L7
    call sub_10102fd8
    jmp L7
    test eax, 0xfffff
    jne L8
    cmp dword ptr [esp + 8], 0
    jne L8
    fstp st(0)
    fld xword ptr [g_101a526a]
    mov eax, 2
    cmp dword ptr [g_101add90], 0
    jne sub_10103074
    lea ecx, [g_101ab0b0]
    mov edx, 0x1a
    call sub_10102f9d
    pop edx
    ret
FUN_1010ac08 ENDP
END