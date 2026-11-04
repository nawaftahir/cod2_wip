extern void sub_10102f0a(void);

__declspec(naked) void __math_exit(void)
{
    __asm {
    mov ax, word ptr [esp]
    cmp ax, 0x27f
    je L2
    and ax, 0x20
    je L2
    wait
    fnstsw ax
    and ax, 0x20
    je L2
    mov eax, 8
    call sub_10102f0a
    pop edx
    ret
    fldcw word ptr [esp]
    pop edx
    ret
    }
}
