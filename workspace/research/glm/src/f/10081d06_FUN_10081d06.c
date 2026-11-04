extern int g_1010FEFC;

__declspec(naked) void FUN_10081d06(void)
{
    __asm {
        _emit 08Bh _emit 0C1h _emit 083h _emit 060h _emit 00Ch _emit 000h _emit 083h _emit 060h _emit 008h _emit 000h _emit 0C7h _emit 000h
        /* g_1010FEFC */ dword ptr [g_1010FEFC]
        _emit 0C7h _emit 040h _emit 004h _emit 001h _emit 000h _emit 000h _emit 000h _emit 0C3h
    }
}
