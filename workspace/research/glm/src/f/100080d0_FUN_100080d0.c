extern int g_101CE800;
extern int g_101D1B9C;
extern int g_101D7E98;
extern int g_10678500;

__declspec(naked) void FUN_100080d0(void)
{
    __asm {
        _emit 0A1h
        /* g_101D7E98 */ dword ptr [g_101D7E98]
        _emit 08Bh _emit 00Ch _emit 0B8h _emit 03Bh _emit 00Dh
        /* g_10678500 */ dword ptr [g_10678500]
        _emit 074h _emit 071h _emit 08Bh _emit 015h
        /* g_101D1B9C */ dword ptr [g_101D1B9C]
        _emit 08Bh _emit 042h _emit 014h _emit 08Bh _emit 00Dh
        /* g_101CE800 */ dword ptr [g_101CE800]
        _emit 08Ah _emit 051h _emit 008h _emit 056h _emit 08Dh _emit 034h _emit 07Fh _emit 0C1h _emit 0E6h _emit 002h _emit 084h _emit 0D2h _emit 08Bh _emit 044h _emit 030h _emit 008h _emit 074h _emit 018h _emit 08Bh _emit 054h _emit 024h _emit 00Ch _emit 08Bh _emit 04Ch _emit 024h _emit 008h _emit 052h _emit 08Dh _emit 050h _emit 004h _emit 0E8h _emit 0EEh _emit 0E1h _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 004h _emit 084h _emit 0C0h _emit 075h _emit 037h _emit 0A1h
        /* g_10678500 */ dword ptr [g_10678500]
        _emit 08Bh _emit 00Dh
        /* g_101D7E98 */ dword ptr [g_101D7E98]
        _emit 089h _emit 004h _emit 0B9h _emit 08Bh _emit 015h
        /* g_101D1B9C */ dword ptr [g_101D1B9C]
        _emit 08Bh _emit 042h _emit 014h _emit 00Fh _emit 0B7h _emit 04Ch _emit 030h _emit 006h _emit 08Bh _emit 054h _emit 030h _emit 008h _emit 003h _emit 0C6h _emit 00Fh _emit 0B7h _emit 070h _emit 004h _emit 08Bh _emit 000h _emit 081h _emit 0C1h _emit 000h _emit 008h _emit 000h _emit 000h _emit 052h _emit 0E8h _emit 033h _emit 0C2h _emit 001h _emit 000h _emit 083h _emit 0C4h _emit 004h _emit 05Eh _emit 0C3h
    }
}
