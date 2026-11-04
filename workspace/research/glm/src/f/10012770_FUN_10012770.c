extern int g_10012750;
extern int g_1010C1CC;
extern int g_1010C1D0;
extern int g_101CE60C;
extern int g_101CE610;
extern int g_101CE66C;
extern int g_101CE6CC;

__declspec(naked) void FUN_10012770(void)
{
    __asm {
        _emit 0A1h
        /* g_101CE60C */ dword ptr [g_101CE60C]
        _emit 08Ah _emit 048h _emit 008h _emit 083h _emit 0ECh _emit 008h _emit 084h _emit 0C9h _emit 074h _emit 030h _emit 08Bh _emit 00Dh
        /* g_101CE610 */ dword ptr [g_101CE610]
        _emit 08Bh _emit 051h _emit 008h _emit 08Dh _emit 004h _emit 024h _emit 050h _emit 068h
        /* g_10012750 */ dword ptr [g_10012750]
        _emit 06Ah _emit 000h _emit 06Ah _emit 000h _emit 089h _emit 054h _emit 024h _emit 010h _emit 0C7h _emit 044h _emit 024h _emit 014h _emit 000h _emit 000h _emit 000h _emit 000h _emit 0FFh _emit 015h
        /* g_1010C1CC */ dword ptr [g_1010C1CC]
        _emit 08Bh _emit 044h _emit 024h _emit 004h _emit 085h _emit 0C0h _emit 075h _emit 01Ch _emit 08Bh _emit 00Dh
        /* g_101CE6CC */ dword ptr [g_101CE6CC]
        _emit 08Bh _emit 041h _emit 008h _emit 08Bh _emit 015h
        /* g_101CE66C */ dword ptr [g_101CE66C]
        _emit 08Bh _emit 04Ah _emit 008h _emit 06Ah _emit 001h _emit 051h _emit 050h _emit 0FFh _emit 015h
        /* g_1010C1D0 */ dword ptr [g_1010C1D0]
        _emit 083h _emit 0C4h _emit 008h _emit 0C3h
    }
}
