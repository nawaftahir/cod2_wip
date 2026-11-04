extern void sub_100fbfb0(void);

__declspec(naked) void FUN_10107986(void)
{
    __asm {
    push 0xb
    call sub_100fbfb0
    pop ecx
    ret
    }
}
