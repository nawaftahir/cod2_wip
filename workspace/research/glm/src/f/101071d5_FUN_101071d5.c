extern void sub_100fbfb0(void);

__declspec(naked) void FUN_101071d5(void)
{
    __asm {
    push 0xd
    call sub_100fbfb0
    pop ecx
    ret
    }
}
