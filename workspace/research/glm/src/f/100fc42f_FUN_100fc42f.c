extern void sub_100fbfb0(void);

__declspec(naked) void FUN_100fc42f(void)
{
    __asm {
    push 4
    call sub_100fbfb0
    pop ecx
    ret
    }
}
