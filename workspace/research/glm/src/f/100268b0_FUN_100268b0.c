extern int g_101CE668;
extern int g_101D4928;
extern int g_101D492A;
extern int g_101D49DC;
extern int g_101D4C94;

__declspec(naked) void FUN_100268b0(void)
{
    __asm {
        _emit 053h _emit 00Fh _emit 0B7h _emit 01Dh
        /* g_101D4928 */ dword ptr [g_101D4928]
        _emit 00Fh _emit 0AFh _emit 0DBh _emit 057h _emit 0C1h _emit 0E3h _emit 002h _emit 053h _emit 0FFh _emit 015h
        /* g_101D49DC */ dword ptr [g_101D49DC]
        _emit 00Fh _emit 0B7h _emit 015h
        /* g_101D4928 */ dword ptr [g_101D4928]
        _emit 08Bh _emit 0F8h _emit 08Bh _emit 044h _emit 024h _emit 010h _emit 057h _emit 089h _emit 03Ch _emit 085h _emit 0B0h _emit 06Bh _emit 069h _emit 010h _emit 00Fh _emit 0B7h _emit 005h
        /* g_101D492A */ dword ptr [g_101D492A]
        _emit 06Ah _emit 004h _emit 052h _emit 052h _emit 08Bh _emit 0C8h _emit 0E8h _emit 093h _emit 0F5h _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 014h _emit 0E8h _emit 0FBh _emit 0FDh _emit 0FFh _emit 0FFh _emit 08Bh _emit 00Dh
        /* g_101CE668 */ dword ptr [g_101CE668]
        _emit 08Bh _emit 041h _emit 008h _emit 085h _emit 0C0h _emit 07Eh _emit 00Eh _emit 0A0h
        /* g_101D4C94 */ dword ptr [g_101D4C94]
        _emit 084h _emit 0C0h _emit 074h _emit 005h _emit 0E8h _emit 0D0h _emit 0B6h _emit 0FEh _emit 0FFh _emit 05Fh _emit 05Bh _emit 0C3h
    }
}
