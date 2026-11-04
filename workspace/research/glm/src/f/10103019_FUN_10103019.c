extern int g_1017e314;
extern int g_1017e31c;
extern int g_1017e324;
extern int g_1017e32c;
extern int g_1017e334;
extern int g_1017e33c;
extern void sub_10102f1a(void);
extern void sub_10102f2a(void);

__declspec(naked) void FUN_10103019(void)
{
    __asm {
    sub esp, 8
    fst qword ptr [esp]
    mov eax, dword ptr [esp + 4]
    add esp, 8
    and eax, 0x7ff00000
    je L6
    cmp eax, 0x7ff00000
    je L6
    mov ax, word ptr [esp]
    cmp ax, 0x27f
    je L6
    and ax, 0x20
    jne L6
    wait
    fnstsw ax
    and ax, 0x20
    je L6
    mov eax, 8
    cmp edx, 0x1d
    je L6
    call sub_10102f2a
    pop edx
    ret
    call sub_10102f1a
    pop edx
    ret
    fldcw word ptr [esp]
    pop edx
    ret
    fld qword ptr g_1017e32c
    fxch st(1)
    fscale
    fstp st(1)
    fld st(0)
    fabs
    fcomp qword ptr g_1017e31c
    wait
    fnstsw ax
    sahf
    mov eax, 4
    jae L6
    fmul qword ptr g_1017e33c
    jmp L6
    fld qword ptr g_1017e324
    fxch st(1)
    fscale
    fstp st(1)
    fld st(0)
    fabs
    fcomp qword ptr g_1017e314
    wait
    fnstsw ax
    sahf
    mov eax, 3
    jbe L6
    fmul qword ptr g_1017e334
    jmp L6
    }
}
