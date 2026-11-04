extern int g_1010098A;
extern int g_1010C194;
extern int g_101AE16C;
extern int g_101AE178;
extern int g_101AE184;
extern int g_101AE188;

__declspec(naked) void _GetLcidFromLanguage(void)
{
    __asm {
        _emit 0FFh _emit 035h
        /* g_101AE188 */ dword ptr [g_101AE188]
        _emit 0E8h _emit 0E3h _emit 096h _emit 0FFh _emit 0FFh _emit 083h _emit 0E8h _emit 003h _emit 0F7h _emit 0D8h _emit 01Bh _emit 0C0h _emit 040h _emit 059h _emit 0A3h
        /* g_101AE178 */ dword ptr [g_101AE178]
        _emit 074h _emit 00Ch _emit 0C7h _emit 005h _emit 084h _emit 0E1h _emit 01Ah _emit 010h
        /* g_101AE184 */ dword ptr [g_101AE184]
        _emit 0EBh _emit 010h _emit 08Bh _emit 015h
        /* g_101AE188 */ dword ptr [g_101AE188]
        _emit 0E8h _emit 00Ah _emit 0FBh _emit 0FFh _emit 0FFh _emit 0A3h
        /* g_101AE184 */ dword ptr [g_101AE184]
        _emit 06Ah _emit 001h _emit 068h
        /* g_1010098A */ dword ptr [g_1010098A]
        _emit 0FFh _emit 015h
        /* g_1010C194 */ dword ptr [g_1010C194]
        _emit 0F6h _emit 005h _emit 06Ch
        /* g_101AE16C */ dword ptr [g_101AE16C]
        _emit 075h _emit 007h _emit 083h _emit 025h _emit 06Ch
        /* g_101AE16C */ dword ptr [g_101AE16C]
        _emit 0C3h
    }
}
