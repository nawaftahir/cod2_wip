extern int g_1017C440;
extern int g_1076ADB8;
extern int g_1076BDC0;

__declspec(naked) void flsall(void)
{
    __asm {
        _emit 06Ah _emit 014h _emit 068h
        /* g_1017C440 */ dword ptr [g_1017C440]
        _emit 0E8h _emit 09Ch _emit 04Ah _emit 000h _emit 000h _emit 033h _emit 0FFh _emit 089h _emit 07Dh _emit 0E4h _emit 089h _emit 07Dh _emit 0DCh _emit 06Ah _emit 001h _emit 0E8h _emit 0FAh _emit 054h _emit 000h _emit 000h _emit 059h _emit 089h _emit 07Dh _emit 0FCh _emit 033h _emit 0F6h _emit 089h _emit 075h _emit 0E0h _emit 03Bh _emit 035h
        /* g_1076BDC0 */ dword ptr [g_1076BDC0]
        _emit 00Fh _emit 08Dh _emit 081h _emit 000h _emit 000h _emit 000h _emit 0A1h
        /* g_1076ADB8 */ dword ptr [g_1076ADB8]
        _emit 08Bh _emit 004h _emit 0B0h _emit 03Bh _emit 0C7h _emit 074h _emit 05Ch _emit 0F6h _emit 040h _emit 00Ch _emit 083h _emit 074h _emit 056h _emit 050h _emit 056h _emit 0E8h _emit 037h _emit 049h _emit 000h _emit 000h _emit 059h _emit 059h _emit 033h _emit 0D2h _emit 042h _emit 089h _emit 055h _emit 0FCh _emit 0A1h
        /* g_1076ADB8 */ dword ptr [g_1076ADB8]
        _emit 08Bh _emit 004h _emit 0B0h _emit 08Bh _emit 048h _emit 00Ch _emit 0F6h _emit 0C1h _emit 083h _emit 074h _emit 02Fh _emit 039h _emit 055h _emit 008h _emit 075h _emit 011h _emit 050h _emit 0E8h _emit 066h _emit 0FFh _emit 0FFh _emit 0FFh _emit 059h _emit 083h _emit 0F8h _emit 0FFh _emit 074h _emit 01Eh _emit 0FFh _emit 045h _emit 0E4h _emit 0EBh _emit 019h _emit 039h _emit 07Dh _emit 008h _emit 075h _emit 014h _emit 0F6h _emit 0C1h _emit 002h _emit 074h _emit 00Fh _emit 050h _emit 0E8h _emit 04Bh _emit 0FFh _emit 0FFh _emit 0FFh _emit 059h _emit 083h _emit 0F8h _emit 0FFh _emit 075h _emit 003h _emit 009h _emit 045h _emit 0DCh _emit 089h _emit 07Dh _emit 0FCh _emit 0E8h _emit 008h _emit 000h _emit 000h _emit 000h _emit 046h _emit 0EBh _emit 086h _emit 033h _emit 0FFh _emit 08Bh _emit 075h _emit 0E0h _emit 0A1h
        /* g_1076ADB8 */ dword ptr [g_1076ADB8]
        _emit 0FFh _emit 034h _emit 0B0h _emit 056h _emit 0E8h _emit 024h _emit 049h _emit 000h _emit 000h _emit 059h _emit 059h _emit 0C3h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h
    }
}
