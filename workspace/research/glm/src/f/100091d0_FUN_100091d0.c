extern int g_101D1B9C;
extern int g_10678510;
extern int g_10678AC4;

__declspec(naked) void FUN_100091d0(void)
{
    __asm {
        _emit 08Bh _emit 015h
        /* g_10678510 */ dword ptr [g_10678510]
        _emit 083h _emit 0ECh _emit 018h _emit 053h _emit 055h _emit 08Bh _emit 06Ch _emit 024h _emit 024h _emit 08Bh _emit 0DDh _emit 08Bh _emit 0CDh _emit 06Bh _emit 0DBh _emit 034h _emit 06Bh _emit 0C9h _emit 074h _emit 056h _emit 057h _emit 081h _emit 0C3h
        /* g_10678AC4 */ dword ptr [g_10678AC4]
        _emit 08Bh _emit 07Bh _emit 004h _emit 003h _emit 0CAh _emit 08Dh _emit 074h _emit 024h _emit 01Ch _emit 08Dh _emit 054h _emit 024h _emit 010h _emit 0E8h _emit 0BDh _emit 0F6h _emit 0FFh _emit 0FFh _emit 08Bh _emit 044h _emit 024h _emit 034h _emit 08Bh _emit 04Ch _emit 024h _emit 030h _emit 0E8h _emit 0D0h _emit 0D1h _emit 0FFh _emit 0FFh _emit 084h _emit 0C0h _emit 075h _emit 029h _emit 08Bh _emit 0C6h _emit 050h _emit 08Bh _emit 0CAh _emit 08Bh _emit 015h
        /* g_101D1B9C */ dword ptr [g_101D1B9C]
        _emit 08Bh _emit 042h _emit 00Ch _emit 051h _emit 055h _emit 050h _emit 0E8h _emit 0D6h _emit 0F3h _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 010h _emit 083h _emit 0F8h _emit 0FFh _emit 075h _emit 00Bh _emit 055h _emit 08Bh _emit 0C3h _emit 0E8h _emit 0D6h _emit 0B3h _emit 001h _emit 000h _emit 083h _emit 0C4h _emit 004h _emit 05Fh _emit 05Eh _emit 05Dh _emit 05Bh _emit 083h _emit 0C4h _emit 018h _emit 0C3h
    }
}
