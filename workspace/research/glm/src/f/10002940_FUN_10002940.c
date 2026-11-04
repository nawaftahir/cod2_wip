extern int g_101919C4;
extern int g_101919FC;
extern int g_101AE2A8;
extern int g_101AE2AC;

__declspec(naked) void FUN_10002940(void)
{
    __asm {
        _emit 055h _emit 033h _emit 0EDh _emit 066h _emit 039h _emit 06Bh _emit 034h _emit 076h _emit 06Bh _emit 057h _emit 033h _emit 0FFh _emit 056h _emit 08Dh _emit 049h _emit 000h _emit 08Bh _emit 073h _emit 03Ch _emit 08Bh _emit 004h _emit 03Eh _emit 003h _emit 0F7h _emit 068h
        /* g_101919FC */ dword ptr [g_101919FC]
        _emit 050h _emit 0E8h _emit 06Ch _emit 04Fh _emit 00Fh _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 085h _emit 0C0h _emit 074h _emit 010h _emit 00Fh _emit 0B7h _emit 04Bh _emit 034h _emit 045h _emit 083h _emit 0C7h _emit 00Ch _emit 03Bh _emit 0E9h _emit 07Ch _emit 0DAh _emit 05Eh _emit 05Fh _emit 05Dh _emit 0C3h _emit 080h _emit 07Eh _emit 005h _emit 005h _emit 074h _emit 008h _emit 08Bh _emit 056h _emit 008h _emit 083h _emit 03Ah _emit 005h _emit 074h _emit 019h _emit 08Bh _emit 003h _emit 08Bh _emit 04Eh _emit 008h _emit 08Bh _emit 051h _emit 020h _emit 050h _emit 052h _emit 068h
        /* g_101919C4 */ dword ptr [g_101919C4]
        _emit 06Ah _emit 001h _emit 0E8h _emit 022h _emit 00Fh _emit 001h _emit 000h _emit 083h _emit 0C4h _emit 010h _emit 08Bh _emit 046h _emit 008h _emit 0A3h
        /* g_101AE2A8 */ dword ptr [g_101AE2A8]
        _emit 08Ah _emit 04Eh _emit 004h _emit 05Eh _emit 088h _emit 00Dh
        /* g_101AE2AC */ dword ptr [g_101AE2AC]
        _emit 05Fh _emit 05Dh _emit 0C3h
    }
}
