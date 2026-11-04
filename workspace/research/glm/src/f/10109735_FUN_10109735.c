extern void sub_100fbfb0(void);

__declspec(naked) void FUN_10109735(void)
{
    __asm {
    push 4
    call sub_100fbfb0
    pop ecx
    ret
    }
}
