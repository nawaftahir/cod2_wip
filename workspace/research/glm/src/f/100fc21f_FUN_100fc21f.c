extern void sub_100fb114(void);

__declspec(naked) void FUN_100fc21f(void)
{
    __asm {
    call sub_100fb114
    add eax, 0xc
    ret
    }
}
