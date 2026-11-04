extern int g_101CE700;
extern int g_101CE7A0;
extern int g_101CE7F0;
extern int g_101D1B10;

__declspec(naked) void FUN_10038920(void)
{
    __asm {
        _emit 051h _emit 08Bh _emit 002h _emit 083h _emit 038h _emit 003h _emit 075h _emit 057h _emit 00Fh _emit 0B6h _emit 04Fh _emit 005h _emit 083h _emit 0F9h _emit 005h _emit 077h _emit 04Eh _emit 0FFh _emit 024h _emit 08Dh _emit 084h _emit 089h _emit 003h _emit 010h _emit 0A1h
        /* g_101CE7A0 */ dword ptr [g_101CE7A0]
        _emit 08Bh _emit 0CEh _emit 0E8h _emit 0ACh _emit 0FFh _emit 0FFh _emit 0FFh _emit 059h _emit 0C3h _emit 0A1h
        /* g_101CE700 */ dword ptr [g_101CE700]
        _emit 08Bh _emit 0CEh _emit 0E8h _emit 09Eh _emit 0FFh _emit 0FFh _emit 0FFh _emit 059h _emit 0C3h _emit 0A1h
        /* g_101CE7F0 */ dword ptr [g_101CE7F0]
        _emit 083h _emit 078h _emit 008h _emit 001h _emit 075h _emit 020h _emit 08Bh _emit 00Dh
        /* g_101D1B10 */ dword ptr [g_101D1B10]
        _emit 089h _emit 00Ah _emit 0C6h _emit 006h _emit 001h _emit 059h _emit 0C3h _emit 08Bh _emit 057h _emit 008h _emit 08Bh _emit 04Ah _emit 01Ch _emit 051h _emit 050h _emit 0E8h _emit 097h _emit 03Fh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 008h _emit 0C6h _emit 006h _emit 006h _emit 059h _emit 0C3h
    }
}
