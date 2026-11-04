extern void sub_100fbfb0(void);

__declspec(naked) void FUN_100fb2b7(void)
{
    __asm {
    push 0xd
    call sub_100fbfb0
    pop ecx
    ret
    }
}
