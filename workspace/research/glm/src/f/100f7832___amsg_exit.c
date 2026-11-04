extern int g_101add88;
extern int g_101add8c;
extern void (__stdcall *fp_101a4610)(void);
extern void sub_100fe213(void);
extern void sub_100fe3ab(void);

__declspec(naked) void __amsg_exit(void)
{
    __asm {
    mov eax, dword ptr g_101add88
    cmp eax, 1
    je L2
    test eax, eax
    jne L2
    cmp dword ptr g_101add8c, 1
    jne L2
    call sub_100fe3ab
    push dword ptr [esp + 4]
    call sub_100fe213
    push 0xff
    call fp_101a4610
    }
}
