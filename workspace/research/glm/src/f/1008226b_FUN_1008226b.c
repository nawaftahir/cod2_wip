extern int g_10118028;
extern int g_1017C3C4;

__declspec(naked) void FUN_1008226b(void)
{
    __asm {
        _emit 08Bh _emit 0FFh _emit 055h _emit 08Bh _emit 0ECh _emit 056h _emit 08Bh _emit 075h _emit 00Ch _emit 057h _emit 06Ah _emit 004h _emit 059h _emit 0BFh
        /* g_10118028 */ dword ptr [g_10118028]
        _emit 033h _emit 0C0h _emit 0F3h _emit 0A7h _emit 074h _emit 011h _emit 08Bh _emit 075h _emit 00Ch _emit 06Ah _emit 004h _emit 059h _emit 0BFh
        /* g_1017C3C4 */ dword ptr [g_1017C3C4]
        _emit 033h _emit 0C0h _emit 0F3h _emit 0A7h _emit 075h _emit 012h _emit 08Bh _emit 045h _emit 008h _emit 08Bh _emit 04Dh _emit 010h _emit 089h _emit 001h _emit 08Bh _emit 008h _emit 050h _emit 0FFh _emit 051h _emit 004h _emit 033h _emit 0C0h _emit 0EBh _emit 005h _emit 0B8h _emit 002h _emit 040h _emit 000h _emit 080h _emit 05Fh _emit 05Eh _emit 05Dh _emit 0C2h _emit 00Ch _emit 000h
    }
}
