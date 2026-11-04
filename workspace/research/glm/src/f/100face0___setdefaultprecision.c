extern void sub_100f6174(void);

__declspec(naked) void __setdefaultprecision(void)
{
    __asm {
    push 0x30000
    push 0x10000
    call sub_100f6174
    pop ecx
    pop ecx
    ret
    }
}
