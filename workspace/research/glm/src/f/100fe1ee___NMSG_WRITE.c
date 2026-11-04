extern int g_1010C124;
extern int g_1010C154;
extern int g_1010C160;
extern int g_1017CD90;
extern int g_1017CDB8;
extern int g_1017CDBC;
extern int g_1017CDD8;
extern int g_1017CDDC;
extern int g_101A50D0;
extern int g_101ADD88;
extern int g_101ADD8C;

__declspec(naked) void __NMSG_WRITE(void)
{
    __asm {
        _emit 055h _emit 08Dh _emit 0ACh _emit 024h _emit 074h _emit 0FFh _emit 0FFh _emit 0FFh _emit 081h _emit 0ECh _emit 00Ch _emit 001h _emit 000h _emit 000h _emit 0A1h
        /* g_101A50D0 */ dword ptr [g_101A50D0]
        _emit 08Bh _emit 08Dh _emit 094h _emit 000h _emit 000h _emit 000h _emit 053h _emit 056h _emit 089h _emit 085h _emit 088h _emit 000h _emit 000h _emit 000h _emit 033h _emit 0D2h _emit 057h _emit 033h _emit 0C0h _emit 03Bh _emit 00Ch _emit 0C5h _emit 010h _emit 04Fh _emit 01Ah _emit 010h _emit 074h _emit 006h _emit 040h _emit 083h _emit 0F8h _emit 013h _emit 072h _emit 0F1h _emit 08Bh _emit 0F0h _emit 0C1h _emit 0E6h _emit 003h _emit 03Bh _emit 08Eh _emit 010h _emit 04Fh _emit 01Ah _emit 010h _emit 00Fh _emit 085h _emit 015h _emit 001h _emit 000h _emit 000h _emit 0A1h
        /* g_101ADD88 */ dword ptr [g_101ADD88]
        _emit 083h _emit 0F8h _emit 001h _emit 00Fh _emit 084h _emit 0DFh _emit 000h _emit 000h _emit 000h _emit 03Bh _emit 0C2h _emit 075h _emit 00Dh _emit 083h _emit 03Dh _emit 08Ch
        /* g_101ADD8C */ dword ptr [g_101ADD8C]
        _emit 00Fh _emit 084h _emit 0CEh _emit 000h _emit 000h _emit 000h _emit 081h _emit 0F9h _emit 0FCh _emit 000h _emit 000h _emit 000h _emit 00Fh _emit 084h _emit 0EAh _emit 000h _emit 000h _emit 000h _emit 068h _emit 004h _emit 001h _emit 000h _emit 000h _emit 08Dh _emit 045h _emit 080h _emit 050h _emit 052h _emit 088h _emit 095h _emit 084h _emit 000h _emit 000h _emit 000h _emit 0FFh _emit 015h
        /* g_1010C160 */ dword ptr [g_1010C160]
        _emit 085h _emit 0C0h _emit 075h _emit 010h _emit 08Dh _emit 045h _emit 080h _emit 068h
        /* g_1017CDDC */ dword ptr [g_1017CDDC]
        _emit 050h _emit 0E8h _emit 009h _emit 006h _emit 000h _emit 000h _emit 059h _emit 059h _emit 08Dh _emit 07Dh _emit 080h _emit 08Bh _emit 0C7h _emit 050h _emit 0E8h _emit 06Ch _emit 0BFh _emit 0FFh _emit 0FFh _emit 040h _emit 083h _emit 0F8h _emit 03Ch _emit 059h _emit 076h _emit 022h _emit 08Bh _emit 0C7h _emit 050h _emit 0E8h _emit 05Dh _emit 0BFh _emit 0FFh _emit 0FFh _emit 08Bh _emit 0F8h _emit 08Dh _emit 045h _emit 080h _emit 083h _emit 0E8h _emit 03Bh _emit 06Ah _emit 003h _emit 003h _emit 0F8h _emit 068h
        /* g_1017CDD8 */ dword ptr [g_1017CDD8]
        _emit 057h _emit 0E8h _emit 036h _emit 07Bh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 010h _emit 057h _emit 0E8h _emit 03Dh _emit 0BFh _emit 0FFh _emit 0FFh _emit 0FFh _emit 0B6h _emit 014h _emit 04Fh _emit 01Ah _emit 010h _emit 08Bh _emit 0D8h _emit 0E8h _emit 030h _emit 0BFh _emit 0FFh _emit 0FFh _emit 08Dh _emit 044h _emit 003h _emit 01Ch _emit 059h _emit 083h _emit 0C0h _emit 003h _emit 059h _emit 083h _emit 0E0h _emit 0FCh _emit 0E8h _emit 04Fh _emit 0A5h _emit 0FFh _emit 0FFh _emit 08Bh _emit 0DCh _emit 068h
        /* g_1017CDBC */ dword ptr [g_1017CDBC]
        _emit 053h _emit 0E8h _emit 0A2h _emit 005h _emit 000h _emit 000h _emit 057h _emit 053h _emit 0E8h _emit 0ABh _emit 005h _emit 000h _emit 000h _emit 068h
        /* g_1017CDB8 */ dword ptr [g_1017CDB8]
        _emit 053h _emit 0E8h _emit 0A0h _emit 005h _emit 000h _emit 000h _emit 0FFh _emit 0B6h _emit 014h _emit 04Fh _emit 01Ah _emit 010h _emit 053h _emit 0E8h _emit 094h _emit 005h _emit 000h _emit 000h _emit 068h _emit 010h _emit 020h _emit 001h _emit 000h _emit 068h
        /* g_1017CD90 */ dword ptr [g_1017CD90]
        _emit 053h _emit 0E8h _emit 069h _emit 09Fh _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 02Ch _emit 0EBh _emit 028h _emit 052h _emit 08Dh _emit 085h _emit 094h _emit 000h _emit 000h _emit 000h _emit 050h _emit 08Dh _emit 0B6h _emit 014h _emit 04Fh _emit 01Ah _emit 010h _emit 0FFh _emit 036h _emit 0E8h _emit 0CAh _emit 0BEh _emit 0FFh _emit 0FFh _emit 059h _emit 050h _emit 0FFh _emit 036h _emit 06Ah _emit 0F4h _emit 0FFh _emit 015h
        /* g_1010C154 */ dword ptr [g_1010C154]
        _emit 050h _emit 0FFh _emit 015h
        /* g_1010C124 */ dword ptr [g_1010C124]
        _emit 08Dh _emit 0A5h _emit 074h _emit 0FFh _emit 0FFh _emit 0FFh _emit 08Bh _emit 08Dh _emit 088h _emit 000h _emit 000h _emit 000h _emit 0E8h _emit 0F3h _emit 029h _emit 000h _emit 000h _emit 05Fh _emit 05Eh _emit 05Bh _emit 081h _emit 0C5h _emit 08Ch _emit 000h _emit 000h _emit 000h _emit 0C9h _emit 0C3h
    }
}
