extern int g_101ac974;
extern int g_101ac978;

__declspec(naked) void FUN_10085d5e(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    and dword ptr g_101ac974, 0
    mov dword ptr g_101ac978, eax
    pop ebp
    ret 4
    }
}
