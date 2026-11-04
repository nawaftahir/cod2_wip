extern int g_101DA9C8;
extern int g_1042E778;

__declspec(naked) void FUN_10020d50(void)
{
    __asm {
        _emit 0A1h
        /* g_1042E778 */ dword ptr [g_1042E778]
        _emit 08Bh _emit 090h _emit 000h _emit 000h _emit 003h _emit 000h _emit 0B9h _emit 000h _emit 000h _emit 003h _emit 000h _emit 02Bh _emit 0CAh _emit 083h _emit 0F9h _emit 004h _emit 07Dh _emit 00Ah _emit 033h _emit 0D2h _emit 089h _emit 090h _emit 008h _emit 000h _emit 003h _emit 000h _emit 0EBh _emit 024h _emit 08Dh _emit 00Ch _emit 002h _emit 083h _emit 0C2h _emit 004h _emit 089h _emit 090h _emit 000h _emit 000h _emit 003h _emit 000h _emit 083h _emit 080h _emit 004h _emit 000h _emit 003h _emit 000h _emit 004h _emit 089h _emit 088h _emit 008h _emit 000h _emit 003h _emit 000h _emit 033h _emit 0D2h _emit 066h _emit 089h _emit 011h _emit 066h _emit 0C7h _emit 041h _emit 002h _emit 004h _emit 000h _emit 0A1h
        /* g_101DA9C8 */ dword ptr [g_101DA9C8]
        _emit 050h _emit 089h _emit 090h _emit 00Ch _emit 09Dh _emit 024h _emit 000h _emit 089h _emit 090h _emit 010h _emit 09Dh _emit 024h _emit 000h _emit 089h _emit 090h _emit 014h _emit 09Dh _emit 024h _emit 000h _emit 0E8h _emit 06Eh _emit 02Fh _emit 001h _emit 000h _emit 083h _emit 0C4h _emit 004h _emit 0E8h _emit 066h _emit 02Dh _emit 001h _emit 000h _emit 0E9h _emit 081h _emit 002h _emit 000h _emit 000h
    }
}
