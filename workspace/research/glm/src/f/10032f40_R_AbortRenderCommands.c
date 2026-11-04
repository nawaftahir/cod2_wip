extern int g_101D494C;
extern int g_101D4958;

__declspec(naked) void R_AbortRenderCommands(void)
{
    __asm {
        _emit 0A0h
        /* g_101D4958 */ dword ptr [g_101D4958]
        _emit 084h _emit 0C0h _emit 074h _emit 02Ch _emit 0A1h
        /* g_101D494C */ dword ptr [g_101D494C]
        _emit 08Bh _emit 008h _emit 06Ah _emit 001h _emit 06Ah _emit 000h _emit 06Ah _emit 000h _emit 050h _emit 0FFh _emit 051h _emit 01Ch _emit 03Dh _emit 068h _emit 008h _emit 076h _emit 088h _emit 074h _emit 00Dh _emit 083h _emit 0F8h _emit 001h _emit 00Fh _emit 095h _emit 0C0h _emit 084h _emit 0C0h _emit 075h _emit 003h _emit 033h _emit 0C0h _emit 0C3h _emit 0C6h _emit 005h _emit 058h
        /* g_101D4958 */ dword ptr [g_101D4958]
        _emit 0B8h _emit 001h _emit 000h _emit 000h _emit 000h _emit 0C3h
    }
}
