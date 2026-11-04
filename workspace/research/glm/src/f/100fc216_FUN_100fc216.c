extern void sub_100fb114(void);

__declspec(naked) void FUN_100fc216(void)
{
    __asm {
    call sub_100fb114
    add eax, 8
    ret
    }
}
