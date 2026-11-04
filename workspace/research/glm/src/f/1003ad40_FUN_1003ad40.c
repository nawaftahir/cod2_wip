extern int g_106D3200;
extern int g_1072D9B0;
extern int g_1072D9D0;
extern int g_1072D9D4;

__declspec(naked) void FUN_1003ad40(void)
{
    __asm {
        _emit 0A1h
        /* g_1072D9D4 */ dword ptr [g_1072D9D4]
        _emit 08Bh _emit 015h
        /* g_1072D9B0 */ dword ptr [g_1072D9B0]
        _emit 056h _emit 08Bh _emit 035h
        /* g_1072D9D0 */ dword ptr [g_1072D9D0]
        _emit 08Dh _emit 048h _emit 003h _emit 066h _emit 089h _emit 00Ch _emit 072h _emit 08Bh _emit 00Dh
        /* g_1072D9B0 */ dword ptr [g_1072D9B0]
        _emit 08Bh _emit 015h
        /* g_1072D9D0 */ dword ptr [g_1072D9D0]
        _emit 066h _emit 089h _emit 044h _emit 051h _emit 002h _emit 08Bh _emit 015h
        /* g_1072D9B0 */ dword ptr [g_1072D9B0]
        _emit 08Bh _emit 035h
        /* g_1072D9D0 */ dword ptr [g_1072D9D0]
        _emit 08Dh _emit 048h _emit 002h _emit 066h _emit 089h _emit 04Ch _emit 072h _emit 004h _emit 08Bh _emit 015h
        /* g_1072D9B0 */ dword ptr [g_1072D9B0]
        _emit 08Bh _emit 035h
        /* g_1072D9D0 */ dword ptr [g_1072D9D0]
        _emit 066h _emit 089h _emit 04Ch _emit 072h _emit 006h _emit 08Bh _emit 00Dh
        /* g_1072D9B0 */ dword ptr [g_1072D9B0]
        _emit 08Bh _emit 015h
        /* g_1072D9D0 */ dword ptr [g_1072D9D0]
        _emit 066h _emit 089h _emit 044h _emit 051h _emit 008h _emit 08Bh _emit 015h
        /* g_1072D9D0 */ dword ptr [g_1072D9D0]
        _emit 08Bh _emit 035h
        /* g_1072D9B0 */ dword ptr [g_1072D9B0]
        _emit 08Dh _emit 048h _emit 001h _emit 066h _emit 089h _emit 04Ch _emit 056h _emit 00Ah _emit 08Bh _emit 074h _emit 024h _emit 008h _emit 033h _emit 0C9h _emit 0BAh _emit 000h _emit 000h _emit 080h _emit 03Fh _emit 00Fh _emit 0B7h _emit 0C0h _emit 0C1h _emit 0E0h _emit 006h _emit 005h
        /* g_106D3200 */ dword ptr [g_106D3200]
        _emit 089h _emit 050h _emit 018h _emit 089h _emit 048h _emit 010h _emit 089h _emit 048h _emit 014h _emit 089h _emit 048h _emit 020h _emit 089h _emit 048h _emit 024h _emit 089h _emit 070h _emit 01Ch _emit 089h _emit 050h _emit 034h _emit 089h _emit 048h _emit 038h _emit 089h _emit 048h _emit 03Ch _emit 089h _emit 050h _emit 02Ch _emit 089h _emit 048h _emit 028h _emit 089h _emit 048h _emit 030h _emit 089h _emit 050h _emit 058h _emit 089h _emit 048h _emit 050h _emit 089h _emit 048h _emit 054h _emit 089h _emit 050h _emit 060h _emit 089h _emit 048h _emit 064h _emit 089h _emit 070h _emit 05Ch _emit 089h _emit 050h _emit 074h _emit 089h _emit 048h _emit 078h _emit 089h _emit 048h _emit 07Ch _emit 089h _emit 050h _emit 06Ch _emit 089h _emit 048h _emit 068h _emit 089h _emit 048h _emit 070h _emit 089h _emit 090h _emit 098h _emit 000h _emit 000h _emit 000h _emit 089h _emit 088h _emit 090h _emit 000h _emit 000h _emit 000h _emit 089h _emit 088h _emit 094h _emit 000h _emit 000h _emit 000h _emit 089h _emit 090h _emit 0A0h _emit 000h _emit 000h _emit 000h _emit 089h _emit 090h _emit 0A4h _emit 000h _emit 000h _emit 000h _emit 089h _emit 0B0h _emit 09Ch _emit 000h _emit 000h _emit 000h _emit 089h _emit 090h _emit 0B4h _emit 000h _emit 000h _emit 000h _emit 089h _emit 088h _emit 0B8h _emit 000h _emit 000h _emit 000h _emit 089h _emit 088h _emit 0BCh _emit 000h _emit 000h _emit 000h _emit 089h _emit 090h _emit 0ACh _emit 000h _emit 000h _emit 000h _emit 089h _emit 088h _emit 0A8h _emit 000h _emit 000h _emit 000h _emit 089h _emit 088h _emit 0B0h _emit 000h _emit 000h _emit 000h _emit 089h _emit 090h _emit 0D8h _emit 000h _emit 000h _emit 000h _emit 089h _emit 088h _emit 0D0h _emit 000h _emit 000h _emit 000h _emit 089h _emit 088h _emit 0D4h _emit 000h _emit 000h _emit 000h _emit 089h _emit 090h _emit 0E4h _emit 000h _emit 000h _emit 000h _emit 089h _emit 088h _emit 0E0h _emit 000h _emit 000h _emit 000h _emit 089h _emit 0B0h _emit 0DCh _emit 000h _emit 000h _emit 000h _emit 089h _emit 090h _emit 0F4h _emit 000h _emit 000h _emit 000h _emit 089h _emit 088h _emit 0F8h _emit 000h _emit 000h _emit 000h _emit 089h _emit 088h _emit 0FCh _emit 000h _emit 000h _emit 000h _emit 089h _emit 090h _emit 0ECh _emit 000h _emit 000h _emit 000h _emit 089h _emit 088h _emit 0E8h _emit 000h _emit 000h _emit 000h _emit 089h _emit 088h _emit 0F0h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 015h
        /* g_1072D9D4 */ dword ptr [g_1072D9D4]
        _emit 08Bh _emit 00Dh
        /* g_1072D9D0 */ dword ptr [g_1072D9D0]
        _emit 083h _emit 0C2h _emit 004h _emit 089h _emit 015h
        /* g_1072D9D4 */ dword ptr [g_1072D9D4]
        _emit 083h _emit 0C1h _emit 006h _emit 089h _emit 00Dh
        /* g_1072D9D0 */ dword ptr [g_1072D9D0]
        _emit 05Eh _emit 0C3h
    }
}
