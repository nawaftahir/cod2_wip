extern int g_10193CBC;
extern int g_10193CD8;
extern int g_101D1BF8;
extern int g_101D49C8;
extern int g_107645BC;
extern int g_1076467C;

__declspec(naked) void FUN_10012198(void)
{
    __asm {
        _emit 053h _emit 056h _emit 057h _emit 0BBh
        /* g_107645BC */ dword ptr [g_107645BC]
        _emit 033h _emit 0F6h _emit 08Dh _emit 07Bh _emit 0F8h _emit 0A1h
        /* g_101D1BF8 */ dword ptr [g_101D1BF8]
        _emit 08Bh _emit 010h _emit 057h _emit 06Ah _emit 009h _emit 050h _emit 0FFh _emit 092h _emit 0D8h _emit 001h _emit 000h _emit 000h _emit 085h _emit 0C0h _emit 07Dh _emit 018h _emit 050h _emit 050h _emit 0E8h _emit 07Bh _emit 0DCh _emit 00Dh _emit 000h _emit 050h _emit 068h
        /* g_10193CD8 */ dword ptr [g_10193CD8]
        _emit 06Ah _emit 000h _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 083h _emit 0C4h _emit 010h _emit 0C6h _emit 004h _emit 033h _emit 000h _emit 046h _emit 083h _emit 0C7h _emit 004h _emit 083h _emit 0FEh _emit 002h _emit 07Ch _emit 0C6h _emit 083h _emit 0C3h _emit 030h _emit 081h _emit 0FBh
        /* g_1076467C */ dword ptr [g_1076467C]
        _emit 07Ch _emit 0B6h _emit 068h
        /* g_10193CBC */ dword ptr [g_10193CBC]
        _emit 06Ah _emit 000h _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 083h _emit 0C4h _emit 008h _emit 0E8h _emit 0A1h _emit 0A0h _emit 002h _emit 000h _emit 05Fh _emit 05Eh _emit 0B0h _emit 001h _emit 05Bh _emit 0C3h
    }
}
