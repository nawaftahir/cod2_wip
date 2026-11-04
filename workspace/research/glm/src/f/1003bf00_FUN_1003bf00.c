extern int g_1019BC84;
extern int g_101CE708;
extern int g_101D1B9C;
extern int g_1072DDC8;

__declspec(naked) void FUN_1003bf00(void)
{
    __asm {
        _emit 08Bh _emit 00Dh
        /* g_101D1B9C */ dword ptr [g_101D1B9C]
        _emit 0A1h
        /* g_1072DDC8 */ dword ptr [g_1072DDC8]
        _emit 0D9h _emit 081h _emit 0BCh _emit 001h _emit 000h _emit 000h _emit 0D8h _emit 048h _emit 014h _emit 0D9h _emit 081h _emit 0B8h _emit 001h _emit 000h _emit 000h _emit 0D8h _emit 048h _emit 010h _emit 0DEh _emit 0C1h _emit 0D9h _emit 081h _emit 0B4h _emit 001h _emit 000h _emit 000h _emit 0D8h _emit 048h _emit 00Ch _emit 08Bh _emit 044h _emit 024h _emit 004h _emit 0DEh _emit 0C1h _emit 0D9h _emit 0C0h _emit 0D9h _emit 058h _emit 01Ch _emit 0D8h _emit 01Dh
        /* g_1019BC84 */ dword ptr [g_1019BC84]
        _emit 0DFh _emit 0E0h _emit 0F6h _emit 0C4h _emit 041h _emit 07Bh _emit 016h _emit 08Bh _emit 00Dh
        /* g_101CE708 */ dword ptr [g_101CE708]
        _emit 083h _emit 079h _emit 008h _emit 002h _emit 075h _emit 005h _emit 0E9h _emit 0FFh _emit 0F7h _emit 0FFh _emit 0FFh _emit 0E9h _emit 03Ah _emit 0FAh _emit 0FFh _emit 0FFh _emit 0C3h
    }
}
