extern int g_101ac96c;

__declspec(naked) void FUN_10085841(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L1
    mov ecx, dword ptr g_101ac96c
    mov dword ptr [eax + 0x70], ecx
    mov dword ptr g_101ac96c, eax
    pop ebp
    ret 4
    }
}
