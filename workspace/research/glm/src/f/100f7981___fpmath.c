extern int g_101add94;
extern void sub_100f793e(void);
extern void sub_100facfb(void);
extern void sub_100fe867(void);

__declspec(naked) void __fpmath(void)
{
    __asm {
    call sub_100f793e
    call sub_100fe867
    cmp dword ptr [esp + 4], 0
    mov dword ptr g_101add94, eax
    je L1
    call sub_100facfb
    fnclex
    ret
    }
}
