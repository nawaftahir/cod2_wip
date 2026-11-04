extern int g_101943DC;
extern int g_101D0B00;
extern int g_101D0B04;

__declspec(naked) void FUN_10016ed0(void)
{
    __asm {
        _emit 0C7h _emit 005h _emit 000h _emit 00Bh _emit 01Dh _emit 010h
        /* g_101D0B00 */ dword ptr [g_101D0B00]
        _emit 066h _emit 089h _emit 048h _emit 008h _emit 066h _emit 08Bh _emit 015h
        /* g_101D0B04 */ dword ptr [g_101D0B04]
        _emit 066h _emit 089h _emit 050h _emit 00Ah _emit 08Bh _emit 015h
        /* g_101D0B04 */ dword ptr [g_101D0B04]
        _emit 00Fh _emit 0B7h _emit 0C9h _emit 089h _emit 004h _emit 095h _emit 008h _emit 00Bh _emit 01Dh _emit 010h _emit 089h _emit 004h _emit 08Dh _emit 028h _emit 04Dh _emit 01Dh _emit 010h _emit 0A1h
        /* g_101D0B04 */ dword ptr [g_101D0B04]
        _emit 040h _emit 03Dh _emit 000h _emit 004h _emit 000h _emit 000h _emit 0A3h
        /* g_101D0B04 */ dword ptr [g_101D0B04]
        _emit 075h _emit 010h _emit 050h _emit 068h
        /* g_101943DC */ dword ptr [g_101943DC]
        _emit 06Ah _emit 000h _emit 0E8h _emit 0A1h _emit 0C9h _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 00Ch _emit 0C3h
    }
}
