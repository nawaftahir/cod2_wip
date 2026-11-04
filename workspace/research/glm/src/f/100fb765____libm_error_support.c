extern int g_1010EAAC;
extern int g_1010EB18;
extern int g_1010EB1C;
extern int g_101145AC;
extern int g_101145B4;
extern int g_101145BC;
extern int g_10114618;
extern int g_10114638;
extern int g_10114690;
extern int g_101146A0;
extern int g_1017C868;
extern int g_101A4B20;
extern int g_101A50D0;

__declspec(naked) void ___libm_error_support(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 083h _emit 0ECh _emit 024h _emit 0A1h
        /* g_101A50D0 */ dword ptr [g_101A50D0]
        _emit 089h _emit 045h _emit 0FCh _emit 08Bh _emit 045h _emit 014h _emit 0B9h _emit 0A1h _emit 000h _emit 000h _emit 000h _emit 03Bh _emit 0C1h _emit 056h _emit 00Fh _emit 08Fh _emit 013h _emit 001h _emit 000h _emit 000h _emit 00Fh _emit 084h _emit 001h _emit 001h _emit 000h _emit 000h _emit 083h _emit 0F8h _emit 018h _emit 00Fh _emit 08Fh _emit 088h _emit 000h _emit 000h _emit 000h _emit 074h _emit 073h _emit 06Ah _emit 002h _emit 059h _emit 02Bh _emit 0C1h _emit 074h _emit 05Dh _emit 048h _emit 074h _emit 04Eh _emit 083h _emit 0E8h _emit 005h _emit 074h _emit 03Ah _emit 048h _emit 074h _emit 02Bh _emit 083h _emit 0E8h _emit 005h _emit 074h _emit 013h _emit 048h _emit 00Fh _emit 085h _emit 035h _emit 002h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0E0h
        /* g_1010EB1C */ dword ptr [g_1010EB1C]
        _emit 0E9h _emit 09Dh _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0DCh _emit 003h _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0E0h
        /* g_1010EB1C */ dword ptr [g_1010EB1C]
        _emit 0E9h _emit 04Ch _emit 001h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0E0h
        /* g_101145BC */ dword ptr [g_101145BC]
        _emit 0E9h _emit 0A7h _emit 001h _emit 000h _emit 000h _emit 089h _emit 04Dh _emit 0DCh _emit 0C7h _emit 045h _emit 0E0h
        /* g_101145BC */ dword ptr [g_101145BC]
        _emit 0E9h _emit 031h _emit 001h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0E0h
        /* g_1010EB18 */ dword ptr [g_1010EB18]
        _emit 0E9h _emit 08Ch _emit 001h _emit 000h _emit 000h _emit 089h _emit 04Dh _emit 0DCh _emit 0C7h _emit 045h _emit 0E0h
        /* g_1010EB18 */ dword ptr [g_1010EB18]
        _emit 0E9h _emit 016h _emit 001h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0DCh _emit 003h _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0E0h
        /* g_1010EAAC */ dword ptr [g_1010EAAC]
        _emit 0E9h _emit 003h _emit 001h _emit 000h _emit 000h _emit 083h _emit 0E8h _emit 019h _emit 074h _emit 035h _emit 048h _emit 074h _emit 026h _emit 048h _emit 074h _emit 01Ah _emit 048h _emit 00Fh _emit 084h _emit 051h _emit 001h _emit 000h _emit 000h _emit 048h _emit 00Fh _emit 085h _emit 0B4h _emit 001h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0E0h
        /* g_1010EAAC */ dword ptr [g_1010EAAC]
        _emit 0E9h _emit 066h _emit 001h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0DCh _emit 002h _emit 000h _emit 000h _emit 000h _emit 0EBh _emit 0C6h _emit 08Bh _emit 045h _emit 010h _emit 0D9h _emit 0E8h _emit 0DDh _emit 018h _emit 0E9h _emit 093h _emit 001h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0E0h
        /* g_1010EAAC */ dword ptr [g_1010EAAC]
        _emit 08Bh _emit 045h _emit 008h _emit 0DDh _emit 000h _emit 08Bh _emit 045h _emit 00Ch _emit 08Bh _emit 075h _emit 010h _emit 0DDh _emit 05Dh _emit 0E4h _emit 0DDh _emit 000h _emit 08Dh _emit 045h _emit 0DCh _emit 0DDh _emit 05Dh _emit 0ECh _emit 050h _emit 0DDh _emit 006h _emit 0C7h _emit 045h _emit 0DCh _emit 004h _emit 000h _emit 000h _emit 000h _emit 0DDh _emit 05Dh _emit 0F4h _emit 0FFh _emit 015h
        /* g_101A4B20 */ dword ptr [g_101A4B20]
        _emit 059h _emit 0E9h _emit 058h _emit 001h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0DCh _emit 003h _emit 000h _emit 000h _emit 000h _emit 0E9h _emit 080h _emit 000h _emit 000h _emit 000h _emit 0B9h _emit 0EAh _emit 003h _emit 000h _emit 000h _emit 03Bh _emit 0C1h _emit 00Fh _emit 08Fh _emit 0BEh _emit 000h _emit 000h _emit 000h _emit 00Fh _emit 084h _emit 0AFh _emit 000h _emit 000h _emit 000h _emit 02Dh _emit 0A2h _emit 000h _emit 000h _emit 000h _emit 074h _emit 05Fh _emit 083h _emit 0E8h _emit 004h _emit 074h _emit 04Ah _emit 083h _emit 0E8h _emit 004h _emit 074h _emit 035h _emit 048h _emit 074h _emit 026h _emit 02Dh _emit 03Dh _emit 003h _emit 000h _emit 000h _emit 074h _emit 013h _emit 048h _emit 00Fh _emit 085h _emit 01Ch _emit 001h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0E0h
        /* g_101145BC */ dword ptr [g_101145BC]
        _emit 0E9h _emit 0CEh _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0E0h
        /* g_1010EB18 */ dword ptr [g_1010EB18]
        _emit 0E9h _emit 0C2h _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0E0h
        /* g_101145B4 */ dword ptr [g_101145B4]
        _emit 0E9h _emit 095h _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0DCh _emit 002h _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0E0h
        /* g_101145B4 */ dword ptr [g_101145B4]
        _emit 0EBh _emit 01Eh _emit 0C7h _emit 045h _emit 0DCh _emit 003h _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0E0h
        /* g_1017C868 */ dword ptr [g_1017C868]
        _emit 0EBh _emit 00Eh _emit 0C7h _emit 045h _emit 0DCh _emit 004h _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0E0h
        /* g_10114638 */ dword ptr [g_10114638]
        _emit 08Bh _emit 045h _emit 008h _emit 0DDh _emit 000h _emit 08Bh _emit 045h _emit 00Ch _emit 08Bh _emit 075h _emit 010h _emit 0DDh _emit 05Dh _emit 0E4h _emit 0DDh _emit 000h _emit 08Dh _emit 045h _emit 0DCh _emit 0DDh _emit 05Dh _emit 0ECh _emit 050h _emit 0DDh _emit 006h _emit 0DDh _emit 05Dh _emit 0F4h _emit 0FFh _emit 015h
        /* g_101A4B20 */ dword ptr [g_101A4B20]
        _emit 085h _emit 0C0h _emit 059h _emit 00Fh _emit 085h _emit 09Ah _emit 000h _emit 000h _emit 000h _emit 0E8h _emit 0C8h _emit 008h _emit 000h _emit 000h _emit 0C7h _emit 000h _emit 022h _emit 000h _emit 000h _emit 000h _emit 0E9h _emit 08Ah _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0E0h
        /* g_1010EB1C */ dword ptr [g_1010EB1C]
        _emit 0EBh _emit 044h _emit 02Dh _emit 0EBh _emit 003h _emit 000h _emit 000h _emit 074h _emit 036h _emit 048h _emit 074h _emit 02Ah _emit 048h _emit 074h _emit 01Eh _emit 048h _emit 074h _emit 00Ch _emit 048h _emit 075h _emit 073h _emit 0C7h _emit 045h _emit 0E0h
        /* g_101145AC */ dword ptr [g_101145AC]
        _emit 0EBh _emit 028h _emit 0C7h _emit 045h _emit 0E0h
        /* g_1010EAAC */ dword ptr [g_1010EAAC]
        _emit 08Bh _emit 045h _emit 008h _emit 08Bh _emit 075h _emit 010h _emit 0EBh _emit 023h _emit 0C7h _emit 045h _emit 0E0h
        /* g_10114618 */ dword ptr [g_10114618]
        _emit 0EBh _emit 010h _emit 0C7h _emit 045h _emit 0E0h
        /* g_10114690 */ dword ptr [g_10114690]
        _emit 0EBh _emit 007h _emit 0C7h _emit 045h _emit 0E0h
        /* g_101146A0 */ dword ptr [g_101146A0]
        _emit 08Bh _emit 045h _emit 008h _emit 0DDh _emit 000h _emit 08Bh _emit 075h _emit 010h _emit 0DDh _emit 01Eh _emit 0DDh _emit 000h _emit 08Bh _emit 045h _emit 00Ch _emit 0DDh _emit 05Dh _emit 0E4h _emit 0C7h _emit 045h _emit 0DCh _emit 001h _emit 000h _emit 000h _emit 000h _emit 0DDh _emit 000h _emit 08Dh _emit 045h _emit 0DCh _emit 0DDh _emit 05Dh _emit 0ECh _emit 050h _emit 0DDh _emit 006h _emit 0DDh _emit 05Dh _emit 0F4h _emit 0FFh _emit 015h
        /* g_101A4B20 */ dword ptr [g_101A4B20]
        _emit 085h _emit 0C0h _emit 059h _emit 075h _emit 00Bh _emit 0E8h _emit 039h _emit 008h _emit 000h _emit 000h _emit 0C7h _emit 000h _emit 021h _emit 000h _emit 000h _emit 000h _emit 0DDh _emit 045h _emit 0F4h _emit 0DDh _emit 01Eh _emit 08Bh _emit 04Dh _emit 0FCh _emit 05Eh _emit 0E8h _emit 05Ch _emit 053h _emit 000h _emit 000h _emit 0C9h _emit 0C3h
    }
}
