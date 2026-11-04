extern void sub_100fc07d(void);

__declspec(naked) void FUN_100fd614(void)
{
    __asm {
    push 8
    call sub_100fc07d
    pop ecx
    ret
    }
}
