extern int g_1017C6A0;
extern int g_1076AC94;
extern int g_1076AC98;

__declspec(naked) void _free(void)
{
    __asm {
        _emit 06Ah _emit 00Ch _emit 068h
        /* g_1017C6A0 */ dword ptr [g_1017C6A0]
        _emit 0E8h _emit 034h _emit 031h _emit 000h _emit 000h _emit 08Bh _emit 075h _emit 008h _emit 085h _emit 0F6h _emit 074h _emit 058h _emit 083h _emit 03Dh _emit 098h
        /* g_1076AC98 */ dword ptr [g_1076AC98]
        _emit 075h _emit 040h _emit 06Ah _emit 004h _emit 0E8h _emit 08Ah _emit 03Bh _emit 000h _emit 000h _emit 059h _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 056h _emit 0E8h _emit 0ADh _emit 08Ch _emit 000h _emit 000h _emit 059h _emit 089h _emit 045h _emit 0E4h _emit 085h _emit 0C0h _emit 074h _emit 009h _emit 056h _emit 050h _emit 0E8h _emit 0C9h _emit 08Ch _emit 000h _emit 000h _emit 059h _emit 059h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 00Bh _emit 000h _emit 000h _emit 000h _emit 083h _emit 07Dh _emit 0E4h _emit 000h _emit 075h _emit 01Dh _emit 0FFh _emit 075h _emit 008h _emit 0EBh _emit 00Ah _emit 06Ah _emit 004h _emit 0E8h _emit 086h _emit 03Ah _emit 000h _emit 000h _emit 059h _emit 0C3h _emit 056h _emit 06Ah _emit 000h _emit 0FFh _emit 035h
        /* g_1076AC94 */ dword ptr [g_1076AC94]
        _emit 0FFh _emit 015h _emit 004h
    }
}
