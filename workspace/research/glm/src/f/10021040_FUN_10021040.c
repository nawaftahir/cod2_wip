extern int g_101D49BC;
extern int g_101D4D1C;
extern int g_101DA9C8;
extern int g_1042E778;
extern int g_1042E780;

__declspec(naked) void FUN_10021040(void)
{
    __asm {
        _emit 0A1h
        /* g_101D4D1C */ dword ptr [g_101D4D1C]
        _emit 040h _emit 0C7h _emit 005h _emit 0C8h _emit 0A9h _emit 01Dh _emit 010h
        /* g_1042E780 */ dword ptr [g_1042E780]
        _emit 0A3h
        /* g_101D4D1C */ dword ptr [g_101D4D1C]
        _emit 0A3h
        /* g_1042E780 */ dword ptr [g_1042E780]
        _emit 0E8h _emit 0E1h _emit 0D4h _emit 0FFh _emit 0FFh _emit 0A1h
        /* g_101D49BC */ dword ptr [g_101D49BC]
        _emit 040h _emit 025h _emit 001h _emit 000h _emit 000h _emit 080h _emit 079h _emit 005h _emit 048h _emit 083h _emit 0C8h _emit 0FEh _emit 040h _emit 0A3h
        /* g_101D49BC */ dword ptr [g_101D49BC]
        _emit 033h _emit 0C9h _emit 08Dh _emit 004h _emit 040h _emit 08Dh _emit 014h _emit 085h _emit 080h _emit 049h _emit 01Dh _emit 010h _emit 0A1h
        /* g_101DA9C8 */ dword ptr [g_101DA9C8]
        _emit 089h _emit 090h _emit 078h _emit 07Ch _emit 021h _emit 000h _emit 089h _emit 00Ah _emit 089h _emit 048h _emit 004h _emit 089h _emit 088h _emit 008h _emit 000h _emit 008h _emit 000h _emit 089h _emit 088h _emit 00Ch _emit 000h _emit 00Ah _emit 000h _emit 089h _emit 088h _emit 070h _emit 07Ch _emit 018h _emit 000h _emit 089h _emit 088h _emit 074h _emit 0FCh _emit 018h _emit 000h _emit 089h _emit 088h _emit 07Ch _emit 07Ch _emit 021h _emit 000h _emit 08Dh _emit 090h _emit 00Ch _emit 09Dh _emit 021h _emit 000h _emit 089h _emit 015h
        /* g_1042E778 */ dword ptr [g_1042E778]
        _emit 089h _emit 088h _emit 04Ch _emit 09Dh _emit 024h _emit 000h _emit 089h _emit 088h _emit 034h _emit 09Dh _emit 024h _emit 000h _emit 089h _emit 088h _emit 01Ch _emit 09Dh _emit 024h _emit 000h _emit 0C3h
    }
}
