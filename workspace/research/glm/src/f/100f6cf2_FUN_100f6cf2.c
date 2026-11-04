extern void sub_100f6c96(void);

__declspec(naked) void FUN_100f6cf2(void)
{
    __asm {
    push 0x40
    push dword ptr [esp + 0xc]
    push dword ptr [esp + 0xc]
    call sub_100f6c96
    add esp, 0xc
    ret
    }
}
