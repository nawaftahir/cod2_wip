extern int g_101A47C4;

__declspec(naked) void FUN_100f7cf3(void)
{
    __asm {
        _emit 0A1h
        /* g_101A47C4 */ dword ptr [g_101A47C4]
        _emit 055h _emit 033h _emit 0EDh _emit 045h _emit 085h _emit 0C0h _emit 075h _emit 016h _emit 068h _emit 051h _emit 003h _emit 000h _emit 000h _emit 0E8h _emit 05Ah _emit 047h _emit 000h _emit 000h _emit 085h _emit 0C0h _emit 059h _emit 0A3h
        /* g_101A47C4 */ dword ptr [g_101A47C4]
        _emit 075h _emit 002h _emit 05Dh _emit 0C3h
    }
}
