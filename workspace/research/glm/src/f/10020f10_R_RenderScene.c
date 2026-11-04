extern int g_1042E778;

__declspec(naked) void R_RenderScene(void)
{
    __asm {
        _emit 08Bh _emit 00Dh
        /* g_1042E778 */ dword ptr [g_1042E778]
        _emit 08Bh _emit 081h _emit 000h _emit 000h _emit 003h _emit 000h _emit 0BAh _emit 000h _emit 000h _emit 003h _emit 000h _emit 02Bh _emit 0D0h _emit 083h _emit 0FAh _emit 008h _emit 07Dh _emit 00Eh _emit 033h _emit 0D2h _emit 089h _emit 091h _emit 008h _emit 000h _emit 003h _emit 000h _emit 033h _emit 0C9h _emit 089h _emit 051h _emit 004h _emit 0C3h _emit 057h _emit 08Dh _emit 078h _emit 008h _emit 089h _emit 0B9h _emit 000h _emit 000h _emit 003h _emit 000h _emit 08Bh _emit 0B9h _emit 004h _emit 000h _emit 003h _emit 000h _emit 08Dh _emit 014h _emit 008h _emit 083h _emit 0C7h _emit 008h _emit 089h _emit 0B9h _emit 004h _emit 000h _emit 003h _emit 000h _emit 089h _emit 091h _emit 008h _emit 000h _emit 003h _emit 000h _emit 066h _emit 0C7h _emit 002h _emit 001h _emit 000h _emit 066h _emit 0C7h _emit 042h _emit 002h _emit 008h _emit 000h _emit 0C7h _emit 042h _emit 004h _emit 000h _emit 000h _emit 000h _emit 000h _emit 05Fh _emit 0C3h
    }
}
