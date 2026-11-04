extern int g_1010FEFC;

__declspec(naked) void FUN_10081a02(void)
{
    __asm {
        _emit 0FFh _emit 071h _emit 00Ch _emit 0C7h _emit 001h
        /* g_1010FEFC */ dword ptr [g_1010FEFC]
        _emit 0E8h _emit 055h _emit 05Eh _emit 007h _emit 000h _emit 059h _emit 0C3h
    }
}
