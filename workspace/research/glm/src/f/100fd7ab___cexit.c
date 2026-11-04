extern void sub_100fd6c6(void);

__declspec(naked) void __cexit(void)
{
    __asm {
    push 1
    push 0
    push 0
    call sub_100fd6c6
    add esp, 0xc
    ret
    }
}
