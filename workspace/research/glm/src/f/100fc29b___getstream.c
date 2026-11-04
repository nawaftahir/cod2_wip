extern int g_1010C030;
extern int g_1017C8C0;
extern int g_1076ADB8;
extern int g_1076BDC0;

__declspec(naked) void __getstream(void)
{
    __asm {
        _emit 06Ah _emit 010h _emit 068h
        /* g_1017C8C0 */ dword ptr [g_1017C8C0]
        _emit 0E8h _emit 069h _emit 0F3h _emit 0FFh _emit 0FFh _emit 033h _emit 0DBh _emit 033h _emit 0FFh _emit 089h _emit 07Dh _emit 0E4h _emit 06Ah _emit 001h _emit 0E8h _emit 0C8h _emit 0FDh _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 05Dh _emit 0FCh _emit 033h _emit 0F6h _emit 089h _emit 075h _emit 0E0h _emit 03Bh _emit 035h
        /* g_1076BDC0 */ dword ptr [g_1076BDC0]
        _emit 00Fh _emit 08Dh _emit 0C0h _emit 000h _emit 000h _emit 000h _emit 0A1h
        /* g_1076ADB8 */ dword ptr [g_1076ADB8]
        _emit 08Bh _emit 004h _emit 0B0h _emit 03Bh _emit 0C3h _emit 074h _emit 050h _emit 0F6h _emit 040h _emit 00Ch _emit 083h _emit 075h _emit 043h _emit 083h _emit 0FEh _emit 002h _emit 07Eh _emit 017h _emit 083h _emit 0FEh _emit 014h _emit 07Dh _emit 012h _emit 08Dh _emit 046h _emit 010h _emit 050h _emit 0E8h _emit 0EEh _emit 0FCh _emit 0FFh _emit 0FFh _emit 059h _emit 085h _emit 0C0h _emit 00Fh _emit 084h _emit 092h _emit 000h _emit 000h _emit 000h _emit 0A1h
        /* g_1076ADB8 */ dword ptr [g_1076ADB8]
        _emit 0FFh _emit 034h _emit 0B0h _emit 056h _emit 0E8h _emit 0E2h _emit 0F1h _emit 0FFh _emit 0FFh _emit 059h _emit 059h _emit 0A1h
        /* g_1076ADB8 */ dword ptr [g_1076ADB8]
        _emit 08Bh _emit 004h _emit 0B0h _emit 0F6h _emit 040h _emit 00Ch _emit 083h _emit 074h _emit 00Ch _emit 050h _emit 056h _emit 0E8h _emit 01Dh _emit 0F2h _emit 0FFh _emit 0FFh _emit 059h _emit 059h _emit 046h _emit 0EBh _emit 099h _emit 08Bh _emit 0F8h _emit 0EBh _emit 061h _emit 0C1h _emit 0E6h _emit 002h _emit 06Ah _emit 038h _emit 0E8h _emit 034h _emit 001h _emit 000h _emit 000h _emit 059h _emit 08Bh _emit 00Dh
        /* g_1076ADB8 */ dword ptr [g_1076ADB8]
        _emit 089h _emit 004h _emit 00Eh _emit 0A1h
        /* g_1076ADB8 */ dword ptr [g_1076ADB8]
        _emit 08Bh _emit 004h _emit 006h _emit 03Bh _emit 0C3h _emit 074h _emit 044h _emit 068h _emit 0A0h _emit 00Fh _emit 000h _emit 000h _emit 083h _emit 0C0h _emit 020h _emit 050h _emit 0E8h _emit 012h _emit 0B7h _emit 000h _emit 000h _emit 059h _emit 059h _emit 085h _emit 0C0h _emit 0A1h
        /* g_1076ADB8 */ dword ptr [g_1076ADB8]
        _emit 075h _emit 013h _emit 0FFh _emit 034h _emit 006h _emit 0E8h _emit 069h _emit 0C1h _emit 0FFh _emit 0FFh _emit 059h _emit 0A1h
        /* g_1076ADB8 */ dword ptr [g_1076ADB8]
        _emit 089h _emit 01Ch _emit 006h _emit 0EBh _emit 018h _emit 08Bh _emit 004h _emit 006h _emit 083h _emit 0C0h _emit 020h _emit 050h _emit 0FFh _emit 015h
        /* g_1010C030 */ dword ptr [g_1010C030]
        _emit 0A1h
        /* g_1076ADB8 */ dword ptr [g_1076ADB8]
        _emit 08Bh _emit 03Ch _emit 006h _emit 089h _emit 07Dh _emit 0E4h _emit 03Bh _emit 0FBh _emit 074h _emit 012h _emit 089h _emit 05Fh _emit 004h _emit 089h _emit 05Fh _emit 00Ch _emit 089h _emit 05Fh _emit 008h _emit 089h _emit 01Fh _emit 089h _emit 05Fh _emit 01Ch _emit 083h _emit 04Fh _emit 010h _emit 0FFh _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 00Bh _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 0C7h _emit 0E8h _emit 09Bh _emit 0F2h _emit 0FFh _emit 0FFh _emit 0C3h
    }
}
