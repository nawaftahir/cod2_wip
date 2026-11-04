extern void sub_100fbfb0(void);

__declspec(naked) void FUN_100fc691(void)
{
    __asm {
    push 7
    call sub_100fbfb0
    pop ecx
    ret
    }
}
