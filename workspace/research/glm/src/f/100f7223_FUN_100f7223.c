extern void sub_100fb50b(void);

__declspec(naked) void FUN_100f7223(void)
{
    __asm {
    push dword ptr [ebp + 0x14]
    call sub_100fb50b
    pop ecx
    ret
    }
}
