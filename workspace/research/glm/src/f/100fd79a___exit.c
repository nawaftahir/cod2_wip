extern void sub_100fd6c6(void);

__declspec(naked) void __exit(void)
{
    __asm {
    push 0
    push 1
    push dword ptr [esp + 0xc]
    call sub_100fd6c6
    add esp, 0xc
    ret
    }
}
