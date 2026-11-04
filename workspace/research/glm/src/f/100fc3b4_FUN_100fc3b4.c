extern void sub_100fbfb0(void);

__declspec(naked) void FUN_100fc3b4(void)
{
    __asm {
    push 1
    call sub_100fbfb0
    pop ecx
    ret
    }
}
