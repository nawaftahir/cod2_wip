extern int g_10678510;
extern int g_10678AC4;

__declspec(naked) void FUN_10023d40(void)
{
    __asm {
        _emit 08Bh _emit 015h
        /* g_10678510 */ dword ptr [g_10678510]
        _emit 08Bh _emit 0CEh _emit 02Bh _emit 0CAh _emit 0B8h _emit 009h _emit 0CBh _emit 03Dh _emit 08Dh _emit 0F7h _emit 0E9h _emit 003h _emit 0D1h _emit 0C1h _emit 0FAh _emit 006h _emit 08Bh _emit 0C2h _emit 0C1h _emit 0E8h _emit 01Fh _emit 003h _emit 0C2h _emit 06Bh _emit 0C0h _emit 034h _emit 005h
        /* g_10678AC4 */ dword ptr [g_10678AC4]
        _emit 050h _emit 08Bh _emit 0C6h _emit 0E8h _emit 053h _emit 0C2h _emit 0FFh _emit 0FFh _emit 059h _emit 0C3h
    }
}
