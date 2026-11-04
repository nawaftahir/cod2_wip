extern int g_1019BC78;
extern int g_101CE784;
extern int g_101CE82C;
extern int g_1072DC00;
extern int g_1072DC04;
extern int g_1072DC08;
extern int g_1072DC0C;
extern int g_1072DECC;

__declspec(naked) void FUN_100306b0(void)
{
    __asm {
        _emit 0A1h
        /* g_101CE784 */ dword ptr [g_101CE784]
        _emit 0D9h _emit 040h _emit 008h _emit 08Bh _emit 00Dh
        /* g_101CE82C */ dword ptr [g_101CE82C]
        _emit 0D9h _emit 041h _emit 008h _emit 083h _emit 0ECh _emit 010h _emit 0D9h _emit 0C1h _emit 053h _emit 0D9h _emit 01Dh
        /* g_1072DC00 */ dword ptr [g_1072DC00]
        _emit 08Dh _emit 04Ch _emit 024h _emit 008h _emit 0D9h _emit 005h
        /* g_1019BC78 */ dword ptr [g_1019BC78]
        _emit 0C7h _emit 005h _emit 008h _emit 0DCh _emit 072h _emit 010h
        /* g_1072DC08 */ dword ptr [g_1072DC08]
        _emit 0D8h _emit 0E2h _emit 0D8h _emit 03Dh
        /* g_1019BC78 */ dword ptr [g_1019BC78]
        _emit 0D9h _emit 01Dh
        /* g_1072DC04 */ dword ptr [g_1072DC04]
        _emit 0D9h _emit 01Dh
        /* g_1072DC0C */ dword ptr [g_1072DC0C]
        _emit 0DDh _emit 0D8h _emit 0E8h _emit 0D4h _emit 0FEh _emit 0FFh _emit 0FFh _emit 08Bh _emit 0D9h _emit 0A3h
        /* g_1072DECC */ dword ptr [g_1072DECC]
        _emit 0E8h _emit 038h _emit 050h _emit 000h _emit 000h _emit 05Bh _emit 083h _emit 0C4h _emit 010h _emit 0C3h
    }
}
