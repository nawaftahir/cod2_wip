extern int g_1010C054;
extern int g_1010C0EC;
extern int g_1010C13C;
extern int g_1010C188;
extern int g_1017C96C;
extern int g_10182590;
extern int g_101A50D0;
extern int g_101AE198;
extern int g_101AE1A8;
extern int g_101AE268;

__declspec(naked) void ___crtCompareStringA(void)
{
    __asm {
        _emit 06Ah _emit 040h _emit 068h
        /* g_10182590 */ dword ptr [g_10182590]
        _emit 0E8h _emit 06Ch _emit 016h _emit 0FFh _emit 0FFh _emit 0A1h
        /* g_101A50D0 */ dword ptr [g_101A50D0]
        _emit 089h _emit 045h _emit 0E4h _emit 033h _emit 0FFh _emit 033h _emit 0F6h _emit 046h _emit 039h _emit 03Dh
        /* g_101AE268 */ dword ptr [g_101AE268]
        _emit 075h _emit 032h _emit 056h _emit 0B8h
        /* g_1017C96C */ dword ptr [g_1017C96C]
        _emit 050h _emit 056h _emit 050h _emit 057h _emit 057h _emit 0FFh _emit 015h
        /* g_1010C0EC */ dword ptr [g_1010C0EC]
        _emit 085h _emit 0C0h _emit 074h _emit 008h _emit 089h _emit 035h
        /* g_101AE268 */ dword ptr [g_101AE268]
        _emit 0EBh _emit 015h _emit 0FFh _emit 015h
        /* g_1010C054 */ dword ptr [g_1010C054]
        _emit 083h _emit 0F8h _emit 078h _emit 075h _emit 00Ah _emit 0C7h _emit 005h _emit 068h _emit 0E2h _emit 01Ah _emit 010h
        /* g_101AE268 */ dword ptr [g_101AE268]
        _emit 039h _emit 07Dh _emit 014h _emit 07Eh _emit 00Fh _emit 0FFh _emit 075h _emit 014h _emit 08Bh _emit 045h _emit 010h _emit 0E8h _emit 081h _emit 0FFh _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 045h _emit 014h _emit 08Bh _emit 045h _emit 01Ch _emit 03Bh _emit 0C7h _emit 07Eh _emit 00Dh _emit 050h _emit 08Bh _emit 045h _emit 018h _emit 0E8h _emit 06Dh _emit 0FFh _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 045h _emit 01Ch _emit 08Bh _emit 00Dh
        /* g_101AE268 */ dword ptr [g_101AE268]
        _emit 06Ah _emit 002h _emit 05Bh _emit 03Bh _emit 0CBh _emit 00Fh _emit 084h _emit 039h _emit 002h _emit 000h _emit 000h _emit 03Bh _emit 0CFh _emit 00Fh _emit 084h _emit 031h _emit 002h _emit 000h _emit 000h _emit 03Bh _emit 0CEh _emit 00Fh _emit 085h _emit 056h _emit 002h _emit 000h _emit 000h _emit 089h _emit 07Dh _emit 0C4h _emit 089h _emit 07Dh _emit 0BCh _emit 089h _emit 07Dh _emit 0C0h _emit 039h _emit 07Dh _emit 020h _emit 075h _emit 009h _emit 08Bh _emit 00Dh
        /* g_101AE1A8 */ dword ptr [g_101AE1A8]
        _emit 089h _emit 04Dh _emit 020h _emit 039h _emit 07Dh _emit 014h _emit 074h _emit 008h _emit 03Bh _emit 0C7h _emit 00Fh _emit 085h _emit 0A9h _emit 000h _emit 000h _emit 000h _emit 039h _emit 045h _emit 014h _emit 075h _emit 007h _emit 08Bh _emit 0C3h _emit 0E9h _emit 0A7h _emit 002h _emit 000h _emit 000h _emit 03Bh _emit 0C6h _emit 00Fh _emit 08Fh _emit 09Dh _emit 002h _emit 000h _emit 000h _emit 039h _emit 075h _emit 014h _emit 07Eh _emit 008h _emit 06Ah _emit 003h _emit 058h _emit 0E9h _emit 092h _emit 002h _emit 000h _emit 000h _emit 08Dh _emit 045h _emit 0D0h _emit 050h _emit 0FFh _emit 075h _emit 020h _emit 0FFh _emit 015h
        /* g_1010C188 */ dword ptr [g_1010C188]
        _emit 085h _emit 0C0h _emit 00Fh _emit 084h _emit 0FCh _emit 001h _emit 000h _emit 000h _emit 039h _emit 07Dh _emit 014h _emit 07Eh _emit 02Bh _emit 039h _emit 05Dh _emit 0D0h _emit 072h _emit 0D9h _emit 08Dh _emit 045h _emit 0D6h _emit 080h _emit 07Dh _emit 0D6h _emit 000h _emit 074h _emit 0D0h _emit 08Ah _emit 050h _emit 001h _emit 084h _emit 0D2h _emit 074h _emit 0C9h _emit 08Bh _emit 04Dh _emit 010h _emit 08Ah _emit 009h _emit 03Ah _emit 008h _emit 072h _emit 004h _emit 03Ah _emit 0CAh _emit 076h _emit 0A8h _emit 003h _emit 0C3h _emit 080h _emit 038h _emit 000h _emit 075h _emit 0E5h _emit 0EBh _emit 0B3h _emit 039h _emit 07Dh _emit 01Ch _emit 07Eh _emit 03Eh _emit 039h _emit 05Dh _emit 0D0h _emit 00Fh _emit 082h _emit 03Dh _emit 002h _emit 000h _emit 000h _emit 08Dh _emit 045h _emit 0D6h _emit 080h _emit 07Dh _emit 0D6h _emit 000h _emit 00Fh _emit 084h _emit 030h _emit 002h _emit 000h _emit 000h _emit 08Ah _emit 050h _emit 001h _emit 084h _emit 0D2h _emit 00Fh _emit 084h _emit 025h _emit 002h _emit 000h _emit 000h _emit 08Bh _emit 04Dh _emit 018h _emit 08Ah _emit 009h _emit 03Ah _emit 008h _emit 072h _emit 008h _emit 03Ah _emit 0CAh _emit 00Fh _emit 086h _emit 068h _emit 0FFh _emit 0FFh _emit 0FFh _emit 003h _emit 0C3h _emit 080h _emit 038h _emit 000h _emit 075h _emit 0DDh _emit 0E9h _emit 008h _emit 002h _emit 000h _emit 000h _emit 057h _emit 057h _emit 0FFh _emit 075h _emit 014h _emit 0FFh _emit 075h _emit 010h _emit 06Ah _emit 009h _emit 0FFh _emit 075h _emit 020h _emit 0FFh _emit 015h
        /* g_1010C13C */ dword ptr [g_1010C13C]
        _emit 08Bh _emit 0D8h _emit 089h _emit 05Dh _emit 0B8h _emit 03Bh _emit 0DFh _emit 00Fh _emit 084h _emit 069h _emit 001h _emit 000h _emit 000h _emit 089h _emit 07Dh _emit 0FCh _emit 08Dh _emit 004h _emit 01Bh _emit 083h _emit 0C0h _emit 003h _emit 083h _emit 0E0h _emit 0FCh _emit 0E8h _emit 0FEh _emit 0E6h _emit 0FEh _emit 0FFh _emit 089h _emit 065h _emit 0E8h _emit 08Bh _emit 0C4h _emit 089h _emit 045h _emit 0CCh _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0EBh _emit 01Ch _emit 033h _emit 0C0h _emit 040h _emit 0C3h _emit 08Bh _emit 065h _emit 0E8h _emit 0E8h _emit 08Dh _emit 0BEh _emit 0FFh _emit 0FFh _emit 083h _emit 065h _emit 0CCh _emit 000h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 08Bh _emit 05Dh _emit 0B8h _emit 033h _emit 0F6h _emit 046h _emit 033h _emit 0FFh _emit 08Bh _emit 045h _emit 0CCh _emit 03Bh _emit 0C7h _emit 075h _emit 018h _emit 08Dh _emit 004h _emit 01Bh _emit 050h _emit 0E8h _emit 0F8h _emit 022h _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 045h _emit 0CCh _emit 03Bh _emit 0C7h _emit 00Fh _emit 084h _emit 012h _emit 001h _emit 000h _emit 000h _emit 089h _emit 075h _emit 0C4h _emit 053h _emit 050h _emit 0FFh _emit 075h _emit 014h _emit 0FFh _emit 075h _emit 010h _emit 056h _emit 0FFh _emit 075h _emit 020h _emit 0FFh _emit 015h
        /* g_1010C13C */ dword ptr [g_1010C13C]
        _emit 085h _emit 0C0h _emit 00Fh _emit 084h _emit 0B1h _emit 000h _emit 000h _emit 000h _emit 06Ah _emit 000h _emit 06Ah _emit 000h _emit 0FFh _emit 075h _emit 01Ch _emit 0FFh _emit 075h _emit 018h _emit 06Ah _emit 009h _emit 0FFh _emit 075h _emit 020h _emit 0FFh _emit 015h
        /* g_1010C13C */ dword ptr [g_1010C13C]
        _emit 08Bh _emit 0F0h _emit 089h _emit 075h _emit 0B4h _emit 085h _emit 0F6h _emit 00Fh _emit 084h _emit 08Fh _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0FCh _emit 001h _emit 000h _emit 000h _emit 000h _emit 08Dh _emit 004h _emit 036h _emit 083h _emit 0C0h _emit 003h _emit 083h _emit 0E0h _emit 0FCh _emit 0E8h _emit 064h _emit 0E6h _emit 0FEh _emit 0FFh _emit 089h _emit 065h _emit 0E8h _emit 08Bh _emit 0FCh _emit 089h _emit 07Dh _emit 0B0h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0EBh _emit 018h _emit 033h _emit 0C0h _emit 040h _emit 0C3h _emit 08Bh _emit 065h _emit 0E8h _emit 0E8h _emit 0F3h _emit 0BDh _emit 0FFh _emit 0FFh _emit 033h _emit 0FFh _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 08Bh _emit 05Dh _emit 0B8h _emit 08Bh _emit 075h _emit 0B4h _emit 085h _emit 0FFh _emit 075h _emit 017h _emit 08Dh _emit 004h _emit 036h _emit 050h _emit 0E8h _emit 065h _emit 022h _emit 0FFh _emit 0FFh _emit 059h _emit 08Bh _emit 0F8h _emit 085h _emit 0FFh _emit 074h _emit 040h _emit 0C7h _emit 045h _emit 0BCh _emit 001h _emit 000h _emit 000h _emit 000h _emit 056h _emit 057h _emit 0FFh _emit 075h _emit 01Ch _emit 0FFh _emit 075h _emit 018h _emit 06Ah _emit 001h _emit 0FFh _emit 075h _emit 020h _emit 0FFh _emit 015h
        /* g_1010C13C */ dword ptr [g_1010C13C]
        _emit 085h _emit 0C0h _emit 074h _emit 015h _emit 056h _emit 057h _emit 053h _emit 0FFh _emit 075h _emit 0CCh _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 008h _emit 0FFh _emit 015h
        /* g_1010C0EC */ dword ptr [g_1010C0EC]
        _emit 089h _emit 045h _emit 0C0h _emit 083h _emit 07Dh _emit 0BCh _emit 000h _emit 074h _emit 007h _emit 057h _emit 0E8h _emit 08Bh _emit 0E2h _emit 0FEh _emit 0FFh _emit 059h _emit 083h _emit 07Dh _emit 0C4h _emit 000h _emit 074h _emit 009h _emit 0FFh _emit 075h _emit 0CCh _emit 0E8h _emit 07Ch _emit 0E2h _emit 0FEh _emit 0FFh _emit 059h _emit 08Bh _emit 045h _emit 0C0h _emit 0E9h _emit 0AEh _emit 000h _emit 000h _emit 000h _emit 089h _emit 07Dh _emit 0C8h _emit 039h _emit 07Dh _emit 008h _emit 075h _emit 008h _emit 0A1h
        /* g_101AE198 */ dword ptr [g_101AE198]
        _emit 089h _emit 045h _emit 008h _emit 08Bh _emit 05Dh _emit 020h _emit 03Bh _emit 0DFh _emit 075h _emit 006h _emit 08Bh _emit 01Dh
        /* g_101AE1A8 */ dword ptr [g_101AE1A8]
        _emit 0FFh _emit 075h _emit 008h _emit 0E8h _emit 005h _emit 0DDh _emit 0FFh _emit 0FFh _emit 059h _emit 08Bh _emit 0F0h _emit 083h _emit 0FEh _emit 0FFh _emit 075h _emit 004h _emit 033h _emit 0C0h _emit 0EBh _emit 07Dh _emit 03Bh _emit 0F3h _emit 074h _emit 049h _emit 06Ah _emit 000h _emit 06Ah _emit 000h _emit 08Dh _emit 045h _emit 014h _emit 050h _emit 0FFh _emit 075h _emit 010h _emit 056h _emit 053h _emit 0E8h _emit 026h _emit 0DDh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 018h _emit 08Bh _emit 0F8h _emit 085h _emit 0FFh _emit 074h _emit 0DDh _emit 06Ah _emit 000h _emit 06Ah _emit 000h _emit 08Dh _emit 045h _emit 01Ch _emit 050h _emit 0FFh _emit 075h _emit 018h _emit 056h _emit 053h _emit 0E8h _emit 00Bh _emit 0DDh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 018h _emit 089h _emit 045h _emit 0C8h _emit 085h _emit 0C0h _emit 075h _emit 009h _emit 057h _emit 0E8h _emit 001h _emit 0E2h _emit 0FEh _emit 0FFh _emit 059h _emit 0EBh _emit 0B8h _emit 089h _emit 07Dh _emit 010h _emit 08Bh _emit 045h _emit 0C8h _emit 089h _emit 045h _emit 018h _emit 0FFh _emit 075h _emit 01Ch _emit 0FFh _emit 075h _emit 018h _emit 0FFh _emit 075h _emit 014h _emit 0FFh _emit 075h _emit 010h _emit 0FFh
    }
}
