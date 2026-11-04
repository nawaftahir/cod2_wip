extern int g_101D4B98;
extern int g_101D4BA0;
extern int g_101D4BD8;

__declspec(naked) void FUN_1001d9f0(void)
{
    __asm {
        _emit 051h _emit 055h _emit 08Bh _emit 06Ch _emit 024h _emit 014h _emit 056h _emit 057h _emit 053h _emit 08Bh _emit 0F0h _emit 0FFh _emit 015h
        /* g_101D4B98 */ dword ptr [g_101D4B98]
        _emit 08Bh _emit 0F8h _emit 08Bh _emit 046h _emit 038h _emit 050h _emit 08Dh _emit 046h _emit 03Ch _emit 0E8h _emit 051h _emit 0FFh _emit 0FFh _emit 0FFh _emit 0D9h _emit 05Ch _emit 024h _emit 014h _emit 083h _emit 0C4h _emit 008h _emit 033h _emit 0F6h _emit 085h _emit 0FFh _emit 07Eh _emit 01Ch _emit 08Dh _emit 064h _emit 024h _emit 000h _emit 08Bh _emit 04Ch _emit 024h _emit 00Ch _emit 051h _emit 056h _emit 053h _emit 0FFh _emit 015h
        /* g_101D4BD8 */ dword ptr [g_101D4BD8]
        _emit 083h _emit 0C4h _emit 00Ch _emit 088h _emit 004h _emit 02Eh _emit 046h _emit 03Bh _emit 0F7h _emit 07Ch _emit 0E8h _emit 08Bh _emit 054h _emit 024h _emit 018h _emit 08Bh _emit 044h _emit 024h _emit 014h _emit 055h _emit 052h _emit 050h _emit 053h _emit 0FFh _emit 015h
        /* g_101D4BA0 */ dword ptr [g_101D4BA0]
        _emit 083h _emit 0C4h _emit 010h _emit 05Fh _emit 05Eh _emit 05Dh _emit 059h _emit 0C3h
    }
}
