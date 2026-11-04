extern int g_10191B04;
extern int g_10193358;
extern int g_101CE7EC;
extern int g_101D49B0;
extern int g_101DA9C8;
extern int g_10764584;
extern int g_1076A830;

__declspec(naked) void FUN_1001e540(void)
{
    __asm {
        _emit 0A1h
        /* g_101D49B0 */ dword ptr [g_101D49B0]
        _emit 085h _emit 0C0h _emit 074h _emit 062h _emit 0A1h
        /* g_101DA9C8 */ dword ptr [g_101DA9C8]
        _emit 0C7h _emit 005h _emit 0B0h _emit 049h _emit 01Dh _emit 010h
        /* g_101D49B0 */ dword ptr [g_101D49B0]
        _emit 08Bh _emit 088h _emit 078h _emit 07Ch _emit 021h _emit 000h _emit 056h _emit 08Bh _emit 071h _emit 008h _emit 08Bh _emit 015h
        /* g_101CE7EC */ dword ptr [g_101CE7EC]
        _emit 08Bh _emit 042h _emit 008h _emit 085h _emit 0C0h _emit 074h _emit 02Ch _emit 0A1h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 085h _emit 0C0h _emit 00Fh _emit 095h _emit 0C1h _emit 084h _emit 0C9h _emit 074h _emit 01Eh _emit 068h
        /* g_10191B04 */ dword ptr [g_10191B04]
        _emit 068h
        /* g_10193358 */ dword ptr [g_10193358]
        _emit 050h _emit 0E8h _emit 078h _emit 087h _emit 00Dh _emit 000h _emit 0A1h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 050h _emit 0E8h _emit 0A5h _emit 086h _emit 00Dh _emit 000h _emit 083h _emit 0C4h _emit 010h _emit 08Bh _emit 00Eh _emit 056h _emit 0FFh _emit 051h _emit 030h _emit 0A1h
        /* g_1076A830 */ dword ptr [g_1076A830]
        _emit 085h _emit 0C0h _emit 075h _emit 0B8h _emit 05Eh _emit 0C3h
    }
}
