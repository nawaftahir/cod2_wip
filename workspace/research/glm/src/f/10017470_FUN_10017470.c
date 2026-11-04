extern int g_101D7FD4;
extern int g_1076A830;

__declspec(naked) void FUN_10017470(void)
{
    __asm {
        _emit 053h _emit 055h _emit 056h _emit 057h _emit 033h _emit 0F6h _emit 0E8h _emit 015h _emit 011h _emit 002h _emit 000h _emit 0BBh
        /* g_101D7FD4 */ dword ptr [g_101D7FD4]
        _emit 0BDh _emit 020h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 0F3h _emit 0BFh _emit 004h _emit 000h _emit 000h _emit 000h _emit 08Dh _emit 064h _emit 024h _emit 000h _emit 083h _emit 03Eh _emit 000h _emit 074h _emit 017h _emit 08Bh _emit 006h _emit 08Bh _emit 008h _emit 050h _emit 0FFh _emit 051h _emit 008h _emit 0A1h
        /* g_1076A830 */ dword ptr [g_1076A830]
        _emit 085h _emit 0C0h _emit 0C7h _emit 006h _emit 000h _emit 000h _emit 000h _emit 000h _emit 075h _emit 0E9h _emit 083h _emit 0C6h _emit 004h _emit 04Fh _emit 075h _emit 0DEh _emit 083h _emit 0C3h _emit 018h _emit 04Dh _emit 075h _emit 0CDh _emit 05Fh _emit 05Eh _emit 05Dh _emit 05Bh _emit 0C3h
    }
}
