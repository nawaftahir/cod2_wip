extern int g_10191670;
extern int g_10191678;
extern int g_10191688;
extern int g_10191694;
extern int g_101916A4;
extern int g_101916B0;
extern int g_101916C0;
extern int g_101916C8;
extern int g_10191928;
extern int g_1019BCB4;
extern int g_1019BEDC;
extern int g_101A66B0;
extern int g_101AAC70;

__declspec(naked) void R_DObjReplaceMaterial(void)
{
    __asm {
        _emit 0B8h _emit 000h _emit 010h _emit 000h _emit 000h _emit 0E8h _emit 0F6h _emit 053h _emit 00Fh _emit 000h _emit 053h _emit 055h _emit 056h _emit 08Bh _emit 0B4h _emit 024h _emit 010h _emit 010h _emit 000h _emit 000h _emit 057h _emit 033h _emit 0DBh _emit 0EBh _emit 007h _emit 08Dh _emit 0A4h _emit 024h _emit 000h _emit 000h _emit 000h _emit 000h _emit 0A1h
        /* g_101AAC70 */ dword ptr [g_101AAC70]
        _emit 069h _emit 0C0h _emit 05Ch _emit 004h _emit 000h _emit 000h _emit 005h
        /* g_101A66B0 */ dword ptr [g_101A66B0]
        _emit 038h _emit 098h _emit 004h _emit 004h _emit 000h _emit 000h _emit 074h _emit 01Fh _emit 08Bh _emit 088h _emit 018h _emit 004h _emit 000h _emit 000h _emit 08Bh _emit 090h _emit 014h _emit 004h _emit 000h _emit 000h _emit 088h _emit 098h _emit 004h _emit 004h _emit 000h _emit 000h _emit 089h _emit 08Ch _emit 024h _emit 018h _emit 010h _emit 000h _emit 000h _emit 089h _emit 090h _emit 000h _emit 004h _emit 000h _emit 000h _emit 08Dh _emit 084h _emit 024h _emit 018h _emit 010h _emit 000h _emit 000h _emit 050h _emit 0B8h _emit 001h _emit 000h _emit 000h _emit 000h _emit 0E8h _emit 0F7h _emit 0C1h _emit 005h _emit 000h _emit 08Ah _emit 008h _emit 083h _emit 0C4h _emit 004h _emit 03Ah _emit 0CBh _emit 00Fh _emit 084h _emit 023h _emit 003h _emit 000h _emit 000h _emit 080h _emit 0F9h _emit 07Dh _emit 00Fh _emit 084h _emit 01Ah _emit 003h _emit 000h _emit 000h _emit 080h _emit 0F9h _emit 07Bh _emit 075h _emit 030h _emit 089h _emit 05Eh _emit 040h _emit 089h _emit 05Eh _emit 054h _emit 0C7h _emit 046h _emit 050h _emit 000h _emit 000h _emit 000h _emit 03Fh _emit 088h _emit 05Eh _emit 070h _emit 089h _emit 05Eh _emit 044h _emit 089h _emit 05Eh _emit 048h _emit 089h _emit 05Eh _emit 04Ch _emit 089h _emit 05Eh _emit 058h _emit 089h _emit 05Eh _emit 05Ch _emit 089h _emit 05Eh _emit 060h _emit 089h _emit 05Eh _emit 064h _emit 089h _emit 05Eh _emit 068h _emit 089h _emit 05Eh _emit 06Ch _emit 0E9h _emit 06Ch _emit 0FFh _emit 0FFh _emit 0FFh _emit 068h _emit 0FFh _emit 007h _emit 000h _emit 000h _emit 050h _emit 08Dh _emit 08Ch _emit 024h _emit 018h _emit 008h _emit 000h _emit 000h _emit 051h _emit 0E8h _emit 0F9h _emit 028h _emit 00Fh _emit 000h _emit 0A1h
        /* g_101AAC70 */ dword ptr [g_101AAC70]
        _emit 069h _emit 0C0h _emit 05Ch _emit 004h _emit 000h _emit 000h _emit 005h
        /* g_101A66B0 */ dword ptr [g_101A66B0]
        _emit 088h _emit 09Ch _emit 024h _emit 01Bh _emit 010h _emit 000h _emit 000h _emit 08Ah _emit 088h _emit 004h _emit 004h _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 03Ah _emit 0CBh _emit 074h _emit 01Fh _emit 08Bh _emit 090h _emit 018h _emit 004h _emit 000h _emit 000h _emit 08Bh _emit 088h _emit 014h _emit 004h _emit 000h _emit 000h _emit 088h _emit 098h _emit 004h _emit 004h _emit 000h _emit 000h _emit 089h _emit 094h _emit 024h _emit 018h _emit 010h _emit 000h _emit 000h _emit 089h _emit 088h _emit 000h _emit 004h _emit 000h _emit 000h _emit 08Dh _emit 094h _emit 024h _emit 018h _emit 010h _emit 000h _emit 000h _emit 052h _emit 0B8h _emit 001h _emit 000h _emit 000h _emit 000h _emit 0E8h _emit 044h _emit 0C1h _emit 005h _emit 000h _emit 08Ah _emit 008h _emit 083h _emit 0C4h _emit 004h _emit 03Ah _emit 0CBh _emit 00Fh _emit 084h _emit 070h _emit 002h _emit 000h _emit 000h _emit 080h _emit 0F9h _emit 07Dh _emit 00Fh _emit 084h _emit 067h _emit 002h _emit 000h _emit 000h _emit 068h _emit 0FFh _emit 007h _emit 000h _emit 000h _emit 050h _emit 08Dh _emit 044h _emit 024h _emit 018h _emit 050h _emit 0E8h _emit 07Eh _emit 028h _emit 00Fh _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 088h _emit 09Ch _emit 024h _emit 00Fh _emit 008h _emit 000h _emit 000h _emit 0BFh _emit 0FFh _emit 0FFh _emit 0FFh _emit 07Fh _emit 033h _emit 0D2h _emit 0EBh _emit 00Bh _emit 08Dh _emit 0A4h _emit 024h _emit 000h _emit 000h _emit 000h _emit 000h _emit 08Dh _emit 064h _emit 024h _emit 000h _emit 00Fh _emit 0BEh _emit 084h _emit 014h _emit 010h _emit 008h _emit 000h _emit 000h _emit 00Fh _emit 0BEh _emit 08Ah _emit 03Ch _emit 017h _emit 019h _emit 010h _emit 042h _emit 08Bh _emit 0EFh _emit 04Fh _emit 085h _emit 0EDh _emit 074h _emit 039h _emit 03Bh _emit 0C1h _emit 074h _emit 01Eh _emit 083h _emit 0F8h _emit 061h _emit 07Ch _emit 008h _emit 083h _emit 0F8h _emit 07Ah _emit 07Fh _emit 003h _emit 083h _emit 0E8h _emit 020h _emit 083h _emit 0F9h _emit 061h _emit 07Ch _emit 008h _emit 083h _emit 0F9h _emit 07Ah _emit 07Fh _emit 003h _emit 083h _emit 0E9h _emit 020h _emit 03Bh _emit 0C1h _emit 075h _emit 006h _emit 03Bh _emit 0C3h _emit 075h _emit 0C3h _emit 0EBh _emit 011h _emit 033h _emit 0D2h _emit 03Bh _emit 0C1h _emit 00Fh _emit 09Dh _emit 0C2h _emit 08Dh _emit 054h _emit 012h _emit 0FFh _emit 08Bh _emit 0C2h _emit 03Bh _emit 0C3h _emit 075h _emit 044h _emit 08Dh _emit 044h _emit 024h _emit 010h _emit 050h _emit 0E8h _emit 0C8h _emit 027h _emit 00Fh _emit 000h _emit 0D9h _emit 056h _emit 040h _emit 0D8h _emit 01Dh
        /* g_1019BCB4 */ dword ptr [g_1019BCB4]
        _emit 083h _emit 0C4h _emit 004h _emit 0DFh _emit 0E0h _emit 0F6h _emit 0C4h _emit 041h _emit 00Fh _emit 085h _emit 04Fh _emit 0FEh _emit 0FFh _emit 0FFh _emit 08Dh _emit 04Ch _emit 024h _emit 010h _emit 051h _emit 068h
        /* g_101916C8 */ dword ptr [g_101916C8]
        _emit 0E8h _emit 070h _emit 0E6h _emit 005h _emit 000h _emit 0D9h _emit 046h _emit 040h _emit 0D8h _emit 00Dh
        /* g_1019BEDC */ dword ptr [g_1019BEDC]
        _emit 083h _emit 0C4h _emit 008h _emit 0D9h _emit 05Eh _emit 040h _emit 0E9h _emit 02Ch _emit 0FEh _emit 0FFh _emit 0FFh _emit 0B8h _emit 0FFh _emit 0FFh _emit 0FFh _emit 07Fh _emit 0B9h
        /* g_101916C0 */ dword ptr [g_101916C0]
        _emit 08Dh _emit 094h _emit 024h _emit 010h _emit 008h _emit 000h _emit 000h _emit 0E8h _emit 016h _emit 0D3h _emit 005h _emit 000h _emit 085h _emit 0C0h _emit 075h _emit 02Bh _emit 08Dh _emit 046h _emit 044h _emit 08Dh _emit 056h _emit 04Ch _emit 08Dh _emit 04Eh _emit 048h _emit 052h _emit 051h _emit 050h _emit 089h _emit 018h _emit 08Dh _emit 054h _emit 024h _emit 01Ch _emit 068h
        /* g_10191928 */ dword ptr [g_10191928]
        _emit 089h _emit 058h _emit 004h _emit 052h _emit 089h _emit 058h _emit 008h _emit 0E8h _emit 01Dh _emit 027h _emit 00Fh _emit 000h _emit 083h _emit 0C4h _emit 014h _emit 0E9h _emit 0E7h _emit 0FDh _emit 0FFh _emit 0FFh _emit 0B8h _emit 0FFh _emit 0FFh _emit 0FFh _emit 07Fh _emit 0B9h
        /* g_101916B0 */ dword ptr [g_101916B0]
        _emit 08Dh _emit 094h _emit 024h _emit 010h _emit 008h _emit 000h _emit 000h _emit 0E8h _emit 0D1h _emit 0D2h _emit 005h _emit 000h _emit 085h _emit 0C0h _emit 075h _emit 015h _emit 08Dh _emit 044h _emit 024h _emit 010h _emit 050h _emit 0E8h _emit 025h _emit 027h _emit 00Fh _emit 000h _emit 0D9h _emit 05Eh _emit 050h _emit 083h _emit 0C4h _emit 004h _emit 0E9h _emit 0B8h _emit 0FDh _emit 0FFh _emit 0FFh _emit 0B8h _emit 0FFh _emit 0FFh _emit 0FFh _emit 07Fh _emit 0B9h
        /* g_101916A4 */ dword ptr [g_101916A4]
        _emit 08Dh _emit 094h _emit 024h _emit 010h _emit 008h _emit 000h _emit 000h _emit 0E8h _emit 0A2h _emit 0D2h _emit 005h _emit 000h _emit 085h _emit 0C0h _emit 075h _emit 036h _emit 08Dh _emit 04Eh _emit 060h _emit 051h _emit 08Dh _emit 07Eh _emit 058h _emit 08Dh _emit 056h _emit 05Ch _emit 052h _emit 057h _emit 08Dh _emit 044h _emit 024h _emit 01Ch _emit 068h
        /* g_10191928 */ dword ptr [g_10191928]
        _emit 050h _emit 089h _emit 01Fh _emit 089h _emit 05Fh _emit 004h _emit 089h _emit 05Fh _emit 008h _emit 0E8h _emit 0A9h _emit 026h _emit 00Fh _emit 000h _emit 083h _emit 0C4h _emit 014h _emit 08Bh _emit 0D7h _emit 08Bh _emit 0CFh _emit 0E8h _emit 01Fh _emit 0A8h _emit 005h _emit 000h _emit 0DDh _emit 0D8h _emit 0E9h _emit 068h _emit 0FDh _emit 0FFh _emit 0FFh _emit 0B8h _emit 0FFh _emit 0FFh _emit 0FFh _emit 07Fh _emit 0B9h
        /* g_10191694 */ dword ptr [g_10191694]
        _emit 08Dh _emit 094h _emit 024h _emit 010h _emit 008h _emit 000h _emit 000h _emit 0E8h _emit 052h _emit 0D2h _emit 005h _emit 000h _emit 085h _emit 0C0h _emit 075h _emit 03Ah _emit 08Dh _emit 04Eh _emit 06Ch _emit 051h _emit 08Dh _emit 07Eh _emit 064h _emit 08Dh _emit 056h _emit 068h _emit 052h _emit 057h _emit 08Dh _emit 044h _emit 024h _emit 01Ch _emit 068h
        /* g_10191928 */ dword ptr [g_10191928]
        _emit 050h _emit 089h _emit 01Fh _emit 089h _emit 05Fh _emit 004h _emit 089h _emit 05Fh _emit 008h _emit 0E8h _emit 059h _emit 026h _emit 00Fh _emit 000h _emit 083h _emit 0C4h _emit 014h _emit 08Bh _emit 0D7h _emit 08Bh _emit 0CFh _emit 0E8h _emit 0CFh _emit 0A7h _emit 005h _emit 000h _emit 0DDh _emit 0D8h _emit 0C6h _emit 046h _emit 070h _emit 001h _emit 0E9h _emit 014h _emit 0FDh _emit 0FFh _emit 0FFh _emit 0B8h _emit 0FFh _emit 0FFh _emit 0FFh _emit 07Fh _emit 0B9h
        /* g_10191688 */ dword ptr [g_10191688]
        _emit 08Dh _emit 094h _emit 024h _emit 010h _emit 008h _emit 000h _emit 000h _emit 0E8h _emit 0FEh _emit 0D1h _emit 005h _emit 000h _emit 085h _emit 0C0h _emit 075h _emit 015h _emit 08Dh _emit 04Ch _emit 024h _emit 010h _emit 051h _emit 0E8h _emit 052h _emit 026h _emit 00Fh _emit 000h _emit 0D9h _emit 05Eh _emit 054h _emit 083h _emit 0C4h _emit 004h _emit 0E9h _emit 0E5h _emit 0FCh _emit 0FFh _emit 0FFh _emit 0B8h _emit 0FFh _emit 0FFh _emit 0FFh _emit 07Fh _emit 0B9h
        /* g_10191678 */ dword ptr [g_10191678]
        _emit 08Dh _emit 094h _emit 024h _emit 010h _emit 008h _emit 000h _emit 000h _emit 0E8h _emit 0CFh _emit 0D1h _emit 005h _emit 000h _emit 085h _emit 0C0h _emit 075h _emit 00Eh _emit 08Dh _emit 046h _emit 074h _emit 08Dh _emit 056h _emit 07Ch _emit 08Dh _emit 04Eh _emit 078h _emit 0E9h _emit 0B4h _emit 0FEh _emit 0FFh _emit 0FFh _emit 0B8h _emit 0FFh _emit 0FFh _emit 0FFh _emit 07Fh _emit 0B9h
        /* g_10191670 */ dword ptr [g_10191670]
        _emit 08Dh _emit 094h _emit 024h _emit 010h _emit 008h _emit 000h _emit 000h _emit 0E8h _emit 0A7h _emit 0D1h _emit 005h _emit 000h _emit 085h _emit 0C0h _emit 00Fh _emit 085h _emit 09Fh _emit 0FCh _emit 0FFh _emit 0FFh _emit 06Ah _emit 03Fh _emit 08Dh _emit 044h _emit 024h _emit 014h _emit 050h _emit 056h _emit 0E8h _emit 032h _emit 026h _emit 00Fh _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 088h _emit 05Eh _emit 03Fh _emit 0E9h _emit 087h _emit 0FCh _emit 0FFh _emit 0FFh
    }
}
