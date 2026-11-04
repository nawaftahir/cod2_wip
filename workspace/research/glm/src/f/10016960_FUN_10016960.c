extern int g_10194488;
extern int g_101D92D0;

__declspec(naked) void FUN_10016960(void)
{
    __asm {
        _emit 051h _emit 081h _emit 03Dh _emit 0D0h _emit 092h _emit 01Dh _emit 010h
        /* g_101D92D0 */ dword ptr [g_101D92D0]
        _emit 075h _emit 014h _emit 068h _emit 0FFh _emit 003h _emit 000h _emit 000h _emit 068h
        /* g_10194488 */ dword ptr [g_10194488]
        _emit 06Ah _emit 001h _emit 0E8h _emit 042h _emit 0CFh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 00Ch _emit 053h _emit 08Dh _emit 05Ch _emit 024h _emit 004h _emit 0E8h _emit 055h _emit 0FFh _emit 0FFh _emit 0FFh _emit 0A1h
        /* g_101D92D0 */ dword ptr [g_101D92D0]
        _emit 08Bh _emit 04Ch _emit 024h _emit 00Ch _emit 040h _emit 0A3h
        /* g_101D92D0 */ dword ptr [g_101D92D0]
        _emit 08Bh _emit 044h _emit 024h _emit 004h _emit 089h _emit 00Ch _emit 085h _emit 0D4h _emit 092h _emit 01Dh _emit 010h _emit 05Bh _emit 059h _emit 0C3h
    }
}
