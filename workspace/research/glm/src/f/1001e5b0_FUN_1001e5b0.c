extern int g_1010C024;
extern int g_1010C080;
extern int g_101969AC;
extern int g_101CE708;
extern int g_101D49B0;
extern int g_101D49C8;
extern int g_101DA9C8;
extern int g_1076A864;

__declspec(naked) void FUN_1001e5b0(void)
{
    __asm {
        _emit 0A1h
        /* g_101D49B0 */ dword ptr [g_101D49B0]
        _emit 085h _emit 0C0h _emit 075h _emit 004h _emit 083h _emit 0C8h _emit 0FFh _emit 0C3h _emit 08Bh _emit 00Dh
        /* g_101CE708 */ dword ptr [g_101CE708]
        _emit 08Bh _emit 051h _emit 008h _emit 033h _emit 0C0h _emit 083h _emit 0FAh _emit 002h _emit 08Bh _emit 015h
        /* g_101DA9C8 */ dword ptr [g_101DA9C8]
        _emit 00Fh _emit 095h _emit 0C0h _emit 056h _emit 048h _emit 083h _emit 0E0h _emit 0E4h _emit 083h _emit 0C0h _emit 040h _emit 00Fh _emit 0AFh _emit 044h _emit 024h _emit 008h _emit 050h _emit 08Bh _emit 082h _emit 078h _emit 07Ch _emit 021h _emit 000h _emit 050h _emit 0FFh _emit 015h
        /* g_1010C024 */ dword ptr [g_1010C024]
        _emit 08Bh _emit 015h
        /* g_101DA9C8 */ dword ptr [g_101DA9C8]
        _emit 08Bh _emit 08Ah _emit 078h _emit 07Ch _emit 021h _emit 000h _emit 08Bh _emit 031h _emit 03Bh _emit 071h _emit 004h _emit 07Eh _emit 036h _emit 03Bh _emit 041h _emit 004h _emit 07Fh _emit 00Eh _emit 050h _emit 051h _emit 0FFh _emit 015h
        /* g_1010C080 */ dword ptr [g_1010C080]
        _emit 08Bh _emit 015h
        /* g_101DA9C8 */ dword ptr [g_101DA9C8]
        _emit 08Bh _emit 012h _emit 039h _emit 015h
        /* g_1076A864 */ dword ptr [g_1076A864]
        _emit 074h _emit 016h _emit 068h
        /* g_101969AC */ dword ptr [g_101969AC]
        _emit 06Ah _emit 002h _emit 089h _emit 015h
        /* g_1076A864 */ dword ptr [g_1076A864]
        _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 083h _emit 0C4h _emit 008h _emit 083h _emit 0C8h _emit 0FFh _emit 05Eh _emit 0C3h
    }
}
