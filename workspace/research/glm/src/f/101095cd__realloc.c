extern int g_1010C130;
extern int g_1010C1AC;
extern int g_10182520;
extern int g_101AE238;
extern int g_1076AC70;
extern int g_1076AC94;
extern int g_1076AC98;

__declspec(naked) void _realloc(void)
{
    __asm {
        _emit 06Ah _emit 014h _emit 068h
        /* g_10182520 */ dword ptr [g_10182520]
        _emit 0E8h _emit 037h _emit 020h _emit 0FFh _emit 0FFh _emit 08Bh _emit 07Dh _emit 008h _emit 033h _emit 0DBh _emit 03Bh _emit 0FBh _emit 075h _emit 00Eh _emit 0FFh _emit 075h _emit 00Ch _emit 0E8h _emit 07Ah _emit 02Eh _emit 0FFh _emit 0FFh _emit 059h _emit 0E9h _emit 084h _emit 001h _emit 000h _emit 000h _emit 08Bh _emit 075h _emit 00Ch _emit 03Bh _emit 0F3h _emit 075h _emit 00Ch _emit 057h _emit 0E8h _emit 0D3h _emit 0EEh _emit 0FEh _emit 0FFh _emit 059h _emit 0E9h _emit 06Fh _emit 001h _emit 000h _emit 000h _emit 083h _emit 03Dh _emit 098h
        /* g_1076AC98 */ dword ptr [g_1076AC98]
        _emit 00Fh _emit 085h _emit 02Eh _emit 001h _emit 000h _emit 000h _emit 089h _emit 05Dh _emit 0E4h _emit 083h _emit 0FEh _emit 0E0h _emit 00Fh _emit 087h _emit 0F1h _emit 000h _emit 000h _emit 000h _emit 06Ah _emit 004h _emit 0E8h _emit 05Ah _emit 02Ah _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 05Dh _emit 0FCh _emit 057h _emit 0E8h _emit 07Eh _emit 07Bh _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 045h _emit 0E0h _emit 03Bh _emit 0C3h _emit 00Fh _emit 084h _emit 0A4h _emit 000h _emit 000h _emit 000h _emit 03Bh _emit 035h
        /* g_1076AC70 */ dword ptr [g_1076AC70]
        _emit 077h _emit 04Ch _emit 056h _emit 057h _emit 050h _emit 0E8h _emit 062h _emit 080h _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 00Ch _emit 085h _emit 0C0h _emit 074h _emit 005h _emit 089h _emit 07Dh _emit 0E4h _emit 0EBh _emit 038h _emit 056h _emit 0E8h _emit 074h _emit 087h _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 045h _emit 0E4h _emit 03Bh _emit 0C3h _emit 074h _emit 02Ah _emit 08Bh _emit 047h _emit 0FCh _emit 048h _emit 089h _emit 045h _emit 0DCh _emit 03Bh _emit 0C6h _emit 072h _emit 002h _emit 08Bh _emit 0C6h _emit 050h _emit 057h _emit 0FFh _emit 075h _emit 0E4h _emit 0E8h _emit 076h _emit 037h _emit 0FFh _emit 0FFh _emit 057h _emit 0E8h _emit 02Bh _emit 07Bh _emit 0FFh _emit 0FFh _emit 089h _emit 045h _emit 0E0h _emit 057h _emit 050h _emit 0E8h _emit 04Ch _emit 07Bh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 018h _emit 039h _emit 05Dh _emit 0E4h _emit 075h _emit 04Bh _emit 03Bh _emit 0F3h _emit 075h _emit 006h _emit 033h _emit 0F6h _emit 046h _emit 089h _emit 075h _emit 00Ch _emit 083h _emit 0C6h _emit 00Fh _emit 083h _emit 0E6h _emit 0F0h _emit 089h _emit 075h _emit 00Ch _emit 056h _emit 053h _emit 0FFh _emit 035h
        /* g_1076AC94 */ dword ptr [g_1076AC94]
        _emit 0FFh _emit 015h
        /* g_1010C130 */ dword ptr [g_1010C130]
        _emit 089h _emit 045h _emit 0E4h _emit 03Bh _emit 0C3h _emit 074h _emit 023h _emit 08Bh _emit 047h _emit 0FCh _emit 048h _emit 089h _emit 045h _emit 0DCh _emit 03Bh _emit 0C6h _emit 072h _emit 002h _emit 08Bh _emit 0C6h _emit 050h _emit 057h _emit 0FFh _emit 075h _emit 0E4h _emit 0E8h _emit 01Fh _emit 037h _emit 0FFh _emit 0FFh _emit 057h _emit 0FFh _emit 075h _emit 0E0h _emit 0E8h _emit 0FCh _emit 07Ah _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 014h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 04Fh _emit 000h _emit 000h _emit 000h _emit 039h _emit 05Dh _emit 0E0h _emit 075h _emit 022h _emit 03Bh _emit 0F3h _emit 075h _emit 003h _emit 033h _emit 0F6h _emit 046h _emit 083h _emit 0C6h _emit 00Fh _emit 083h _emit 0E6h _emit 0F0h _emit 089h _emit 075h _emit 00Ch _emit 056h _emit 057h _emit 053h _emit 0FFh _emit 035h
        /* g_1076AC94 */ dword ptr [g_1076AC94]
        _emit 0FFh _emit 015h
        /* g_1010C1AC */ dword ptr [g_1010C1AC]
        _emit 089h _emit 045h _emit 0E4h _emit 08Bh _emit 045h _emit 0E4h _emit 03Bh _emit 0C3h _emit 075h _emit 060h _emit 039h _emit 01Dh
        /* g_101AE238 */ dword ptr [g_101AE238]
        _emit 074h _emit 058h _emit 056h _emit 0E8h _emit 08Ah _emit 0E7h _emit 0FFh _emit 0FFh _emit 059h _emit 085h _emit 0C0h _emit 00Fh _emit 085h _emit 0E5h _emit 0FEh _emit 0FFh _emit 0FFh _emit 0EBh _emit 045h _emit 033h _emit 0DBh _emit 08Bh _emit 075h _emit 00Ch _emit 08Bh _emit 07Dh _emit 008h _emit 06Ah _emit 004h _emit 0E8h _emit 074h _emit 028h _emit 0FFh _emit 0FFh _emit 059h _emit 0C3h _emit 033h _emit 0C0h _emit 083h _emit 0FEh _emit 0E0h _emit 077h _emit 016h _emit 03Bh _emit 0F3h _emit 075h _emit 003h _emit 033h _emit 0F6h _emit 046h _emit 056h _emit 057h _emit 053h _emit 0FFh _emit 035h
        /* g_1076AC94 */ dword ptr [g_1076AC94]
        _emit 0FFh _emit 015h
        /* g_1010C1AC */ dword ptr [g_1010C1AC]
        _emit 03Bh _emit 0C3h _emit 075h _emit 015h _emit 039h _emit 01Dh
        /* g_101AE238 */ dword ptr [g_101AE238]
        _emit 074h _emit 00Dh _emit 056h _emit 0E8h
    }
}
