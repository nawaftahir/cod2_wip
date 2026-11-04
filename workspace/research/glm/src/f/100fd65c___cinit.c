extern int g_100FDF09;
extern int g_1019E000;
extern int g_1019E008;
extern int g_1019E00C;
extern int g_1019E020;
extern int g_101A461C;

__declspec(naked) void __cinit(void)
{
    __asm {
        _emit 0A1h
        /* g_101A461C */ dword ptr [g_101A461C]
        _emit 085h _emit 0C0h _emit 074h _emit 007h _emit 0FFh _emit 074h _emit 024h _emit 004h _emit 0FFh _emit 0D0h _emit 059h _emit 056h _emit 057h _emit 0B9h
        /* g_1019E00C */ dword ptr [g_1019E00C]
        _emit 0BFh
        /* g_1019E020 */ dword ptr [g_1019E020]
        _emit 033h _emit 0C0h _emit 03Bh _emit 0CFh _emit 08Bh _emit 0F1h _emit 073h _emit 017h _emit 085h _emit 0C0h _emit 075h _emit 03Fh _emit 08Bh _emit 00Eh _emit 085h _emit 0C9h _emit 074h _emit 002h _emit 0FFh _emit 0D1h _emit 083h _emit 0C6h _emit 004h _emit 03Bh _emit 0F7h _emit 072h _emit 0EDh _emit 085h _emit 0C0h _emit 075h _emit 02Ch _emit 068h
        /* g_100FDF09 */ dword ptr [g_100FDF09]
        _emit 0E8h _emit 0D2h _emit 0ABh _emit 000h _emit 000h _emit 0BEh
        /* g_1019E000 */ dword ptr [g_1019E000]
        _emit 08Bh _emit 0C6h _emit 0BFh
        /* g_1019E008 */ dword ptr [g_1019E008]
        _emit 03Bh _emit 0C7h _emit 059h _emit 073h _emit 00Fh _emit 08Bh _emit 006h _emit 085h _emit 0C0h _emit 074h _emit 002h _emit 0FFh _emit 0D0h _emit 083h _emit 0C6h _emit 004h _emit 03Bh _emit 0F7h _emit 072h _emit 0F1h _emit 033h _emit 0C0h _emit 05Fh _emit 05Eh _emit 0C3h
    }
}
