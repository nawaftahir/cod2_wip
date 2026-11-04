extern int g_1010C030;

__declspec(naked) void __lock(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 08Bh _emit 045h _emit 008h _emit 056h _emit 08Dh _emit 034h _emit 0C5h _emit 028h _emit 04Bh _emit 01Ah _emit 010h _emit 083h _emit 03Eh _emit 000h _emit 075h _emit 013h _emit 050h _emit 0E8h _emit 047h _emit 0FFh _emit 0FFh _emit 0FFh _emit 085h _emit 0C0h _emit 059h _emit 075h _emit 008h _emit 06Ah _emit 011h _emit 0E8h _emit 090h _emit 0B7h _emit 0FFh _emit 0FFh _emit 059h _emit 0FFh _emit 036h _emit 0FFh _emit 015h
        /* g_1010C030 */ dword ptr [g_1010C030]
        _emit 05Eh _emit 05Dh _emit 0C3h
    }
}
