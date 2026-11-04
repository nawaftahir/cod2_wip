extern int g_10194008;
extern int g_10194030;
extern int g_101D4810;
extern int g_101D49B0;
extern int g_101D49C8;
extern int g_101D4A1C;
extern int g_101DA9C8;

__declspec(naked) void FUN_1001e4b0(void)
{
    __asm {
        _emit 0A1h
        /* g_101DA9C8 */ dword ptr [g_101DA9C8]
        _emit 08Bh _emit 088h _emit 078h _emit 07Ch _emit 021h _emit 000h _emit 0A1h
        /* g_101D4810 */ dword ptr [g_101D4810]
        _emit 085h _emit 0C0h _emit 056h _emit 08Bh _emit 071h _emit 008h _emit 075h _emit 00Dh _emit 08Bh _emit 044h _emit 024h _emit 008h _emit 085h _emit 0C0h _emit 0B8h _emit 000h _emit 020h _emit 000h _emit 000h _emit 074h _emit 005h _emit 0B8h _emit 000h _emit 010h _emit 000h _emit 000h _emit 08Bh _emit 016h _emit 057h _emit 050h _emit 068h
        /* g_101D49B0 */ dword ptr [g_101D49B0]
        _emit 06Ah _emit 000h _emit 06Ah _emit 000h _emit 056h _emit 0FFh _emit 052h _emit 02Ch _emit 08Bh _emit 0F8h _emit 085h _emit 0FFh _emit 07Dh _emit 02Dh _emit 068h
        /* g_10194030 */ dword ptr [g_10194030]
        _emit 06Ah _emit 000h _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 083h _emit 0C4h _emit 008h _emit 057h _emit 0E8h _emit 035h _emit 019h _emit 00Dh _emit 000h _emit 050h _emit 068h
        /* g_10194008 */ dword ptr [g_10194008]
        _emit 06Ah _emit 000h _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 083h _emit 0C4h _emit 00Ch _emit 0FFh _emit 015h
        /* g_101D4A1C */ dword ptr [g_101D4A1C]
        _emit 0F6h _emit 005h _emit 0B0h
        /* g_101D49B0 */ dword ptr [g_101D49B0]
        _emit 05Fh _emit 074h _emit 010h _emit 08Bh _emit 006h _emit 056h _emit 0FFh _emit 050h _emit 030h _emit 0C7h _emit 005h _emit 0B0h _emit 049h _emit 01Dh _emit 010h
        /* g_101D49B0 */ dword ptr [g_101D49B0]
        _emit 05Eh _emit 0C3h
    }
}
