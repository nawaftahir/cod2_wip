extern int g_1017C68C;
extern int g_10195820;
extern int g_101A47C4;
extern int g_101A47CC;
extern int g_101A47FC;
extern int g_101A4800;
extern int g_101A50D0;

__declspec(naked) void __setlocale_lk(void)
{
    __asm {
        _emit 055h _emit 08Dh _emit 06Ch _emit 024h _emit 088h _emit 081h _emit 0ECh _emit 094h _emit 000h _emit 000h _emit 000h _emit 0A1h
        /* g_101A50D0 */ dword ptr [g_101A50D0]
        _emit 053h _emit 056h _emit 08Bh _emit 0F2h _emit 033h _emit 0DBh _emit 03Bh _emit 0F3h _emit 057h _emit 089h _emit 045h _emit 074h _emit 08Bh _emit 0F9h _emit 074h _emit 01Fh _emit 03Bh _emit 0FBh _emit 074h _emit 00Ch _emit 057h _emit 0E8h _emit 047h _emit 0FDh _emit 0FFh _emit 0FFh _emit 059h _emit 0E9h _emit 006h _emit 001h _emit 000h _emit 000h _emit 08Dh _emit 004h _emit 076h _emit 08Bh _emit 034h _emit 085h _emit 0C4h _emit 047h _emit 01Ah _emit 010h _emit 0E9h _emit 0F9h _emit 000h _emit 000h _emit 000h _emit 03Bh _emit 0FBh _emit 0C7h _emit 045h _emit 0E8h _emit 001h _emit 000h _emit 000h _emit 000h _emit 089h _emit 05Dh _emit 0ECh _emit 00Fh _emit 084h _emit 0E0h _emit 000h _emit 000h _emit 000h _emit 080h _emit 03Fh _emit 04Ch _emit 00Fh _emit 085h _emit 0F4h _emit 000h _emit 000h _emit 000h _emit 080h _emit 07Fh _emit 001h _emit 043h _emit 00Fh _emit 085h _emit 0EAh _emit 000h _emit 000h _emit 000h _emit 080h _emit 07Fh _emit 002h _emit 05Fh _emit 00Fh _emit 085h _emit 0E0h _emit 000h _emit 000h _emit 000h _emit 068h
        /* g_1017C68C */ dword ptr [g_1017C68C]
        _emit 057h _emit 0E8h _emit 00Ah _emit 08Eh _emit 000h _emit 000h _emit 08Bh _emit 0D8h _emit 085h _emit 0DBh _emit 059h _emit 059h _emit 00Fh _emit 084h _emit 0C5h _emit 000h _emit 000h _emit 000h _emit 02Bh _emit 0C7h _emit 089h _emit 045h _emit 0E8h _emit 00Fh _emit 084h _emit 0BAh _emit 000h _emit 000h _emit 000h _emit 080h _emit 03Bh _emit 03Bh _emit 00Fh _emit 084h _emit 0B1h _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0E4h _emit 001h _emit 000h _emit 000h _emit 000h _emit 0BEh
        /* g_101A47CC */ dword ptr [g_101A47CC]
        _emit 0EBh _emit 003h _emit 08Bh _emit 045h _emit 0E8h _emit 050h _emit 057h _emit 0FFh _emit 036h _emit 0E8h _emit 090h _emit 08Dh _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 085h _emit 0C0h _emit 075h _emit 00Dh _emit 0FFh _emit 036h _emit 0E8h _emit 0A2h _emit 01Fh _emit 000h _emit 000h _emit 039h _emit 045h _emit 0E8h _emit 059h _emit 074h _emit 00Eh _emit 0FFh _emit 045h _emit 0E4h _emit 083h _emit 0C6h _emit 00Ch _emit 081h _emit 0FEh
        /* g_101A47FC */ dword ptr [g_101A47FC]
        _emit 07Eh _emit 0D2h _emit 043h _emit 068h
        /* g_10195820 */ dword ptr [g_10195820]
        _emit 053h _emit 0E8h _emit 072h _emit 080h _emit 000h _emit 000h _emit 08Bh _emit 0F8h _emit 085h _emit 0FFh _emit 059h _emit 059h _emit 075h _emit 005h _emit 080h _emit 03Bh _emit 03Bh _emit 075h _emit 05Ch _emit 08Bh _emit 075h _emit 0E4h _emit 083h _emit 0FEh _emit 005h _emit 07Fh _emit 023h _emit 057h _emit 08Dh _emit 045h _emit 0F0h _emit 053h _emit 050h _emit 0E8h _emit 052h _emit 0DBh _emit 0FFh _emit 0FFh _emit 08Dh _emit 045h _emit 0F0h _emit 050h _emit 0C6h _emit 044h _emit 03Dh _emit 0F0h _emit 000h _emit 0E8h _emit 062h _emit 0FCh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 010h _emit 085h _emit 0C0h _emit 074h _emit 003h _emit 0FFh _emit 045h _emit 0ECh _emit 003h _emit 0FBh _emit 080h _emit 03Fh _emit 000h _emit 074h _emit 00Ah _emit 047h _emit 080h _emit 03Fh _emit 000h _emit 00Fh _emit 085h _emit 044h _emit 0FFh _emit 0FFh _emit 0FFh _emit 033h _emit 0F6h _emit 039h _emit 075h _emit 0ECh _emit 074h _emit 007h _emit 0E8h _emit 020h _emit 0FAh _emit 0FFh _emit 0FFh _emit 08Bh _emit 0F0h _emit 08Bh _emit 0C6h _emit 08Bh _emit 04Dh _emit 074h _emit 05Fh _emit 05Eh _emit 05Bh _emit 0E8h _emit 06Bh _emit 08Ah _emit 000h _emit 000h _emit 083h _emit 0C5h _emit 078h _emit 0C9h _emit 0C3h _emit 033h _emit 0C0h _emit 0EBh _emit 0ECh _emit 053h _emit 053h _emit 053h _emit 08Dh _emit 045h _emit 0F0h _emit 050h _emit 057h _emit 0E8h _emit 0BAh _emit 0FAh _emit 0FFh _emit 0FFh _emit 08Bh _emit 0F0h _emit 083h _emit 0C4h _emit 014h _emit 03Bh _emit 0F3h _emit 074h _emit 0D4h _emit 0BFh
        /* g_101A47C4 */ dword ptr [g_101A47C4]
        _emit 033h _emit 0F6h _emit 08Bh _emit 0DFh _emit 03Bh _emit 0DFh _emit 074h _emit 027h _emit 0FFh _emit 033h _emit 08Dh _emit 045h _emit 0F0h _emit 050h _emit 0E8h _emit 087h _emit 080h _emit 000h _emit 000h _emit 085h _emit 0C0h _emit 059h _emit 059h _emit 074h _emit 013h _emit 08Dh _emit 045h _emit 0F0h _emit 050h _emit 0E8h _emit 0E6h _emit 0FBh _emit 0FFh _emit 0FFh _emit 085h _emit 0C0h _emit 059h _emit 075h _emit 005h _emit 021h _emit 045h _emit 0E8h _emit 0EBh _emit 003h _emit 0FFh _emit 045h _emit 0ECh _emit 083h _emit 0C3h _emit 00Ch _emit 046h _emit 081h _emit 0FBh
        /* g_101A4800 */ dword ptr [g_101A4800]
        _emit 07Eh _emit 0C9h _emit 033h _emit 0FFh _emit 039h _emit 07Dh _emit 0E8h _emit 074h _emit 01Eh _emit 0E8h _emit 0A6h _emit 0F9h _emit 0FFh _emit 0FFh _emit 0FFh _emit 035h
        /* g_101A47C4 */ dword ptr [g_101A47C4]
        _emit 08Bh _emit 0F0h _emit 0E8h _emit 076h _emit 001h _emit 000h _emit 000h _emit 059h _emit 089h _emit 03Dh
        /* g_101A47C4 */ dword ptr [g_101A47C4]
        _emit 0E9h _emit 06Fh _emit 0FFh _emit 0FFh _emit 0FFh _emit 039h _emit 07Dh _emit 0ECh _emit 00Fh _emit 085h _emit 05Fh _emit 0FFh _emit 0FFh _emit 0FFh _emit 033h _emit 0F6h _emit 0E9h _emit 05Fh _emit 0FFh _emit 0FFh _emit 0FFh
    }
}
