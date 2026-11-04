extern int g_100CBBAC;

__declspec(naked) void FUN_100cbbc6(void)
{
    __asm {
        _emit 08Bh _emit 0FFh _emit 055h _emit 08Bh _emit 0ECh _emit 057h _emit 08Bh _emit 07Dh _emit 00Ch _emit 08Bh _emit 007h _emit 083h _emit 0F8h _emit 001h _emit 076h _emit 031h _emit 056h _emit 08Bh _emit 075h _emit 008h _emit 06Ah _emit 000h _emit 050h _emit 056h _emit 068h
        /* g_100CBBAC */ dword ptr [g_100CBBAC]
        _emit 0E8h _emit 038h _emit 0ADh _emit 0FBh _emit 0FFh _emit 033h _emit 0C9h _emit 033h _emit 0D2h _emit 041h _emit 042h _emit 039h _emit 00Fh _emit 076h _emit 012h _emit 08Bh _emit 004h _emit 08Eh _emit 03Bh _emit 044h _emit 08Eh _emit 0FCh _emit 074h _emit 004h _emit 089h _emit 004h _emit 096h _emit 042h _emit 041h _emit 03Bh _emit 00Fh _emit 072h _emit 0EEh _emit 089h _emit 017h _emit 05Eh _emit 05Fh _emit 05Dh _emit 0C2h _emit 008h _emit 000h
    }
}
