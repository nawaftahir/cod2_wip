extern int g_1010C0C4;
extern int g_1010C0C8;
extern int g_101821E0;
extern int g_101AE1A8;
extern int g_101AE1D8;
extern int g_1076AA30;
extern int g_1076AA34;
extern int g_1076AA38;
extern int g_1076AB44;

__declspec(naked) void __setmbcp(void)
{
    __asm {
        _emit 06Ah _emit 014h _emit 068h
        /* g_101821E0 */ dword ptr [g_101821E0]
        _emit 0E8h _emit 076h _emit 045h _emit 0FFh _emit 0FFh _emit 083h _emit 04Dh _emit 0E0h _emit 0FFh _emit 06Ah _emit 00Dh _emit 0E8h _emit 0D8h _emit 04Fh _emit 0FFh _emit 0FFh _emit 059h _emit 033h _emit 0FFh _emit 089h _emit 07Dh _emit 0FCh _emit 089h _emit 03Dh
        /* g_101AE1D8 */ dword ptr [g_101AE1D8]
        _emit 08Bh _emit 045h _emit 008h _emit 083h _emit 0F8h _emit 0FEh _emit 075h _emit 012h _emit 0C7h _emit 005h _emit 0D8h _emit 0E1h _emit 01Ah _emit 010h
        /* g_101AE1D8 */ dword ptr [g_101AE1D8]
        _emit 0FFh _emit 015h
        /* g_1010C0C4 */ dword ptr [g_1010C0C4]
        _emit 0EBh _emit 02Bh _emit 083h _emit 0F8h _emit 0FDh _emit 075h _emit 012h _emit 0C7h _emit 005h _emit 0D8h _emit 0E1h _emit 01Ah _emit 010h
        /* g_101AE1D8 */ dword ptr [g_101AE1D8]
        _emit 0FFh _emit 015h
        /* g_1010C0C8 */ dword ptr [g_1010C0C8]
        _emit 0EBh _emit 014h _emit 083h _emit 0F8h _emit 0FCh _emit 075h _emit 00Fh _emit 0C7h _emit 005h _emit 0D8h _emit 0E1h _emit 01Ah _emit 010h
        /* g_101AE1D8 */ dword ptr [g_101AE1D8]
        _emit 0A1h
        /* g_101AE1A8 */ dword ptr [g_101AE1A8]
        _emit 089h _emit 045h _emit 008h _emit 03Bh _emit 005h
        /* g_1076AB44 */ dword ptr [g_1076AB44]
        _emit 00Fh _emit 084h _emit 0BBh _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 035h
        /* g_1076AA34 */ dword ptr [g_1076AA34]
        _emit 089h _emit 075h _emit 0DCh _emit 03Bh _emit 0F7h _emit 074h _emit 004h _emit 039h _emit 03Eh _emit 074h _emit 010h _emit 068h _emit 020h _emit 002h _emit 000h _emit 000h _emit 0E8h _emit 044h _emit 053h _emit 0FFh _emit 0FFh _emit 059h _emit 08Bh _emit 0F0h _emit 089h _emit 075h _emit 0DCh _emit 03Bh _emit 0F7h _emit 074h _emit 07Fh _emit 0FFh _emit 075h _emit 008h _emit 0E8h _emit 0BCh _emit 0FDh _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 045h _emit 0E0h _emit 03Bh _emit 0C7h _emit 075h _emit 06Fh _emit 089h _emit 03Eh _emit 0A1h
        /* g_1076AB44 */ dword ptr [g_1076AB44]
        _emit 089h _emit 046h _emit 004h _emit 0A1h
        /* g_1076AA38 */ dword ptr [g_1076AA38]
        _emit 089h _emit 046h _emit 008h _emit 0A1h
        /* g_1076AA30 */ dword ptr [g_1076AA30]
        _emit 089h _emit 046h _emit 00Ch _emit 033h _emit 0C0h _emit 089h _emit 045h _emit 0E4h _emit 083h _emit 0F8h _emit 005h _emit 07Dh _emit 010h _emit 066h _emit 08Bh _emit 00Ch _emit 045h _emit 050h _emit 0ABh _emit 076h _emit 010h _emit 066h _emit 089h _emit 04Ch _emit 046h _emit 010h _emit 040h _emit 0EBh _emit 0E8h _emit 033h _emit 0C0h _emit 089h _emit 045h _emit 0E4h _emit 03Dh _emit 001h _emit 001h _emit 000h _emit 000h _emit 07Dh _emit 00Dh _emit 08Ah _emit 088h _emit 040h _emit 0AAh _emit 076h _emit 010h _emit 088h _emit 04Ch _emit 030h _emit 01Ch _emit 040h _emit 0EBh _emit 0E9h _emit 033h _emit 0C0h _emit 089h _emit 045h _emit 0E4h _emit 03Dh _emit 000h _emit 001h _emit 000h _emit 000h _emit 07Dh _emit 010h _emit 08Ah _emit 088h _emit 060h _emit 0ABh _emit 076h _emit 010h _emit 088h _emit 08Ch _emit 030h _emit 01Dh _emit 001h _emit 000h _emit 000h _emit 040h _emit 0EBh _emit 0E6h _emit 089h _emit 035h
        /* g_1076AA34 */ dword ptr [g_1076AA34]
        _emit 083h _emit 07Dh _emit 0E0h _emit 0FFh _emit 075h _emit 014h _emit 03Bh _emit 035h
        /* g_1076AA34 */ dword ptr [g_1076AA34]
        _emit 074h _emit 00Ch _emit 056h _emit 0E8h _emit 013h _emit 013h _emit 0FFh _emit 0FFh _emit 059h _emit 0EBh _emit 003h _emit 089h _emit 07Dh _emit 0E0h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 009h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 045h _emit 0E0h _emit 0E8h _emit 077h _emit 044h _emit 0FFh _emit 0FFh _emit 0C3h
    }
}
