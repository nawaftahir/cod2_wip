extern int g_10193674;
extern int g_10194360;
extern int g_101D1B2C;
extern int g_101D1B30;
extern int g_101D49C8;

__declspec(naked) void FUN_10017190(void)
{
    __asm {
        _emit 056h _emit 06Ah _emit 000h _emit 0B8h
        /* g_10193674 */ dword ptr [g_10193674]
        _emit 0E8h _emit 063h _emit 0FFh _emit 0FFh _emit 0FFh _emit 08Bh _emit 00Dh
        /* g_101D1B2C */ dword ptr [g_101D1B2C]
        _emit 0A3h
        /* g_101D1B30 */ dword ptr [g_101D1B30]
        _emit 08Bh _emit 050h _emit 03Ch _emit 08Bh _emit 071h _emit 03Ch _emit 083h _emit 0C4h _emit 004h _emit 03Bh _emit 0D6h _emit 075h _emit 010h _emit 08Bh _emit 050h _emit 040h _emit 03Bh _emit 051h _emit 040h _emit 075h _emit 008h _emit 08Bh _emit 050h _emit 038h _emit 03Bh _emit 051h _emit 038h _emit 074h _emit 021h _emit 066h _emit 083h _emit 078h _emit 034h _emit 001h _emit 074h _emit 01Ah _emit 068h
        /* g_10194360 */ dword ptr [g_10194360]
        _emit 06Ah _emit 003h _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 0A1h
        /* g_101D1B2C */ dword ptr [g_101D1B2C]
        _emit 083h _emit 0C4h _emit 008h _emit 0A3h
        /* g_101D1B30 */ dword ptr [g_101D1B30]
        _emit 05Eh _emit 0C3h
    }
}
