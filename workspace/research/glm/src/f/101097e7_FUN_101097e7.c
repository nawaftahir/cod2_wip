extern void sub_100fbfb0(void);

__declspec(naked) void FUN_101097e7(void)
{
    __asm {
    push 4
    call sub_100fbfb0
    pop ecx
    ret
    }
}
