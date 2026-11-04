extern int g_101ac95c;
extern void sub_100826bd(void);

__declspec(naked) void FUN_1006506e(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr g_101ac95c
    push 0x10
    push dword ptr [ebp + 8]
    call sub_100826bd
    pop ebp
    ret 4
    }
}
