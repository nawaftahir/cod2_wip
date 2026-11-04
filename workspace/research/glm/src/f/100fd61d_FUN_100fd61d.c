extern void sub_100fbfb0(void);

__declspec(naked) void FUN_100fd61d(void)
{
    __asm {
    push 8
    call sub_100fbfb0
    pop ecx
    ret
    }
}
