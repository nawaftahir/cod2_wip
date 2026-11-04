extern int g_101A4E60;
extern int g_101A50D0;

__declspec(naked) void __putwc_lk(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 083h _emit 0ECh _emit 00Ch _emit 0A1h
        /* g_101A50D0 */ dword ptr [g_101A50D0]
        _emit 053h _emit 056h _emit 08Bh _emit 075h _emit 00Ch _emit 0F6h _emit 046h _emit 00Ch _emit 040h _emit 089h _emit 045h _emit 0FCh _emit 057h _emit 00Fh _emit 085h _emit 08Bh _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 046h _emit 010h _emit 083h _emit 0F8h _emit 0FFh _emit 074h _emit 017h _emit 08Bh _emit 0C8h _emit 0C1h _emit 0F9h _emit 005h _emit 08Bh _emit 00Ch _emit 08Dh _emit 0A0h _emit 0ACh _emit 076h _emit 010h _emit 083h _emit 0E0h _emit 01Fh _emit 08Dh _emit 004h _emit 0C0h _emit 08Dh _emit 004h _emit 081h _emit 0EBh _emit 005h _emit 0B8h
        /* g_101A4E60 */ dword ptr [g_101A4E60]
        _emit 0F6h _emit 040h _emit 004h _emit 080h _emit 074h _emit 061h _emit 0FFh _emit 075h _emit 008h _emit 08Dh _emit 045h _emit 0F4h _emit 050h _emit 0E8h _emit 03Bh _emit 0E0h _emit 0FFh _emit 0FFh _emit 08Bh _emit 0D8h _emit 083h _emit 0FBh _emit 0FFh _emit 059h _emit 059h _emit 075h _emit 011h _emit 0E8h _emit 0B6h _emit 036h _emit 0FFh _emit 0FFh _emit 0C7h _emit 000h _emit 02Ah _emit 000h _emit 000h _emit 000h _emit 066h _emit 00Dh _emit 0FFh _emit 0FFh _emit 0EBh _emit 05Bh _emit 033h _emit 0FFh _emit 085h _emit 0DBh _emit 07Eh _emit 02Fh _emit 0FFh _emit 04Eh _emit 004h _emit 078h _emit 012h _emit 08Bh _emit 006h _emit 08Ah _emit 04Ch _emit 03Dh _emit 0F4h _emit 088h _emit 008h _emit 08Bh _emit 00Eh _emit 00Fh _emit 0B6h _emit 001h _emit 041h _emit 089h _emit 00Eh _emit 0EBh _emit 00Eh _emit 00Fh _emit 0BEh _emit 044h _emit 03Dh _emit 0F4h _emit 056h _emit 050h _emit 0E8h _emit 08Bh _emit 017h _emit 0FFh _emit 0FFh _emit 059h _emit 059h _emit 083h _emit 0F8h _emit 0FFh _emit 074h _emit 0CAh _emit 047h _emit 03Bh _emit 0FBh _emit 07Ch _emit 0D1h _emit 066h _emit 08Bh _emit 045h _emit 008h _emit 0EBh _emit 020h _emit 083h _emit 046h _emit 004h _emit 0FEh _emit 078h _emit 00Dh _emit 08Bh _emit 00Eh _emit 08Bh _emit 045h _emit 008h _emit 066h _emit 089h _emit 001h _emit 083h _emit 006h _emit 002h _emit 0EBh _emit 00Dh _emit 00Fh _emit 0B7h _emit 045h _emit 008h _emit 056h _emit 050h _emit 0E8h _emit 08Ch _emit 011h _emit 000h _emit 000h _emit 059h _emit 059h _emit 08Bh _emit 04Dh _emit 0FCh _emit 05Fh _emit 05Eh _emit 05Bh _emit 0E8h _emit 07Bh _emit 081h _emit 0FFh _emit 0FFh _emit 0C9h _emit 0C3h
    }
}
