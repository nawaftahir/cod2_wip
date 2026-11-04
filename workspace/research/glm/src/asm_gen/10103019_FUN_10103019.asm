; FUN_10103019 @ 0x10103019 — auto-synthesized
    EXTRN g_1017e314:DWORD
    EXTRN g_1017e31c:DWORD
    EXTRN g_1017e324:DWORD
    EXTRN g_1017e32c:DWORD
    EXTRN g_1017e334:DWORD
    EXTRN g_1017e33c:DWORD
    sub_10102f1a PROTO C
    sub_10102f2a PROTO C
.CODE
FUN_10103019 PROC
    sub esp, 8
    fst qword ptr [esp]
    mov eax, dword ptr [esp + 4]
    add esp, 8
    and eax, 0x7ff00000
    je L0
    cmp eax, 0x7ff00000
    je L1
    mov ax, word ptr [esp]
    cmp ax, 0x27f
    je L2
    and ax, 0x20
    jne L3
    wait
    fnstsw ax
    and ax, 0x20
    je L3
    mov eax, 8
    cmp edx, 0x1d
    je L4
    call sub_10102f2a
    pop edx
    ret
    call sub_10102f1a
    pop edx
    ret
    fldcw word ptr [esp]
    pop edx
    ret
    fld qword ptr [g_1017e32c]
    fxch st(1)
    fscale
    fstp st(1)
    fld st(0)
    fabs
    fcomp qword ptr [g_1017e31c]
    wait
    fnstsw ax
    sahf
    mov eax, 4
    jae L5
    fmul qword ptr [g_1017e33c]
    jmp L5
    fld qword ptr [g_1017e324]
    fxch st(1)
    fscale
    fstp st(1)
    fld st(0)
    fabs
    fcomp qword ptr [g_1017e314]
    wait
    fnstsw ax
    sahf
    mov eax, 3
    jbe L5
    fmul qword ptr [g_1017e334]
    jmp L5
FUN_10103019 ENDP
END