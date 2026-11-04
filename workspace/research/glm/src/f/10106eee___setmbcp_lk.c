extern int g_1010C188;
extern int g_101A50D0;
extern int g_101AE1D8;
extern int g_1076AA30;
extern int g_1076AA38;
extern int g_1076AA40;
extern int g_1076AB44;
extern int g_1076AB50;

__declspec(naked) void __setmbcp_lk(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 083h _emit 0ECh _emit 01Ch _emit 0A1h
        /* g_101A50D0 */ dword ptr [g_101A50D0]
        _emit 053h _emit 056h _emit 08Bh _emit 075h _emit 008h _emit 033h _emit 0DBh _emit 03Bh _emit 0F3h _emit 089h _emit 045h _emit 0FCh _emit 057h _emit 00Fh _emit 084h _emit 054h _emit 001h _emit 000h _emit 000h _emit 033h _emit 0D2h _emit 033h _emit 0C0h _emit 039h _emit 0B0h _emit 0C8h _emit 054h _emit 01Ah _emit 010h _emit 074h _emit 065h _emit 083h _emit 0C0h _emit 030h _emit 042h _emit 03Dh _emit 0F0h _emit 000h _emit 000h _emit 000h _emit 072h _emit 0EDh _emit 08Dh _emit 045h _emit 0E8h _emit 050h _emit 056h _emit 0FFh _emit 015h
        /* g_1010C188 */ dword ptr [g_1010C188]
        _emit 083h _emit 0F8h _emit 001h _emit 00Fh _emit 085h _emit 021h _emit 001h _emit 000h _emit 000h _emit 06Ah _emit 040h _emit 033h _emit 0C0h _emit 083h _emit 07Dh _emit 0E8h _emit 001h _emit 059h _emit 0BFh
        /* g_1076AA40 */ dword ptr [g_1076AA40]
        _emit 0F3h _emit 0ABh _emit 0AAh _emit 089h _emit 035h
        /* g_1076AB44 */ dword ptr [g_1076AB44]
        _emit 089h _emit 01Dh
        /* g_1076AA30 */ dword ptr [g_1076AA30]
        _emit 00Fh _emit 086h _emit 0ECh _emit 000h _emit 000h _emit 000h _emit 080h _emit 07Dh _emit 0EEh _emit 000h _emit 00Fh _emit 084h _emit 0BAh _emit 000h _emit 000h _emit 000h _emit 08Dh _emit 04Dh _emit 0EFh _emit 08Ah _emit 011h _emit 084h _emit 0D2h _emit 00Fh _emit 084h _emit 0ADh _emit 000h _emit 000h _emit 000h _emit 00Fh _emit 0B6h _emit 041h _emit 0FFh _emit 00Fh _emit 0B6h _emit 0D2h _emit 0E9h _emit 091h _emit 000h _emit 000h _emit 000h _emit 06Ah _emit 040h _emit 033h _emit 0C0h _emit 059h _emit 0BFh
        /* g_1076AA40 */ dword ptr [g_1076AA40]
        _emit 0F3h _emit 0ABh _emit 08Dh _emit 00Ch _emit 052h _emit 0C1h _emit 0E1h _emit 004h _emit 089h _emit 05Dh _emit 0E4h _emit 0AAh _emit 08Dh _emit 099h _emit 0D8h _emit 054h _emit 01Ah _emit 010h _emit 08Ah _emit 003h _emit 08Bh _emit 0F3h _emit 0EBh _emit 029h _emit 08Ah _emit 056h _emit 001h _emit 084h _emit 0D2h _emit 074h _emit 026h _emit 00Fh _emit 0B6h _emit 0C0h _emit 00Fh _emit 0B6h _emit 0FAh _emit 03Bh _emit 0C7h _emit 077h _emit 014h _emit 08Bh _emit 055h _emit 0E4h _emit 08Ah _emit 092h _emit 0C0h _emit 054h _emit 01Ah _emit 010h _emit 008h _emit 090h _emit 041h _emit 0AAh _emit 076h _emit 010h _emit 040h _emit 03Bh _emit 0C7h _emit 076h _emit 0F5h _emit 046h _emit 046h _emit 08Ah _emit 006h _emit 084h _emit 0C0h _emit 075h _emit 0D3h _emit 0FFh _emit 045h _emit 0E4h _emit 083h _emit 0C3h _emit 008h _emit 083h _emit 07Dh _emit 0E4h _emit 004h _emit 072h _emit 0C1h _emit 08Bh _emit 045h _emit 008h _emit 0A3h
        /* g_1076AB44 */ dword ptr [g_1076AB44]
        _emit 0C7h _emit 005h _emit 038h _emit 0AAh _emit 076h _emit 010h
        /* g_1076AA38 */ dword ptr [g_1076AA38]
        _emit 0E8h _emit 0ACh _emit 0FCh _emit 0FFh _emit 0FFh _emit 08Dh _emit 089h _emit 0CCh _emit 054h _emit 01Ah _emit 010h _emit 08Bh _emit 0F1h _emit 0BFh
        /* g_1076AB50 */ dword ptr [g_1076AB50]
        _emit 0A5h _emit 0A5h _emit 0A3h
        /* g_1076AA30 */ dword ptr [g_1076AA30]
        _emit 0A5h _emit 0EBh _emit 05Fh _emit 080h _emit 088h _emit 041h _emit 0AAh _emit 076h _emit 010h _emit 004h _emit 040h _emit 03Bh _emit 0C2h _emit 076h _emit 0F4h _emit 041h _emit 041h _emit 080h _emit 079h _emit 0FFh _emit 000h _emit 00Fh _emit 085h _emit 049h _emit 0FFh _emit 0FFh _emit 0FFh _emit 033h _emit 0C9h _emit 041h _emit 08Bh _emit 0C1h _emit 080h _emit 088h _emit 041h _emit 0AAh _emit 076h _emit 010h _emit 008h _emit 040h _emit 03Dh _emit 0FFh _emit 000h _emit 000h _emit 000h _emit 072h _emit 0F1h _emit 08Bh _emit 0C6h _emit 0E8h _emit 062h _emit 0FCh _emit 0FFh _emit 0FFh _emit 0A3h
        /* g_1076AA30 */ dword ptr [g_1076AA30]
        _emit 089h _emit 00Dh
        /* g_1076AA38 */ dword ptr [g_1076AA38]
        _emit 0EBh _emit 006h _emit 089h _emit 01Dh
        /* g_1076AA38 */ dword ptr [g_1076AA38]
        _emit 033h _emit 0C0h _emit 0BFh
        /* g_1076AB50 */ dword ptr [g_1076AB50]
        _emit 0ABh _emit 0ABh _emit 0ABh _emit 0EBh _emit 00Dh _emit 039h _emit 01Dh
        /* g_101AE1D8 */ dword ptr [g_101AE1D8]
        _emit 074h _emit 00Eh _emit 0E8h _emit 065h _emit 0FCh _emit 0FFh _emit 0FFh _emit 0E8h _emit 089h _emit 0FCh _emit 0FFh _emit 0FFh _emit 033h _emit 0C0h _emit 0EBh _emit 003h _emit 083h _emit 0C8h _emit 0FFh _emit 08Bh _emit 04Dh _emit 0FCh _emit 05Fh _emit 05Eh _emit 05Bh _emit 0E8h _emit 0D1h _emit 09Ch _emit 0FFh _emit 0FFh _emit 0C9h _emit 0C3h
    }
}
