extern int g_1017C458;

__declspec(naked) void _fflush(void)
{
    __asm {
        _emit 06Ah _emit 00Ch _emit 068h
        /* g_1017C458 */ dword ptr [g_1017C458]
        _emit 0E8h _emit 0C7h _emit 049h _emit 000h _emit 000h _emit 033h _emit 0F6h _emit 039h _emit 075h _emit 008h _emit 075h _emit 009h _emit 056h _emit 0E8h _emit 012h _emit 0FFh _emit 0FFh _emit 0FFh _emit 059h _emit 0EBh _emit 024h _emit 0FFh _emit 075h _emit 008h _emit 0E8h _emit 058h _emit 048h _emit 000h _emit 000h _emit 059h _emit 089h _emit 075h _emit 0FCh _emit 0FFh _emit 075h _emit 008h _emit 0E8h _emit 0CDh _emit 0FEh _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 045h _emit 0E4h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 009h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 045h _emit 0E4h _emit 0E8h _emit 0C9h _emit 049h _emit 000h _emit 000h _emit 0C3h
    }
}
