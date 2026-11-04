extern void sub_100825f5(void);

__declspec(naked) void FUN_10082638(void)
{
    __asm {
    cmp dword ptr [ecx], -1
    je L0
    jmp sub_100825f5
    ret
    }
}
