extern int g_101d1b08;
extern int g_101d1b0c;

__declspec(naked) void FUN_100388f0(void)
{
    __asm {
    mov eax, dword ptr [eax + 8]
    test eax, eax
    je L2
    cmp eax, 1
    jne L2
    mov eax, dword ptr g_101d1b08
    mov dword ptr [edx], eax
    mov byte ptr [ecx], 1
    ret
    cmp eax, 2
    jne L2
    mov eax, dword ptr g_101d1b0c
    mov dword ptr [edx], eax
    mov byte ptr [ecx], 1
    ret
    }
}
