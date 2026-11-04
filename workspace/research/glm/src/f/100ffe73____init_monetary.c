extern int g_101A509C;
extern int g_101A50CC;
extern int g_101AE168;
extern int g_101AE19C;
extern int g_101AE1A0;
extern int g_101AE1C8;
extern int g_1076AC88;
extern int g_1076AC8C;

__declspec(naked) void ___init_monetary(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 051h _emit 053h _emit 056h _emit 033h _emit 0F6h _emit 039h _emit 035h
        /* g_101AE19C */ dword ptr [g_101AE19C]
        _emit 057h _emit 075h _emit 029h _emit 039h _emit 035h
        /* g_101AE1A0 */ dword ptr [g_101AE1A0]
        _emit 075h _emit 021h _emit 089h _emit 035h
        /* g_1076AC88 */ dword ptr [g_1076AC88]
        _emit 089h _emit 035h
        /* g_1076AC8C */ dword ptr [g_1076AC8C]
        _emit 0C7h _emit 005h _emit 0CCh _emit 050h _emit 01Ah _emit 010h
        /* g_101A509C */ dword ptr [g_101A509C]
        _emit 089h _emit 035h
        /* g_101AE168 */ dword ptr [g_101AE168]
        _emit 0E9h _emit 0FEh _emit 001h _emit 000h _emit 000h _emit 06Ah _emit 030h _emit 06Ah _emit 001h _emit 0E8h _emit 013h _emit 0D9h _emit 0FFh _emit 0FFh _emit 08Bh _emit 0D8h _emit 03Bh _emit 0DEh _emit 059h _emit 059h _emit 00Fh _emit 084h _emit 069h _emit 001h _emit 000h _emit 000h _emit 06Ah _emit 004h _emit 0E8h _emit 09Bh _emit 0C5h _emit 0FFh _emit 0FFh _emit 08Bh _emit 0F8h _emit 03Bh _emit 0FEh _emit 059h _emit 089h _emit 07Dh _emit 0FCh _emit 075h _emit 00Ch _emit 053h _emit 0E8h _emit 0F7h _emit 085h _emit 0FFh _emit 0FFh _emit 059h _emit 0E9h _emit 04Ch _emit 001h _emit 000h _emit 000h _emit 089h _emit 037h _emit 039h _emit 035h
        /* g_101AE19C */ dword ptr [g_101AE19C]
        _emit 00Fh _emit 084h _emit 078h _emit 001h _emit 000h _emit 000h _emit 06Ah _emit 004h _emit 0E8h _emit 070h _emit 0C5h _emit 0FFh _emit 0FFh _emit 03Bh _emit 0C6h _emit 059h _emit 0A3h
        /* g_1076AC88 */ dword ptr [g_1076AC88]
        _emit 075h _emit 00Fh _emit 053h _emit 0E8h _emit 0CCh _emit 085h _emit 0FFh _emit 0FFh _emit 057h _emit 0E8h _emit 0C6h _emit 085h _emit 0FFh _emit 0FFh _emit 059h _emit 0EBh _emit 0CCh _emit 089h _emit 030h _emit 00Fh _emit 0B7h _emit 035h
        /* g_101AE1C8 */ dword ptr [g_101AE1C8]
        _emit 08Dh _emit 043h _emit 00Ch _emit 050h _emit 06Ah _emit 015h _emit 056h _emit 06Ah _emit 001h _emit 0E8h _emit 000h _emit 086h _emit 000h _emit 000h _emit 08Bh _emit 0F8h _emit 08Dh _emit 043h _emit 010h _emit 050h _emit 06Ah _emit 014h _emit 056h _emit 06Ah _emit 001h _emit 0E8h _emit 0F0h _emit 085h _emit 000h _emit 000h _emit 00Bh _emit 0F8h _emit 08Dh _emit 043h _emit 014h _emit 050h _emit 06Ah _emit 016h _emit 056h _emit 06Ah _emit 001h _emit 0E8h _emit 0E0h _emit 085h _emit 000h _emit 000h _emit 00Bh _emit 0F8h _emit 08Dh _emit 043h _emit 018h _emit 050h _emit 06Ah _emit 017h _emit 056h _emit 06Ah _emit 001h _emit 0E8h _emit 0D0h _emit 085h _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 040h _emit 00Bh _emit 0F8h _emit 08Dh _emit 043h _emit 01Ch _emit 050h _emit 06Ah _emit 018h _emit 056h _emit 06Ah _emit 001h _emit 0E8h _emit 0BDh _emit 085h _emit 000h _emit 000h _emit 00Bh _emit 0F8h _emit 08Dh _emit 043h _emit 020h _emit 050h _emit 06Ah _emit 050h _emit 056h _emit 06Ah _emit 001h _emit 0E8h _emit 0ADh _emit 085h _emit 000h _emit 000h _emit 00Bh _emit 0F8h _emit 08Dh _emit 043h _emit 024h _emit 050h _emit 06Ah _emit 051h _emit 056h _emit 06Ah _emit 001h _emit 0E8h _emit 09Dh _emit 085h _emit 000h _emit 000h _emit 00Bh _emit 0F8h _emit 08Dh _emit 043h _emit 028h _emit 050h _emit 06Ah _emit 01Ah _emit 056h _emit 06Ah _emit 000h _emit 0E8h _emit 08Dh _emit 085h _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 040h _emit 00Bh _emit 0F8h _emit 08Dh _emit 043h _emit 029h _emit 050h _emit 06Ah _emit 019h _emit 056h _emit 06Ah _emit 000h _emit 0E8h _emit 07Ah _emit 085h _emit 000h _emit 000h _emit 00Bh _emit 0F8h _emit 08Dh _emit 043h _emit 02Ah _emit 050h _emit 06Ah _emit 054h _emit 056h _emit 06Ah _emit 000h _emit 0E8h _emit 06Ah _emit 085h _emit 000h _emit 000h _emit 00Bh _emit 0F8h _emit 08Dh _emit 043h _emit 02Bh _emit 050h _emit 06Ah _emit 055h _emit 056h _emit 06Ah _emit 000h _emit 0E8h _emit 05Ah _emit 085h _emit 000h _emit 000h _emit 00Bh _emit 0F8h _emit 08Dh _emit 043h _emit 02Ch _emit 050h _emit 06Ah _emit 056h _emit 056h _emit 06Ah _emit 000h _emit 0E8h _emit 04Ah _emit 085h _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 040h _emit 00Bh _emit 0F8h _emit 08Dh _emit 043h _emit 02Dh _emit 050h _emit 06Ah _emit 057h _emit 056h _emit 06Ah _emit 000h _emit 0E8h _emit 037h _emit 085h _emit 000h _emit 000h _emit 00Bh _emit 0F8h _emit 08Dh _emit 043h _emit 02Eh _emit 050h _emit 06Ah _emit 052h _emit 056h _emit 06Ah _emit 000h _emit 0E8h _emit 027h _emit 085h _emit 000h _emit 000h _emit 00Bh _emit 0F8h _emit 08Dh _emit 043h _emit 02Fh _emit 050h _emit 06Ah _emit 053h _emit 056h _emit 06Ah _emit 000h _emit 0E8h _emit 017h _emit 085h _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 030h _emit 00Bh _emit 0C7h _emit 074h _emit 01Ch _emit 053h _emit 0E8h _emit 080h _emit 0FDh _emit 0FFh _emit 0FFh _emit 053h _emit 0E8h _emit 0B0h _emit 084h _emit 0FFh _emit 0FFh _emit 0FFh _emit 075h _emit 0FCh _emit 0E8h _emit 0A8h _emit 084h _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 00Ch _emit 033h _emit 0C0h _emit 040h _emit 0EBh _emit 07Dh _emit 08Bh _emit 043h _emit 01Ch _emit 0EBh _emit 012h _emit 08Ah _emit 008h _emit 080h _emit 0F9h _emit 030h _emit 07Ch _emit 012h _emit 080h _emit 0F9h _emit 039h _emit 07Fh _emit 00Dh _emit 080h _emit 0E9h _emit 030h _emit 088h _emit 008h _emit 040h _emit 080h _emit 038h _emit 000h _emit 075h _emit 0E9h _emit 0EBh _emit 02Ah _emit 080h _emit 0F9h _emit 03Bh _emit 075h _emit 0F3h _emit 08Bh _emit 0F0h _emit 08Dh _emit 07Eh _emit 001h _emit 08Ah _emit 00Fh _emit 088h _emit 00Eh _emit 08Bh _emit 0F7h _emit 080h _emit 03Eh _emit 000h _emit 075h _emit 0F2h _emit 0EBh _emit 0E2h _emit 06Ah _emit 00Ch _emit 059h _emit 0BEh
        /* g_101A509C */ dword ptr [g_101A509C]
        _emit 08Bh _emit 0FBh _emit 0F3h _emit 0A5h _emit 083h _emit 025h _emit 088h
        /* g_1076AC88 */ dword ptr [g_1076AC88]
        _emit 0A1h
        /* g_101A50CC */ dword ptr [g_101A50CC]
        _emit 08Bh _emit 000h _emit 089h _emit 003h _emit 0A1h
        /* g_101A50CC */ dword ptr [g_101A50CC]
        _emit 08Bh _emit 040h _emit 004h _emit 089h _emit 043h _emit 004h _emit 0A1h
        /* g_101A50CC */ dword ptr [g_101A50CC]
        _emit 08Bh _emit 040h _emit 008h _emit 089h _emit 043h _emit 008h _emit 08Bh _emit 045h _emit 0FCh _emit 089h _emit 01Dh
        /* g_101A50CC */ dword ptr [g_101A50CC]
        _emit 0A3h
        /* g_1076AC8C */ dword ptr [g_1076AC8C]
        _emit 089h _emit 01Dh
        /* g_101AE168 */ dword ptr [g_101AE168]
        _emit 033h _emit 0C0h _emit 05Fh _emit 05Eh _emit 05Bh _emit 0C9h _emit 0C3h
    }
}
