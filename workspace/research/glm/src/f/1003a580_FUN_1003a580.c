extern int g_10190690;
extern int g_101CE708;
extern int g_1072D9C0;
extern int g_1072DEBC;

__declspec(naked) void FUN_1003a580(void)
{
    __asm {
        _emit 0A0h
        /* g_1072DEBC */ dword ptr [g_1072DEBC]
        _emit 084h _emit 0C0h _emit 056h _emit 074h _emit 005h _emit 0E8h _emit 021h _emit 044h _emit 000h _emit 000h _emit 0A1h
        /* g_1072D9C0 */ dword ptr [g_1072D9C0]
        _emit 083h _emit 0F8h _emit 006h _emit 07Ch _emit 00Fh _emit 083h _emit 0F8h _emit 011h _emit 07Fh _emit 00Ah _emit 0E8h _emit 09Dh _emit 0FDh _emit 0FFh _emit 0FFh _emit 0A1h
        /* g_1072D9C0 */ dword ptr [g_1072D9C0]
        _emit 083h _emit 0F8h _emit 003h _emit 07Ch _emit 00Fh _emit 083h _emit 0F8h _emit 01Ah _emit 07Fh _emit 00Ah _emit 0E8h _emit 059h _emit 0A3h _emit 0FFh _emit 0FFh _emit 0A1h
        /* g_1072D9C0 */ dword ptr [g_1072D9C0]
        _emit 08Bh _emit 015h
        /* g_101CE708 */ dword ptr [g_101CE708]
        _emit 08Bh _emit 072h _emit 008h _emit 033h _emit 0C9h _emit 083h _emit 0FEh _emit 002h _emit 075h _emit 00Fh _emit 083h _emit 0F8h _emit 009h _emit 07Ch _emit 00Ah _emit 083h _emit 0F8h _emit 00Eh _emit 07Fh _emit 005h _emit 0B9h
        /* g_10190690 */ dword ptr [g_10190690]
        _emit 08Bh _emit 054h _emit 024h _emit 008h _emit 051h _emit 08Bh _emit 04Ch _emit 024h _emit 010h _emit 051h _emit 052h _emit 0E8h _emit 015h _emit 0FAh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 00Ch _emit 05Eh _emit 0C3h
    }
}
