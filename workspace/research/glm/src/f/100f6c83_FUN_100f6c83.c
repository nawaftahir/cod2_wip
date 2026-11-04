extern void sub_100fb50b(void);

__declspec(naked) void FUN_100f6c83(void)
{
    __asm {
    push dword ptr [ebp + 8]
    call sub_100fb50b
    pop ecx
    ret
    }
}
