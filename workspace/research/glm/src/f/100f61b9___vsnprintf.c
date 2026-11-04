

__declspec(naked) void __vsnprintf(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 083h _emit 0ECh _emit 020h _emit 08Bh _emit 045h _emit 00Ch _emit 056h _emit 08Bh _emit 075h _emit 008h _emit 057h _emit 0FFh _emit 075h _emit 014h _emit 089h _emit 045h _emit 0E4h _emit 0FFh _emit 075h _emit 010h _emit 08Dh _emit 045h _emit 0E0h _emit 050h _emit 0C7h _emit 045h _emit 0ECh _emit 042h _emit 000h _emit 000h _emit 000h _emit 089h _emit 075h _emit 0E8h _emit 089h _emit 075h _emit 0E0h _emit 0E8h _emit 000h _emit 043h _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 085h _emit 0F6h _emit 08Bh _emit 0F8h _emit 074h _emit 01Ah _emit 0FFh _emit 04Dh _emit 0E4h _emit 078h _emit 008h _emit 08Bh _emit 045h _emit 0E0h _emit 0C6h _emit 000h _emit 000h _emit 0EBh _emit 00Dh _emit 08Dh _emit 045h _emit 0E0h _emit 050h _emit 06Ah _emit 000h _emit 0E8h _emit 019h _emit 041h _emit 000h _emit 000h _emit 059h _emit 059h _emit 08Bh _emit 0C7h _emit 05Fh _emit 05Eh _emit 0C9h _emit 0C3h
    }
}
