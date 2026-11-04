extern int g_101CE684;
extern int g_101D1B9C;
extern int g_1072DEBD;
extern int g_10764590;

__declspec(naked) void FUN_1003bff0(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 083h _emit 0E4h _emit 0F8h _emit 051h _emit 056h _emit 08Bh _emit 0F0h _emit 0A1h
        /* g_101CE684 */ dword ptr [g_101CE684]
        _emit 08Ah _emit 048h _emit 008h _emit 084h _emit 0C9h _emit 074h _emit 03Ch _emit 08Bh _emit 00Dh
        /* g_101D1B9C */ dword ptr [g_101D1B9C]
        _emit 08Ah _emit 081h _emit 060h _emit 001h _emit 000h _emit 000h _emit 084h _emit 0C0h _emit 074h _emit 02Ch _emit 0A0h
        /* g_1072DEBD */ dword ptr [g_1072DEBD]
        _emit 084h _emit 0C0h _emit 074h _emit 005h _emit 0E8h _emit 05Ch _emit 023h _emit 0FFh _emit 0FFh _emit 08Dh _emit 034h _emit 076h _emit 0C1h _emit 0E6h _emit 004h _emit 081h _emit 0C6h
        /* g_10764590 */ dword ptr [g_10764590]
        _emit 056h _emit 0E8h _emit 01Ah _emit 0F5h _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 004h _emit 056h _emit 0E8h _emit 0C1h _emit 0FEh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 004h _emit 05Eh _emit 08Bh _emit 0E5h _emit 05Dh _emit 0C3h
    }
}
