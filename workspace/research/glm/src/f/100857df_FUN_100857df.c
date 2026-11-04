extern int g_101ac96c;
extern int g_101ac970;

__declspec(naked) void FUN_100857df(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    and dword ptr g_101ac96c, 0
    mov dword ptr g_101ac970, eax
    pop ebp
    ret 4
    }
}
