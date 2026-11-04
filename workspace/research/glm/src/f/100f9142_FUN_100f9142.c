extern int g_101a4830;

__declspec(naked) void FUN_100f9142(void)
{
    __asm {
    fld st(0)
    frndint
    fcomp st(1)
    mov cl, 0
    wait
    fnstsw ax
    sahf
    jne L2
    fmul qword ptr g_101a4830
    inc cl
    fld st(0)
    frndint
    fcompp
    wait
    fnstsw ax
    sahf
    jne L2
    inc cl
    ret
    fstp st(0)
    ret
    }
}
