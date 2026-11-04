extern int g_101A59D0;
extern int g_101CE8D8;
extern int g_101CE8E2;
extern int g_101CE8E4;
extern int g_101CE8F6;
extern int g_101CE8F8;

__declspec(naked) void FUN_10022c30(void)
{
    __asm {
        _emit 053h _emit 056h _emit 08Bh _emit 035h
        /* g_101A59D0 */ dword ptr [g_101A59D0]
        _emit 033h _emit 0DBh _emit 089h _emit 035h
        /* g_101CE8F8 */ dword ptr [g_101CE8F8]
        _emit 0C6h _emit 005h _emit 0F6h
        /* g_101CE8F6 */ dword ptr [g_101CE8F6]
        _emit 088h _emit 01Dh
        /* g_101CE8E2 */ dword ptr [g_101CE8E2]
        _emit 088h _emit 01Dh
        /* g_101CE8E4 */ dword ptr [g_101CE8E4]
        _emit 0E8h _emit 0E8h _emit 09Eh _emit 0FEh _emit 0FFh _emit 0BEh
        /* g_101CE8D8 */ dword ptr [g_101CE8D8]
        _emit 053h _emit 089h _emit 034h _emit 085h _emit 068h _emit 0EAh _emit 01Ch _emit 010h _emit 0B8h _emit 080h _emit 000h _emit 000h _emit 000h _emit 06Ah _emit 001h _emit 06Ah _emit 001h _emit 0BBh _emit 015h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 0C8h _emit 089h _emit 037h _emit 0E8h _emit 004h _emit 0A2h _emit 0FEh _emit 0FFh _emit 06Ah _emit 001h _emit 068h _emit 080h _emit 000h _emit 000h _emit 000h _emit 068h _emit 080h _emit 000h _emit 000h _emit 000h _emit 06Ah _emit 003h _emit 056h _emit 08Bh _emit 0C3h _emit 0E8h _emit 0DEh _emit 09Dh _emit 0FEh _emit 0FFh _emit 08Bh _emit 037h _emit 0E8h _emit 017h _emit 0A8h _emit 0FEh _emit 0FFh _emit 06Ah _emit 001h _emit 068h _emit 080h _emit 000h _emit 000h _emit 000h _emit 089h _emit 047h _emit 004h _emit 08Bh _emit 007h _emit 068h _emit 080h _emit 000h _emit 000h _emit 000h _emit 06Ah _emit 003h _emit 050h _emit 08Bh _emit 0C3h _emit 0C7h _emit 047h _emit 00Ch _emit 080h _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 047h _emit 010h _emit 080h _emit 000h _emit 000h _emit 000h _emit 0E8h _emit 0AEh _emit 09Dh _emit 0FEh _emit 0FFh _emit 083h _emit 0C4h _emit 034h _emit 0E8h _emit 006h _emit 0FCh _emit 0FFh _emit 0FFh _emit 05Eh _emit 089h _emit 047h _emit 008h _emit 05Bh _emit 0C3h
    }
}
