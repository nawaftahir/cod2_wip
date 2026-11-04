extern int g_1019166E;
extern int g_101A46B0;
extern int g_101A4732;
extern int g_101A4738;
extern int g_101A50D0;
extern int g_101ADD98;
extern int g_101ADD9C;
extern int g_101ADDA0;

__declspec(naked) void __expandlocale(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 081h _emit 0ECh _emit 094h _emit 000h _emit 000h _emit 000h _emit 0A1h
        /* g_101A50D0 */ dword ptr [g_101A50D0]
        _emit 056h _emit 08Bh _emit 075h _emit 008h _emit 033h _emit 0D2h _emit 03Bh _emit 0F2h _emit 089h _emit 045h _emit 0FCh _emit 075h _emit 007h _emit 033h _emit 0C0h _emit 0E9h _emit 02Fh _emit 001h _emit 000h _emit 000h _emit 080h _emit 03Eh _emit 043h _emit 075h _emit 034h _emit 080h _emit 07Eh _emit 001h _emit 000h _emit 075h _emit 02Eh _emit 08Bh _emit 045h _emit 00Ch _emit 08Bh _emit 04Dh _emit 010h _emit 03Bh _emit 0CAh _emit 0C6h _emit 000h _emit 043h _emit 0C6h _emit 040h _emit 001h _emit 000h _emit 074h _emit 00Bh _emit 066h _emit 089h _emit 011h _emit 066h _emit 089h _emit 051h _emit 002h _emit 066h _emit 089h _emit 051h _emit 004h _emit 08Bh _emit 04Dh _emit 014h _emit 03Bh _emit 0CAh _emit 00Fh _emit 084h _emit 0FDh _emit 000h _emit 000h _emit 000h _emit 089h _emit 011h _emit 0E9h _emit 0F6h _emit 000h _emit 000h _emit 000h _emit 053h _emit 057h _emit 056h _emit 0E8h _emit 0EBh _emit 023h _emit 000h _emit 000h _emit 0BFh _emit 082h _emit 000h _emit 000h _emit 000h _emit 03Bh _emit 0C7h _emit 059h _emit 0BBh
        /* g_101A46B0 */ dword ptr [g_101A46B0]
        _emit 073h _emit 022h _emit 056h _emit 068h
        /* g_101A4738 */ dword ptr [g_101A4738]
        _emit 0E8h _emit 071h _emit 085h _emit 000h _emit 000h _emit 085h _emit 0C0h _emit 059h _emit 059h _emit 00Fh _emit 084h _emit 086h _emit 000h _emit 000h _emit 000h _emit 056h _emit 053h _emit 0E8h _emit 060h _emit 085h _emit 000h _emit 000h _emit 085h _emit 0C0h _emit 059h _emit 059h _emit 074h _emit 079h _emit 08Dh _emit 085h _emit 06Ch _emit 0FFh _emit 0FFh _emit 0FFh _emit 056h _emit 050h _emit 0E8h _emit 03Bh _emit 0FDh _emit 0FFh _emit 0FFh _emit 085h _emit 0C0h _emit 059h _emit 059h _emit 075h _emit 019h _emit 08Dh _emit 085h _emit 06Ch _emit 0FFh _emit 0FFh _emit 0FFh _emit 050h _emit 068h
        /* g_101ADD98 */ dword ptr [g_101ADD98]
        _emit 050h _emit 0E8h _emit 0FCh _emit 08Ch _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 085h _emit 0C0h _emit 075h _emit 007h _emit 033h _emit 0C0h _emit 0E9h _emit 088h _emit 000h _emit 000h _emit 000h _emit 00Fh _emit 0B7h _emit 005h
        /* g_101ADD9C */ dword ptr [g_101ADD9C]
        _emit 0A3h
        /* g_101ADDA0 */ dword ptr [g_101ADDA0]
        _emit 08Dh _emit 085h _emit 06Ch _emit 0FFh _emit 0FFh _emit 0FFh _emit 050h _emit 068h
        /* g_101A4738 */ dword ptr [g_101A4738]
        _emit 0E8h _emit 0D4h _emit 0FDh _emit 0FFh _emit 0FFh _emit 080h _emit 03Eh _emit 000h _emit 059h _emit 059h _emit 074h _emit 00Bh _emit 056h _emit 0E8h _emit 05Dh _emit 023h _emit 000h _emit 000h _emit 03Bh _emit 0C7h _emit 059h _emit 072h _emit 005h _emit 0BEh
        /* g_1019166E */ dword ptr [g_1019166E]
        _emit 057h _emit 056h _emit 053h _emit 0C6h _emit 005h _emit 032h
        /* g_101A4732 */ dword ptr [g_101A4732]
        _emit 0E8h _emit 034h _emit 0DFh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 00Ch _emit 083h _emit 07Dh _emit 010h _emit 000h _emit 074h _emit 012h _emit 06Ah _emit 006h _emit 068h
        /* g_101ADD98 */ dword ptr [g_101ADD98]
        _emit 0FFh _emit 075h _emit 010h _emit 0E8h _emit 01Ch _emit 04Fh _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 083h _emit 07Dh _emit 014h _emit 000h _emit 074h _emit 012h _emit 06Ah _emit 004h _emit 068h
        /* g_101ADDA0 */ dword ptr [g_101ADDA0]
        _emit 0FFh _emit 075h _emit 014h _emit 0E8h _emit 004h _emit 04Fh _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 0BEh
        /* g_101A4738 */ dword ptr [g_101A4738]
        _emit 056h _emit 0FFh _emit 075h _emit 00Ch _emit 0E8h _emit 093h _emit 069h _emit 000h _emit 000h _emit 059h _emit 059h _emit 08Bh _emit 0C6h _emit 05Fh _emit 05Bh _emit 08Bh _emit 04Dh _emit 0FCh _emit 05Eh _emit 0E8h _emit 041h _emit 08Eh _emit 000h _emit 000h _emit 0C9h _emit 0C3h
    }
}
