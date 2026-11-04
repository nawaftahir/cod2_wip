; __ms_p5_test_fdiv @ 0x100fe81d — auto-synthesized
    EXTRN g_1017ce00:DWORD
    EXTRN g_1017ce08:DWORD
    EXTRN g_1019bc88:DWORD
.CODE
__ms_p5_test_fdiv PROC
    push ebp
    mov ebp, esp
    sub esp, 0x18
    fld qword ptr [g_1017ce08]
    fstp qword ptr [ebp - 8]
    fld qword ptr [g_1017ce00]
    fstp qword ptr [ebp - 0x10]
    fld qword ptr [ebp - 0x10]
    fdiv qword ptr [ebp - 8]
    fmul qword ptr [ebp - 8]
    fsubr qword ptr [ebp - 0x10]
    fstp qword ptr [ebp - 0x18]
    fld qword ptr [ebp - 0x18]
    fcomp qword ptr [g_1019bc88]
    fnstsw ax
    test ah, 0x41
    jne L0
    xor eax, eax
    inc eax
    leave
    ret
    xor eax, eax
    leave
    ret
__ms_p5_test_fdiv ENDP
END