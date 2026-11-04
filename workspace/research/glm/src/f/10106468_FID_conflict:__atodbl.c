extern int g_101A50D0;

__declspec(naked) void FID_conflict:__atodbl(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 083h _emit 0ECh _emit 014h _emit 0A1h
        /* g_101A50D0 */ dword ptr [g_101A50D0]
        _emit 089h _emit 045h _emit 0FCh _emit 033h _emit 0C0h _emit 050h _emit 050h _emit 050h _emit 050h _emit 0FFh _emit 075h _emit 00Ch _emit 08Dh _emit 045h _emit 0ECh _emit 050h _emit 08Dh _emit 045h _emit 0F0h _emit 050h _emit 0E8h _emit 094h _emit 000h _emit 000h _emit 000h _emit 0FFh _emit 075h _emit 008h _emit 08Dh _emit 045h _emit 0F0h _emit 050h _emit 0E8h _emit 028h _emit 0FFh _emit 0FFh _emit 0FFh _emit 08Bh _emit 04Dh _emit 0FCh _emit 083h _emit 0C4h _emit 024h _emit 0E8h _emit 0AAh _emit 0A8h _emit 0FFh _emit 0FFh _emit 0C9h _emit 0C3h
    }
}
