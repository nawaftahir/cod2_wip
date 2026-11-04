

__declspec(naked) void __setmode_lk(void)
{
    __asm {
        _emit 08Bh _emit 044h _emit 024h _emit 004h _emit 08Bh _emit 0C8h _emit 0C1h _emit 0F9h _emit 005h _emit 083h _emit 0E0h _emit 01Fh _emit 08Dh _emit 014h _emit 08Dh _emit 0A0h _emit 0ACh _emit 076h _emit 010h _emit 08Dh _emit 00Ch _emit 0C0h _emit 08Bh _emit 002h _emit 0C1h _emit 0E1h _emit 002h _emit 00Fh _emit 0B6h _emit 044h _emit 008h _emit 004h _emit 056h _emit 0BEh _emit 000h _emit 080h _emit 000h _emit 000h _emit 025h _emit 080h _emit 000h _emit 000h _emit 000h _emit 039h _emit 074h _emit 024h _emit 00Ch _emit 075h _emit 00Bh _emit 08Bh _emit 012h _emit 08Dh _emit 04Ch _emit 00Ah _emit 004h _emit 080h _emit 021h _emit 07Fh _emit 0EBh _emit 013h _emit 081h _emit 07Ch _emit 024h _emit 00Ch _emit 000h _emit 040h _emit 000h _emit 000h _emit 075h _emit 016h _emit 08Bh _emit 012h _emit 08Dh _emit 04Ch _emit 00Ah _emit 004h _emit 080h _emit 009h _emit 080h _emit 0F7h _emit 0D8h _emit 01Bh _emit 0C0h _emit 025h _emit 000h _emit 0C0h _emit 0FFh _emit 0FFh _emit 003h _emit 0C6h _emit 05Eh _emit 0C3h _emit 0E8h _emit 03Ch _emit 023h _emit 0FFh _emit 0FFh _emit 0C7h _emit 000h _emit 016h _emit 000h _emit 000h _emit 000h _emit 083h _emit 0C8h _emit 0FFh _emit 05Eh _emit 0C3h
    }
}
