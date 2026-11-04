extern int g_10678500;
extern int g_101da9c8;
extern int g_10678514;
extern int g_10678ab8;
extern int g_10678abc;
extern int g_10678ac0;
extern int g_1067850c;
extern int g_10678510;
extern int g_10692a5c;
extern void sub_1000a7f0(void);

__declspec(naked) void R_ClearScene(void)
{
    __asm {
    mov eax, dword ptr g_10678500
    inc eax
    xor ecx, ecx
    mov dword ptr g_10678500, eax
    mov eax, dword ptr g_101da9c8
    mov dword ptr g_10678514, ecx
    mov dword ptr g_10678ab8, ecx
    mov edx, dword ptr [eax + 4]
    lea edx, [eax + edx * 8 + 8]
    mov dword ptr g_10678abc, edx
    mov dword ptr g_10678ac0, ecx
    mov dword ptr g_1067850c, ecx
    mov edx, dword ptr [eax + 0xa000c]
    imul edx, edx, 0x74
    lea eax, [edx + eax + 0xa0010]
    mov dword ptr g_10678510, eax
    mov dword ptr g_10692a5c, ecx
    /* tail jmp 0x1000a7f0: outside matcher scan window, emitted raw */
    _emit 0xe9
    _emit 0x89
    _emit 0x52
    _emit 0xfe
    _emit 0xff
    }
}
