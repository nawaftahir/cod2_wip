extern int g_1010C030;
extern int g_10182210;

__declspec(naked) void __lock_fhandle(void)
{
    __asm {
        _emit 06Ah _emit 008h _emit 068h
        /* g_10182210 */ dword ptr [g_10182210]
        _emit 0E8h _emit 0B3h _emit 03Eh _emit 0FFh _emit 0FFh _emit 08Bh _emit 07Dh _emit 008h _emit 08Bh _emit 0CFh _emit 0C1h _emit 0F9h _emit 005h _emit 08Bh _emit 0C7h _emit 083h _emit 0E0h _emit 01Fh _emit 08Dh _emit 004h _emit 0C0h _emit 08Bh _emit 00Ch _emit 08Dh _emit 0A0h _emit 0ACh _emit 076h _emit 010h _emit 08Dh _emit 034h _emit 081h _emit 033h _emit 0DBh _emit 039h _emit 05Eh _emit 008h _emit 075h _emit 041h _emit 06Ah _emit 00Ah _emit 0E8h _emit 0F8h _emit 048h _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 05Dh _emit 0FCh _emit 039h _emit 05Eh _emit 008h _emit 075h _emit 028h _emit 068h _emit 0A0h _emit 00Fh _emit 000h _emit 000h _emit 08Dh _emit 046h _emit 00Ch _emit 050h _emit 0E8h _emit 0CAh _emit 002h _emit 000h _emit 000h _emit 059h _emit 059h _emit 085h _emit 0C0h _emit 075h _emit 011h _emit 06Ah _emit 0FFh _emit 08Dh _emit 045h _emit 0F0h _emit 050h _emit 0E8h _emit 0F5h _emit 098h _emit 0FFh _emit 0FFh _emit 059h _emit 059h _emit 033h _emit 0C0h _emit 0EBh _emit 02Ch _emit 0FFh _emit 046h _emit 008h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 029h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 0C7h _emit 0C1h _emit 0F8h _emit 005h _emit 083h _emit 0E7h _emit 01Fh _emit 08Dh _emit 00Ch _emit 0FFh _emit 08Bh _emit 004h _emit 085h _emit 0A0h _emit 0ACh _emit 076h _emit 010h _emit 08Dh _emit 044h _emit 088h _emit 00Ch _emit 050h _emit 0FFh _emit 015h
        /* g_1010C030 */ dword ptr [g_1010C030]
        _emit 033h _emit 0C0h _emit 040h _emit 0E8h _emit 067h _emit 03Eh _emit 0FFh _emit 0FFh _emit 0C3h
    }
}
