extern int g_10110448;

__declspec(naked) void FUN_10086d4e(void)
{
    __asm {
        _emit 08Bh _emit 0FFh _emit 055h _emit 08Bh _emit 0ECh _emit 08Bh _emit 0C1h _emit 08Bh _emit 04Dh _emit 008h _emit 089h _emit 048h _emit 004h _emit 0C7h _emit 000h
        /* g_10110448 */ dword ptr [g_10110448]
        _emit 05Dh _emit 0C2h _emit 004h _emit 000h
    }
}
