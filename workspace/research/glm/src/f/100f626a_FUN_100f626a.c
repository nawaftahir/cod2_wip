extern void sub_100fb53a(void);

__declspec(naked) void FUN_100f626a(void)
{
    __asm {
    push esi
    push 1
    call sub_100fb53a
    pop ecx
    pop ecx
    ret
    }
}
