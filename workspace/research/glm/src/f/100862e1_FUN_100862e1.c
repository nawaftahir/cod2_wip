extern int g_101103FC;
extern int g_10110404;

__declspec(naked) void FUN_100862e1(void)
{
    __asm {
        _emit 08Bh _emit 0FFh _emit 055h _emit 08Bh _emit 0ECh _emit 08Bh _emit 055h _emit 008h _emit 08Bh _emit 052h _emit 004h _emit 08Bh _emit 049h _emit 010h _emit 08Bh _emit 00Ch _emit 091h _emit 0F6h _emit 041h _emit 004h _emit 020h _emit 0B8h
        /* g_10110404 */ dword ptr [g_10110404]
        _emit 074h _emit 005h _emit 0B8h
        /* g_101103FC */ dword ptr [g_101103FC]
        _emit 05Dh _emit 0C2h _emit 004h _emit 000h
    }
}
