extern int g_10193358;
extern int g_101D1BF8;
extern int g_101D492D;
extern int g_101D49CC;
extern int g_101D4B88;

__declspec(naked) void FUN_100138c0(void)
{
    __asm {
        _emit 081h _emit 0ECh _emit 000h _emit 004h _emit 000h _emit 000h _emit 0FFh _emit 015h
        /* g_101D4B88 */ dword ptr [g_101D4B88]
        _emit 0A0h
        /* g_101D492D */ dword ptr [g_101D492D]
        _emit 084h _emit 0C0h _emit 074h _emit 015h _emit 0A1h
        /* g_101D1BF8 */ dword ptr [g_101D1BF8]
        _emit 08Bh _emit 008h _emit 050h _emit 0FFh _emit 091h _emit 0A8h _emit 000h _emit 000h _emit 000h _emit 0C6h _emit 005h _emit 02Dh
        /* g_101D492D */ dword ptr [g_101D492D]
        _emit 08Bh _emit 084h _emit 024h _emit 008h _emit 004h _emit 000h _emit 000h _emit 08Dh _emit 094h _emit 024h _emit 00Ch _emit 004h _emit 000h _emit 000h _emit 052h _emit 050h _emit 08Dh _emit 04Ch _emit 024h _emit 008h _emit 068h _emit 0FFh _emit 003h _emit 000h _emit 000h _emit 051h _emit 0E8h _emit 0B0h _emit 028h _emit 00Eh _emit 000h _emit 08Bh _emit 084h _emit 024h _emit 014h _emit 004h _emit 000h _emit 000h _emit 08Dh _emit 054h _emit 024h _emit 010h _emit 052h _emit 068h
        /* g_10193358 */ dword ptr [g_10193358]
        _emit 050h _emit 0C6h _emit 084h _emit 024h _emit 01Bh _emit 004h _emit 000h _emit 000h _emit 000h _emit 0FFh _emit 015h
        /* g_101D49CC */ dword ptr [g_101D49CC]
        _emit 081h _emit 0C4h _emit 01Ch _emit 004h _emit 000h _emit 000h _emit 0C3h
    }
}
