extern int g_101D494C;
extern int g_101D4950;
extern int g_101D4958;

__declspec(naked) void FUN_10032e20(void)
{
    __asm {
        _emit 0A0h
        /* g_101D4958 */ dword ptr [g_101D4958]
        _emit 084h _emit 0C0h _emit 074h _emit 029h _emit 0A1h
        /* g_101D494C */ dword ptr [g_101D494C]
        _emit 08Bh _emit 008h _emit 06Ah _emit 001h _emit 06Ah _emit 000h _emit 06Ah _emit 000h _emit 050h _emit 0FFh _emit 051h _emit 01Ch _emit 03Dh _emit 068h _emit 008h _emit 076h _emit 088h _emit 074h _emit 00Ah _emit 083h _emit 0F8h _emit 001h _emit 00Fh _emit 095h _emit 0C0h _emit 084h _emit 0C0h _emit 074h _emit 020h _emit 0C6h _emit 005h _emit 058h
        /* g_101D4958 */ dword ptr [g_101D4958]
        _emit 0A1h
        /* g_101D4950 */ dword ptr [g_101D4950]
        _emit 005h _emit 0E0h _emit 0B1h _emit 0FFh _emit 0FFh _emit 08Bh _emit 0D0h _emit 0C1h _emit 0FAh _emit 01Fh _emit 0F7h _emit 0D2h _emit 023h _emit 0D0h _emit 089h _emit 015h
        /* g_101D4950 */ dword ptr [g_101D4950]
        _emit 0C3h
    }
}
