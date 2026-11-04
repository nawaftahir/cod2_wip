extern int g_101add88;
extern int g_101add8c;
extern int g_101ae15c;
extern void sub_100fe20f(void);
extern void sub_100fe225(void);

__declspec(naked) void __FF_MSGBANNER(void)
{
    __asm {
    mov eax, dword ptr g_101add88
    cmp eax, 1
    je L3
    test eax, eax
    jne L3
    cmp dword ptr g_101add8c, 1
    jne L3
    push 0xfc
    call sub_100fe20f
    mov eax, dword ptr g_101ae15c
    test eax, eax
    pop ecx
    je L3
    call eax
    push 0xff
    call sub_100fe225
    pop ecx
    ret
    }
}
