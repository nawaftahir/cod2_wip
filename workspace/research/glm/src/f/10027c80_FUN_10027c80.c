extern int g_10191368;
extern int g_10191488;
extern int g_1019BDC8;
extern int g_101D1B50;
extern int g_101D4C6C;

__declspec(naked) void FUN_10027c80(void)
{
    __asm {
        _emit 083h _emit 0ECh _emit 044h _emit 0DBh _emit 005h
        /* g_101D4C6C */ dword ptr [g_101D4C6C]
        _emit 056h _emit 057h _emit 08Dh _emit 044h _emit 024h _emit 00Ch _emit 0D9h _emit 05Ch _emit 024h _emit 008h _emit 068h _emit 000h _emit 000h _emit 080h _emit 03Fh _emit 0D9h _emit 044h _emit 024h _emit 00Ch _emit 0B9h _emit 010h _emit 000h _emit 000h _emit 000h _emit 0D8h _emit 00Dh
        /* g_1019BDC8 */ dword ptr [g_1019BDC8]
        _emit 0BEh
        /* g_10191368 */ dword ptr [g_10191368]
        _emit 08Dh _emit 07Ch _emit 024h _emit 010h _emit 050h _emit 0D9h _emit 05Ch _emit 024h _emit 010h _emit 0F3h _emit 0A5h _emit 0E8h _emit 024h _emit 09Eh _emit 0FFh _emit 0FFh _emit 08Bh _emit 00Dh
        /* g_101D1B50 */ dword ptr [g_101D1B50]
        _emit 08Bh _emit 044h _emit 024h _emit 010h _emit 051h _emit 068h
        /* g_10191488 */ dword ptr [g_10191488]
        _emit 068h _emit 000h _emit 000h _emit 080h _emit 03Fh _emit 068h _emit 000h _emit 000h _emit 080h _emit 03Fh _emit 06Ah _emit 000h _emit 06Ah _emit 000h _emit 050h _emit 050h _emit 068h _emit 000h _emit 000h _emit 080h _emit 040h _emit 068h _emit 000h _emit 000h _emit 080h _emit 040h _emit 0E8h _emit 015h _emit 094h _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 030h _emit 05Fh _emit 05Eh _emit 083h _emit 0C4h _emit 044h _emit 0C3h
    }
}
