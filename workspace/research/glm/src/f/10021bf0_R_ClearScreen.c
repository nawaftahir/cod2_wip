extern int g_1042E778;

__declspec(naked) void R_ClearScreen(void)
{
    __asm {
        _emit 0A1h
        /* g_1042E778 */ dword ptr [g_1042E778]
        _emit 08Bh _emit 090h _emit 000h _emit 000h _emit 003h _emit 000h _emit 0B9h _emit 000h _emit 000h _emit 003h _emit 000h _emit 02Bh _emit 0CAh _emit 083h _emit 0F9h _emit 014h _emit 07Dh _emit 00Ah _emit 033h _emit 0C9h _emit 089h _emit 088h _emit 008h _emit 000h _emit 003h _emit 000h _emit 0EBh _emit 024h _emit 08Dh _emit 00Ch _emit 002h _emit 083h _emit 0C2h _emit 014h _emit 089h _emit 090h _emit 000h _emit 000h _emit 003h _emit 000h _emit 083h _emit 080h _emit 004h _emit 000h _emit 003h _emit 000h _emit 014h _emit 089h _emit 088h _emit 008h _emit 000h _emit 003h _emit 000h _emit 066h _emit 0C7h _emit 001h _emit 00Dh _emit 000h _emit 066h _emit 0C7h _emit 041h _emit 002h _emit 014h _emit 000h _emit 08Bh _emit 044h _emit 024h _emit 004h _emit 08Bh _emit 054h _emit 024h _emit 008h _emit 089h _emit 041h _emit 004h _emit 08Bh _emit 044h _emit 024h _emit 00Ch _emit 089h _emit 051h _emit 008h _emit 08Bh _emit 054h _emit 024h _emit 010h _emit 089h _emit 041h _emit 00Ch _emit 089h _emit 051h _emit 010h _emit 0C3h
    }
}
