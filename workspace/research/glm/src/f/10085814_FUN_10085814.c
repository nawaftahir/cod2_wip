extern int g_101ac96c;
extern int g_101ac970;
extern void sub_100826e6(void);

__declspec(naked) void FUN_10085814(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr g_101ac96c
    test eax, eax
    je L2
    mov ecx, dword ptr [eax + 0x70]
    mov dword ptr g_101ac96c, ecx
    jmp L2
    mov ecx, dword ptr g_101ac970
    push 0x10
    push dword ptr [ebp + 8]
    call sub_100826e6
    pop ebp
    ret 4
    }
}
