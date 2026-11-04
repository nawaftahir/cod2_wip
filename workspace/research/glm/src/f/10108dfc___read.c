extern int g_10182500;
extern int g_1076AC9C;

__declspec(naked) void __read(void)
{
    __asm {
        _emit 06Ah _emit 00Ch _emit 068h
        /* g_10182500 */ dword ptr [g_10182500]
        _emit 0E8h _emit 008h _emit 028h _emit 0FFh _emit 0FFh _emit 08Bh _emit 05Dh _emit 008h _emit 03Bh _emit 01Dh
        /* g_1076AC9C */ dword ptr [g_1076AC9C]
        _emit 073h _emit 078h _emit 08Bh _emit 0C3h _emit 0C1h _emit 0F8h _emit 005h _emit 08Dh _emit 03Ch _emit 085h _emit 0A0h _emit 0ACh _emit 076h _emit 010h _emit 08Bh _emit 0C3h _emit 083h _emit 0E0h _emit 01Fh _emit 08Dh _emit 034h _emit 0C0h _emit 0C1h _emit 0E6h _emit 002h _emit 08Bh _emit 007h _emit 0F6h _emit 044h _emit 030h _emit 004h _emit 001h _emit 074h _emit 058h _emit 053h _emit 0E8h _emit 018h _emit 0E9h _emit 0FFh _emit 0FFh _emit 059h _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 08Bh _emit 007h _emit 0F6h _emit 044h _emit 030h _emit 004h _emit 001h _emit 074h _emit 014h _emit 0FFh _emit 075h _emit 010h _emit 0FFh _emit 075h _emit 00Ch _emit 053h _emit 0E8h _emit 0CEh _emit 0FDh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 00Ch _emit 089h _emit 045h _emit 0E4h _emit 0EBh _emit 017h _emit 0E8h _emit 0B6h _emit 033h _emit 0FFh _emit 0FFh _emit 0C7h _emit 000h _emit 009h _emit 000h _emit 000h _emit 000h _emit 0E8h _emit 0B4h _emit 033h _emit 0FFh _emit 0FFh _emit 083h _emit 020h _emit 000h _emit 083h _emit 04Dh _emit 0E4h _emit 0FFh _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 008h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 045h _emit 0E4h _emit 0EBh _emit 021h _emit 08Bh _emit 05Dh _emit 008h _emit 053h _emit 0E8h _emit 068h _emit 0E9h _emit 0FFh _emit 0FFh _emit 059h _emit 0C3h _emit 0E8h _emit 086h _emit 033h _emit 0FFh _emit 0FFh _emit 0C7h _emit 000h _emit 009h _emit 000h _emit 000h _emit 000h _emit 0E8h _emit 084h _emit 033h _emit 0FFh _emit 0FFh _emit 083h
    }
}
