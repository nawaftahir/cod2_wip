extern void sub_100fbfb0(void);

__declspec(naked) void FUN_100f84bf(void)
{
    __asm {
    push 0xc
    call sub_100fbfb0
    pop ecx
    ret
    }
}
