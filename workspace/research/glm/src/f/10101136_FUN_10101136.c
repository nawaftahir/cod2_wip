extern int g_101A50EC;

__declspec(naked) void FUN_10101136(void)
{
    __asm {
        _emit 053h _emit 051h _emit 0BBh
        /* g_101A50EC */ dword ptr [g_101A50EC]
        _emit 08Bh _emit 04Dh _emit 008h _emit 089h _emit 04Bh _emit 008h _emit 089h _emit 043h _emit 004h _emit 089h _emit 06Bh _emit 00Ch _emit 059h _emit 05Bh _emit 0C2h _emit 004h _emit 000h
    }
}
