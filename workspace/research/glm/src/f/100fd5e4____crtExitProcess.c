extern int g_1010C04C;
extern int g_1010C07C;
extern int g_1010C144;
extern int g_1017C994;
extern int g_1017C9A4;

__declspec(naked) void ___crtExitProcess(void)
{
    __asm {
        _emit 068h
        /* g_1017C9A4 */ dword ptr [g_1017C9A4]
        _emit 0FFh _emit 015h
        /* g_1010C07C */ dword ptr [g_1010C07C]
        _emit 085h _emit 0C0h _emit 074h _emit 016h _emit 068h
        /* g_1017C994 */ dword ptr [g_1017C994]
        _emit 050h _emit 0FFh _emit 015h
        /* g_1010C04C */ dword ptr [g_1010C04C]
        _emit 085h _emit 0C0h _emit 074h _emit 006h _emit 0FFh _emit 074h _emit 024h _emit 004h _emit 0FFh _emit 0D0h _emit 0FFh _emit 074h _emit 024h _emit 004h _emit 0FFh _emit 015h
        /* g_1010C144 */ dword ptr [g_1010C144]
    }
}
