extern int g_101ae238;
extern void sub_100fc438(void);

__declspec(naked) void _malloc(void)
{
    __asm {
    push dword ptr g_101ae238
    push dword ptr [esp + 8]
    call sub_100fc438
    pop ecx
    pop ecx
    ret
    }
}
