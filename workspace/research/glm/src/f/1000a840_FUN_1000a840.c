extern int g_10678514;
extern int g_10678520;

__declspec(naked) void FUN_1000a840(void)
{
    __asm {
        _emit 051h _emit 0A1h
        /* g_10678514 */ dword ptr [g_10678514]
        _emit 055h _emit 08Bh _emit 06Ch _emit 024h _emit 00Ch _emit 057h _emit 033h _emit 0FFh _emit 085h _emit 0C0h _emit 07Eh _emit 064h _emit 056h _emit 0BEh
        /* g_10678520 */ dword ptr [g_10678520]
        _emit 033h _emit 0D2h _emit 085h _emit 0DBh _emit 07Eh _emit 03Ch _emit 0D9h _emit 046h _emit 008h _emit 08Dh _emit 04Dh _emit 004h _emit 0D9h _emit 0E0h _emit 0D9h _emit 05Ch _emit 024h _emit 00Ch _emit 08Dh _emit 09Bh _emit 000h _emit 000h _emit 000h _emit 000h _emit 0D9h _emit 041h _emit 0FCh _emit 0D8h _emit 04Eh _emit 0FCh _emit 0D9h _emit 041h _emit 004h _emit 0D8h _emit 04Eh _emit 004h _emit 0DEh _emit 0C1h _emit 0D9h _emit 006h _emit 0D8h _emit 009h _emit 0DEh _emit 0C1h _emit 0D8h _emit 041h _emit 008h _emit 0D8h _emit 05Ch _emit 024h _emit 00Ch _emit 0DFh _emit 0E0h _emit 0F6h _emit 0C4h _emit 005h _emit 07Bh _emit 028h _emit 042h _emit 083h _emit 0C1h _emit 014h _emit 03Bh _emit 0D3h _emit 07Ch _emit 0D6h _emit 033h _emit 0C0h _emit 083h _emit 0F8h _emit 002h _emit 00Fh _emit 094h _emit 0C0h _emit 088h _emit 087h _emit 098h _emit 08Ah _emit 067h _emit 010h _emit 0A1h
        /* g_10678514 */ dword ptr [g_10678514]
        _emit 047h _emit 083h _emit 0C6h _emit 02Ch _emit 03Bh _emit 0F8h _emit 07Ch _emit 0A3h _emit 05Eh _emit 05Fh _emit 05Dh _emit 059h _emit 0C3h _emit 0B8h _emit 002h _emit 000h _emit 000h _emit 000h _emit 0EBh _emit 0DBh
    }
}
