extern int g_1010C1D4;
extern int g_1010C1E8;
extern int g_101D1BF4;
extern int g_101D1BFC;
extern int g_101D4C6C;
extern int g_101D4C70;
extern int g_101D4C78;

__declspec(naked) void FUN_10011560(void)
{
    __asm {
        _emit 0A1h
        /* g_101D4C78 */ dword ptr [g_101D4C78]
        _emit 083h _emit 0ECh _emit 028h _emit 085h _emit 0C0h _emit 057h _emit 074h _emit 062h _emit 08Bh _emit 015h
        /* g_101D1BFC */ dword ptr [g_101D1BFC]
        _emit 0A1h
        /* g_101D1BF4 */ dword ptr [g_101D1BF4]
        _emit 08Bh _emit 008h _emit 052h _emit 050h _emit 0FFh _emit 051h _emit 03Ch _emit 08Dh _emit 04Ch _emit 024h _emit 004h _emit 051h _emit 050h _emit 0C7h _emit 044h _emit 024h _emit 00Ch _emit 028h _emit 000h _emit 000h _emit 000h _emit 0FFh _emit 015h
        /* g_1010C1D4 */ dword ptr [g_1010C1D4]
        _emit 085h _emit 0C0h _emit 074h _emit 01Dh _emit 08Bh _emit 07Ch _emit 024h _emit 008h _emit 08Bh _emit 054h _emit 024h _emit 010h _emit 08Bh _emit 044h _emit 024h _emit 014h _emit 08Bh _emit 04Ch _emit 024h _emit 00Ch _emit 02Bh _emit 0D7h _emit 02Bh _emit 0C1h _emit 089h _emit 016h _emit 089h _emit 003h _emit 05Fh _emit 083h _emit 0C4h _emit 028h _emit 0C3h _emit 08Bh _emit 03Dh
        /* g_1010C1E8 */ dword ptr [g_1010C1E8]
        _emit 06Ah _emit 000h _emit 0FFh _emit 0D7h _emit 06Ah _emit 001h _emit 089h _emit 006h _emit 0FFh _emit 0D7h _emit 089h _emit 003h _emit 083h _emit 03Eh _emit 000h _emit 07Eh _emit 004h _emit 085h _emit 0C0h _emit 07Fh _emit 010h _emit 08Bh _emit 00Dh
        /* g_101D4C6C */ dword ptr [g_101D4C6C]
        _emit 08Bh _emit 015h
        /* g_101D4C70 */ dword ptr [g_101D4C70]
        _emit 089h _emit 00Eh _emit 089h _emit 013h _emit 05Fh _emit 083h _emit 0C4h _emit 028h _emit 0C3h
    }
}
