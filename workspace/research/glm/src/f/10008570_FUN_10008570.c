extern int g_101925A8;
extern int g_101AE580;
extern int g_101CE580;
extern int g_101D49C8;

__declspec(naked) void FUN_10008570(void)
{
    __asm {
        _emit 08Bh _emit 00Dh
        /* g_101CE580 */ dword ptr [g_101CE580]
        _emit 081h _emit 0F9h _emit 000h _emit 010h _emit 000h _emit 000h _emit 056h _emit 08Bh _emit 074h _emit 024h _emit 008h _emit 057h _emit 08Bh _emit 0F8h _emit 075h _emit 014h _emit 051h _emit 068h
        /* g_101925A8 */ dword ptr [g_101925A8]
        _emit 06Ah _emit 001h _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 083h _emit 0C4h _emit 00Ch _emit 05Fh _emit 05Eh _emit 0C3h _emit 08Bh _emit 046h _emit 038h _emit 085h _emit 0C0h _emit 074h _emit 00Bh _emit 039h _emit 018h _emit 074h _emit 048h _emit 08Bh _emit 040h _emit 01Ch _emit 085h _emit 0C0h _emit 075h _emit 0F5h _emit 08Bh _emit 0C1h _emit 0C1h _emit 0E0h _emit 005h _emit 005h
        /* g_101AE580 */ dword ptr [g_101AE580]
        _emit 041h _emit 089h _emit 00Dh
        /* g_101CE580 */ dword ptr [g_101CE580]
        _emit 089h _emit 018h _emit 08Bh _emit 00Ah _emit 089h _emit 048h _emit 004h _emit 08Bh _emit 04Ah _emit 004h _emit 089h _emit 048h _emit 008h _emit 08Bh _emit 052h _emit 008h _emit 089h _emit 050h _emit 00Ch _emit 08Bh _emit 00Fh _emit 089h _emit 048h _emit 010h _emit 08Bh _emit 057h _emit 004h _emit 089h _emit 050h _emit 014h _emit 08Bh _emit 04Fh _emit 008h _emit 089h _emit 048h _emit 018h _emit 08Bh _emit 056h _emit 038h _emit 089h _emit 050h _emit 01Ch _emit 05Fh _emit 089h _emit 046h _emit 038h _emit 05Eh _emit 0C3h _emit 08Dh _emit 070h _emit 010h _emit 08Dh _emit 048h _emit 004h _emit 0E8h _emit 008h _emit 042h _emit 005h _emit 000h _emit 05Fh _emit 05Eh _emit 0C3h
    }
}
