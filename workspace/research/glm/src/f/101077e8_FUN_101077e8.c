extern void sub_100fbfb0(void);

__declspec(naked) void FUN_101077e8(void)
{
    __asm {
    push 0xa
    call sub_100fbfb0
    pop ecx
    ret
    }
}
