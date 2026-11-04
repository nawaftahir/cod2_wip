extern int g_101a4898;
extern void (__stdcall *fp_101addbc)(void);
extern void (__stdcall *fp_101addc0)(void);
extern void sub_100fb1a5(void);

__declspec(naked) void __freeptd(void)
{
    __asm {
    mov ecx, dword ptr g_101a4898
    cmp ecx, -1
    je L2
    mov eax, dword ptr [esp + 4]
    test eax, eax
    jne L2
    push ecx
    call fp_101addbc
    push eax
    call sub_100fb1a5
    push 0
    push dword ptr g_101a4898
    call fp_101addc0
    ret
    }
}
