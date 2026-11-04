extern int g_10101078;

__declspec(naked) void __global_unwind2(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 053h _emit 056h _emit 057h _emit 055h _emit 06Ah _emit 000h _emit 06Ah _emit 000h _emit 068h
        /* g_10101078 */ dword ptr [g_10101078]
        _emit 0FFh _emit 075h _emit 008h _emit 0E8h _emit 0AAh _emit 096h _emit 000h _emit 000h _emit 05Dh _emit 05Fh _emit 05Eh _emit 05Bh _emit 08Bh _emit 0E5h _emit 05Dh _emit 0C3h
    }
}
