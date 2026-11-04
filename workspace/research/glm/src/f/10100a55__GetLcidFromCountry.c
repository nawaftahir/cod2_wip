extern int g_1010066B;
extern int g_1010C194;
extern int g_101AE16C;
extern int g_101AE17C;
extern int g_101AE180;

__declspec(naked) void _GetLcidFromCountry(void)
{
    __asm {
        _emit 0FFh _emit 035h
        /* g_101AE180 */ dword ptr [g_101AE180]
        _emit 0E8h _emit 0A0h _emit 097h _emit 0FFh _emit 0FFh _emit 083h _emit 0E8h _emit 003h _emit 0F7h _emit 0D8h _emit 059h _emit 01Bh _emit 0C0h _emit 06Ah _emit 001h _emit 040h _emit 068h
        /* g_1010066B */ dword ptr [g_1010066B]
        _emit 0A3h
        /* g_101AE17C */ dword ptr [g_101AE17C]
        _emit 0FFh _emit 015h
        /* g_1010C194 */ dword ptr [g_1010C194]
        _emit 0F6h _emit 005h _emit 06Ch
        /* g_101AE16C */ dword ptr [g_101AE16C]
        _emit 075h _emit 007h _emit 083h _emit 025h _emit 06Ch
        /* g_101AE16C */ dword ptr [g_101AE16C]
        _emit 0C3h
    }
}
