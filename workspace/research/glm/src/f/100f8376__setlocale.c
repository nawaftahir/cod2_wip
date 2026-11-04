extern int g_1017C690;
extern int g_101A4630;
extern int g_101A4684;
extern int g_101A4FD0;
extern int g_101A5090;
extern int g_101A50CC;
extern int g_101A50D4;
extern int g_101A50E0;
extern int g_101AE164;
extern int g_101AE168;
extern int g_101AE1A8;
extern int g_101AE1AC;
extern int g_1076AC80;
extern int g_1076AC84;
extern int g_1076AC88;
extern int g_1076AC8C;
extern int g_1076AC90;

__declspec(naked) void _setlocale(void)
{
    __asm {
        _emit 06Ah _emit 014h _emit 068h
        /* g_1017C690 */ dword ptr [g_1017C690]
        _emit 0E8h _emit 08Eh _emit 032h _emit 000h _emit 000h _emit 08Bh _emit 07Dh _emit 008h _emit 033h _emit 0DBh _emit 03Bh _emit 0FBh _emit 00Fh _emit 08Ch _emit 039h _emit 001h _emit 000h _emit 000h _emit 083h _emit 0FFh _emit 005h _emit 00Fh _emit 08Fh _emit 030h _emit 001h _emit 000h _emit 000h _emit 06Ah _emit 00Ch _emit 0E8h _emit 0DEh _emit 03Ch _emit 000h _emit 000h _emit 059h _emit 089h _emit 05Dh _emit 0FCh _emit 039h _emit 05Dh _emit 00Ch _emit 075h _emit 01Fh _emit 033h _emit 0C9h _emit 08Bh _emit 0D7h _emit 0E8h _emit 0ECh _emit 0FDh _emit 0FFh _emit 0FFh _emit 08Bh _emit 0F0h _emit 06Ah _emit 0FFh _emit 08Dh _emit 045h _emit 0F0h _emit 050h _emit 0E8h _emit 0E4h _emit 08Ch _emit 000h _emit 000h _emit 059h _emit 059h _emit 08Bh _emit 0C6h _emit 0E9h _emit 003h _emit 001h _emit 000h _emit 000h _emit 06Ah _emit 054h _emit 0E8h _emit 096h _emit 040h _emit 000h _emit 000h _emit 059h _emit 08Bh _emit 0F0h _emit 089h _emit 075h _emit 0DCh _emit 03Bh _emit 0F3h _emit 075h _emit 008h _emit 089h _emit 05Dh _emit 0E4h _emit 0E9h _emit 0C1h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 04Dh _emit 00Ch _emit 08Bh _emit 0D7h _emit 0E8h _emit 0B3h _emit 0FDh _emit 0FFh _emit 0FFh _emit 089h _emit 045h _emit 0E4h _emit 03Bh _emit 0C3h _emit 00Fh _emit 084h _emit 0ACh _emit 000h _emit 000h _emit 000h _emit 089h _emit 01Eh _emit 0A1h
        /* g_101AE1A8 */ dword ptr [g_101AE1A8]
        _emit 089h _emit 046h _emit 004h _emit 0A1h
        /* g_101AE1AC */ dword ptr [g_101AE1AC]
        _emit 089h _emit 046h _emit 008h _emit 033h _emit 0C0h _emit 089h _emit 045h _emit 0E0h _emit 083h _emit 0F8h _emit 005h _emit 07Fh _emit 00Eh _emit 08Bh _emit 00Ch _emit 085h _emit 090h _emit 0E1h _emit 01Ah _emit 010h _emit 089h _emit 04Ch _emit 086h _emit 00Ch _emit 040h _emit 0EBh _emit 0EAh _emit 0A1h
        /* g_101A50D4 */ dword ptr [g_101A50D4]
        _emit 089h _emit 046h _emit 024h _emit 0A1h
        /* g_101A50E0 */ dword ptr [g_101A50E0]
        _emit 089h _emit 046h _emit 028h _emit 0A1h
        /* g_1076AC8C */ dword ptr [g_1076AC8C]
        _emit 089h _emit 046h _emit 02Ch _emit 0A1h
        /* g_1076AC90 */ dword ptr [g_1076AC90]
        _emit 089h _emit 046h _emit 030h _emit 0A1h
        /* g_1076AC88 */ dword ptr [g_1076AC88]
        _emit 089h _emit 046h _emit 034h _emit 0A1h
        /* g_101A50CC */ dword ptr [g_101A50CC]
        _emit 089h _emit 046h _emit 038h _emit 0A1h
        /* g_101AE168 */ dword ptr [g_101AE168]
        _emit 089h _emit 046h _emit 03Ch _emit 0A1h
        /* g_1076AC84 */ dword ptr [g_1076AC84]
        _emit 089h _emit 046h _emit 040h _emit 0A1h
        /* g_1076AC80 */ dword ptr [g_1076AC80]
        _emit 089h _emit 046h _emit 044h _emit 0A1h
        /* g_101A5090 */ dword ptr [g_101A5090]
        _emit 089h _emit 046h _emit 048h _emit 0A1h
        /* g_101A4FD0 */ dword ptr [g_101A4FD0]
        _emit 089h _emit 046h _emit 04Ch _emit 0A1h
        /* g_101AE164 */ dword ptr [g_101AE164]
        _emit 089h _emit 046h _emit 050h _emit 0A1h
        /* g_101A4684 */ dword ptr [g_101A4684]
        _emit 039h _emit 018h _emit 075h _emit 00Eh _emit 03Dh
        /* g_101A4630 */ dword ptr [g_101A4630]
        _emit 074h _emit 007h _emit 050h _emit 0E8h _emit 041h _emit 0F5h _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 035h
        /* g_101A4684 */ dword ptr [g_101A4684]
        _emit 0E8h _emit 005h _emit 0F6h _emit 0FFh _emit 0FFh _emit 039h _emit 05Dh _emit 0E4h _emit 075h _emit 00Bh _emit 03Bh _emit 0F3h _emit 074h _emit 007h _emit 056h _emit 0E8h _emit 020h _emit 000h _emit 000h _emit 000h _emit 059h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 005h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 045h _emit 0E4h _emit 0EBh _emit 00Bh _emit 06Ah _emit 00Ch _emit 0E8h _emit 0EAh _emit 03Ah _emit 000h _emit 000h _emit 059h
    }
}
