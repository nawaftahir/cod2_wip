extern void sub_100f7832(void);

__declspec(naked) void __fptrap(void)
{
    __asm {
    push 2
    call sub_100f7832
    pop ecx
    ret
    }
}
