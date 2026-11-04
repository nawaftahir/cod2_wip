extern int g_1010C17C;
extern int g_101A4F00;
extern int g_101A4F04;
extern int g_101A4F0C;

__declspec(naked) void __XcptFilter(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 051h _emit 053h _emit 056h _emit 057h _emit 0E8h _emit 09Fh _emit 0D0h _emit 0FFh _emit 0FFh _emit 08Bh _emit 07Dh _emit 008h _emit 08Bh _emit 0F0h _emit 08Bh _emit 056h _emit 054h _emit 0A1h
        /* g_101A4F0C */ dword ptr [g_101A4F0C]
        _emit 08Bh _emit 0CAh _emit 039h _emit 039h _emit 074h _emit 00Dh _emit 08Dh _emit 01Ch _emit 040h _emit 083h _emit 0C1h _emit 00Ch _emit 08Dh _emit 01Ch _emit 09Ah _emit 03Bh _emit 0CBh _emit 072h _emit 0EFh _emit 08Dh _emit 004h _emit 040h _emit 08Dh _emit 004h _emit 082h _emit 03Bh _emit 0C8h _emit 073h _emit 004h _emit 039h _emit 039h _emit 074h _emit 002h _emit 033h _emit 0C9h _emit 085h _emit 0C9h _emit 00Fh _emit 084h _emit 012h _emit 001h _emit 000h _emit 000h _emit 08Bh _emit 059h _emit 008h _emit 085h _emit 0DBh _emit 089h _emit 05Dh _emit 008h _emit 00Fh _emit 084h _emit 004h _emit 001h _emit 000h _emit 000h _emit 083h _emit 0FBh _emit 005h _emit 075h _emit 00Ch _emit 083h _emit 061h _emit 008h _emit 000h _emit 033h _emit 0C0h _emit 040h _emit 0E9h _emit 0FCh _emit 000h _emit 000h _emit 000h _emit 083h _emit 0FBh _emit 001h _emit 00Fh _emit 084h _emit 0E5h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 046h _emit 058h _emit 089h _emit 045h _emit 0FCh _emit 08Bh _emit 045h _emit 00Ch _emit 089h _emit 046h _emit 058h _emit 08Bh _emit 041h _emit 004h _emit 083h _emit 0F8h _emit 008h _emit 00Fh _emit 085h _emit 0BFh _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 015h
        /* g_101A4F00 */ dword ptr [g_101A4F00]
        _emit 0A1h
        /* g_101A4F04 */ dword ptr [g_101A4F04]
        _emit 003h _emit 0C2h _emit 03Bh _emit 0D0h _emit 07Dh _emit 027h _emit 08Dh _emit 004h _emit 052h _emit 0C1h _emit 0E0h _emit 002h _emit 08Bh _emit 07Eh _emit 054h _emit 083h _emit 064h _emit 038h _emit 008h _emit 000h _emit 08Bh _emit 03Dh
        /* g_101A4F00 */ dword ptr [g_101A4F00]
        _emit 08Bh _emit 01Dh
        /* g_101A4F04 */ dword ptr [g_101A4F04]
        _emit 042h _emit 003h _emit 0DFh _emit 083h _emit 0C0h _emit 00Ch _emit 03Bh _emit 0D3h _emit 07Ch _emit 0E2h _emit 08Bh _emit 05Dh _emit 008h _emit 08Bh _emit 009h _emit 081h _emit 0F9h _emit 08Eh _emit 000h _emit 000h _emit 0C0h _emit 08Bh _emit 07Eh _emit 05Ch _emit 075h _emit 009h _emit 0C7h _emit 046h _emit 05Ch _emit 083h _emit 000h _emit 000h _emit 000h _emit 0EBh _emit 064h _emit 081h _emit 0F9h _emit 090h _emit 000h _emit 000h _emit 0C0h _emit 075h _emit 009h _emit 0C7h _emit 046h _emit 05Ch _emit 081h _emit 000h _emit 000h _emit 000h _emit 0EBh _emit 053h _emit 081h _emit 0F9h _emit 091h _emit 000h _emit 000h _emit 0C0h _emit 075h _emit 009h _emit 0C7h _emit 046h _emit 05Ch _emit 084h _emit 000h _emit 000h _emit 000h _emit 0EBh _emit 042h _emit 081h _emit 0F9h _emit 093h _emit 000h _emit 000h _emit 0C0h _emit 075h _emit 009h _emit 0C7h _emit 046h _emit 05Ch _emit 085h _emit 000h _emit 000h _emit 000h _emit 0EBh _emit 031h _emit 081h _emit 0F9h _emit 08Dh _emit 000h _emit 000h _emit 0C0h _emit 075h _emit 009h _emit 0C7h _emit 046h _emit 05Ch _emit 082h _emit 000h _emit 000h _emit 000h _emit 0EBh _emit 020h _emit 081h _emit 0F9h _emit 08Fh _emit 000h _emit 000h _emit 0C0h _emit 075h _emit 009h _emit 0C7h _emit 046h _emit 05Ch _emit 086h _emit 000h _emit 000h _emit 000h _emit 0EBh _emit 00Fh _emit 081h _emit 0F9h _emit 092h _emit 000h _emit 000h _emit 0C0h _emit 075h _emit 007h _emit 0C7h _emit 046h _emit 05Ch _emit 08Ah _emit 000h _emit 000h _emit 000h _emit 0FFh _emit 076h _emit 05Ch _emit 06Ah _emit 008h _emit 0FFh _emit 0D3h _emit 059h _emit 089h _emit 07Eh _emit 05Ch _emit 0EBh _emit 007h _emit 083h _emit 061h _emit 008h _emit 000h _emit 050h _emit 0FFh _emit 0D3h _emit 08Bh _emit 045h _emit 0FCh _emit 059h _emit 089h _emit 046h _emit 058h _emit 083h _emit 0C8h _emit 0FFh _emit 0EBh _emit 009h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 015h
        /* g_1010C17C */ dword ptr [g_1010C17C]
        _emit 05Fh _emit 05Eh _emit 05Bh _emit 0C9h _emit 0C3h
    }
}
