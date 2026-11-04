extern int g_101D4B3C;
extern int g_101D4B48;

__declspec(naked) void FUN_100296a0(void)
{
    __asm {
        _emit 083h _emit 0ECh _emit 008h _emit 055h _emit 056h _emit 057h _emit 053h _emit 033h _emit 0FFh _emit 0FFh _emit 015h
        /* g_101D4B48 */ dword ptr [g_101D4B48]
        _emit 08Bh _emit 0E8h _emit 083h _emit 0C4h _emit 004h _emit 033h _emit 0F6h _emit 085h _emit 0EDh _emit 07Eh _emit 026h _emit 08Dh _emit 09Bh _emit 000h _emit 000h _emit 000h _emit 000h _emit 08Dh _emit 044h _emit 024h _emit 00Ch _emit 050h _emit 056h _emit 08Dh _emit 04Ch _emit 024h _emit 018h _emit 051h _emit 053h _emit 0FFh _emit 015h
        /* g_101D4B3C */ dword ptr [g_101D4B3C]
        _emit 083h _emit 0C4h _emit 010h _emit 03Bh _emit 0F8h _emit 07Dh _emit 002h _emit 08Bh _emit 0F8h _emit 046h _emit 03Bh _emit 0F5h _emit 07Ch _emit 0E0h _emit 08Bh _emit 0C7h _emit 05Fh _emit 05Eh _emit 05Dh _emit 083h _emit 0C4h _emit 008h _emit 0C3h
    }
}
