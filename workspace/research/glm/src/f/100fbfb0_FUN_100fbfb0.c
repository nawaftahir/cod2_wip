extern int g_1010C03C;

__declspec(naked) void FUN_100fbfb0(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 08Bh _emit 045h _emit 008h _emit 0FFh _emit 034h _emit 0C5h _emit 028h _emit 04Bh _emit 01Ah _emit 010h _emit 0FFh _emit 015h
        /* g_1010C03C */ dword ptr [g_1010C03C]
        _emit 05Dh _emit 0C3h
    }
}
