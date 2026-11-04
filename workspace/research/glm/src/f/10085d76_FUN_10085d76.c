extern int g_101ac974;
extern int g_101ac978;
extern void sub_100826e6(void);

__declspec(naked) void FUN_10085d76(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr g_101ac974
    test eax, eax
    je L2
    mov ecx, dword ptr [eax + 0x78]
    mov dword ptr g_101ac974, ecx
    jmp L2
    mov ecx, dword ptr g_101ac978
    push 0x10
    push dword ptr [ebp + 8]
    call sub_100826e6
    pop ebp
    ret 4
    }
}
