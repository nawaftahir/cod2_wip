extern int g_101ac974;

__declspec(naked) void FUN_10085da3(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L1
    mov ecx, dword ptr g_101ac974
    mov dword ptr [eax + 0x78], ecx
    mov dword ptr g_101ac974, eax
    pop ebp
    ret 4
    }
}
