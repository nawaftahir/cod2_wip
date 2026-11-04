extern int g_10194210;
extern int g_10198904;
extern int g_1019890C;
extern int g_10764584;

__declspec(naked) void FUN_10037810(void)
{
    __asm {
        _emit 051h _emit 0A1h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 085h _emit 0C0h _emit 075h _emit 054h _emit 068h
        /* g_1019890C */ dword ptr [g_1019890C]
        _emit 068h
        /* g_10198904 */ dword ptr [g_10198904]
        _emit 0E8h _emit 0C9h _emit 0F4h _emit 00Bh _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 085h _emit 0C0h _emit 0A3h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 074h _emit 039h _emit 08Dh _emit 004h _emit 024h _emit 050h _emit 0E8h _emit 0C6h _emit 0F7h _emit 00Bh _emit 000h _emit 08Dh _emit 04Ch _emit 024h _emit 004h _emit 051h _emit 0E8h _emit 03Ch _emit 0F6h _emit 00Bh _emit 000h _emit 050h _emit 0E8h _emit 02Bh _emit 0F5h _emit 00Bh _emit 000h _emit 08Bh _emit 015h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 050h _emit 068h
        /* g_10194210 */ dword ptr [g_10194210]
        _emit 052h _emit 0E8h _emit 0A5h _emit 0F4h _emit 00Bh _emit 000h _emit 0A1h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 050h _emit 0E8h _emit 0D2h _emit 0F3h _emit 00Bh _emit 000h _emit 083h _emit 0C4h _emit 01Ch _emit 059h _emit 0C3h
    }
}
