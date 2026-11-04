extern int g_1017ce00;
extern int g_1017ce08;
extern int g_1019bc88;

__declspec(naked) void __ms_p5_test_fdiv(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x18
    fld qword ptr g_1017ce08
    fstp qword ptr [ebp - 8]
    fld qword ptr g_1017ce00
    fstp qword ptr [ebp - 0x10]
    fld qword ptr [ebp - 0x10]
    fdiv qword ptr [ebp - 8]
    fmul qword ptr [ebp - 8]
    fsubr qword ptr [ebp - 0x10]
    fstp qword ptr [ebp - 0x18]
    fld qword ptr [ebp - 0x18]
    fcomp qword ptr g_1019bc88
    fnstsw ax
    test ah, 0x41
    jne L1
    xor eax, eax
    inc eax
    leave
    ret
    xor eax, eax
    leave
    ret
    }
}
