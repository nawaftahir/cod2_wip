extern void sub_100fb50b(void);

__declspec(naked) void FUN_100f6ce8(void)
{
    __asm {
    push dword ptr [ebp - 0x1c]
    call sub_100fb50b
    pop ecx
    ret
    }
}
