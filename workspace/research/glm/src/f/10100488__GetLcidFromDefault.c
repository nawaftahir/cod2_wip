extern int g_101ae16c;
extern int g_101ae170;
extern int g_101ae174;
extern void (__stdcall *fp_1010c18c)(void);

__declspec(naked) void _GetLcidFromDefault(void)
{
    __asm {
    or word ptr g_101ae16c, 0x104
    call fp_1010c18c
    mov dword ptr g_101ae174, eax
    mov dword ptr g_101ae170, eax
    ret
    }
}
