

__declspec(naked) void write_char(void)
{
    __asm {
        _emit 0F6h _emit 040h _emit 00Ch _emit 040h _emit 074h _emit 006h _emit 083h _emit 078h _emit 008h _emit 000h _emit 074h _emit 016h _emit 050h _emit 0FFh _emit 074h _emit 024h _emit 008h _emit 0E8h _emit 058h _emit 036h _emit 000h _emit 000h _emit 066h _emit 03Dh _emit 0FFh _emit 0FFh _emit 059h _emit 059h _emit 075h _emit 004h _emit 083h _emit 00Eh _emit 0FFh _emit 0C3h _emit 0FFh _emit 006h _emit 0C3h
    }
}
