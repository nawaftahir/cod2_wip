extern int g_101ac95c;

__declspec(naked) void FUN_10065057(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr g_101ac95c
    mov dword ptr g_101ac95c, ecx
    pop ebp
    ret 4
    }
}
