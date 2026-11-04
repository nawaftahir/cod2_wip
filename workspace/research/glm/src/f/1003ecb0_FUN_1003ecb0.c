extern int g_10193358;
extern int g_1019903C;
extern int g_101CE7EC;
extern int g_101D1BF8;
extern int g_10764584;
extern int g_1076674C;
extern int g_1076675C;
extern int g_1076A830;

__declspec(naked) void FUN_1003ecb0(void)
{
    __asm {
        _emit 0A1h
        /* g_1076674C */ dword ptr [g_1076674C]
        _emit 0A3h
        /* g_1076675C */ dword ptr [g_1076675C]
        _emit 089h _emit 035h
        /* g_1076674C */ dword ptr [g_1076674C]
        _emit 08Bh _emit 00Dh
        /* g_101CE7EC */ dword ptr [g_101CE7EC]
        _emit 08Bh _emit 041h _emit 008h _emit 085h _emit 0C0h _emit 074h _emit 02Dh _emit 0A1h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 085h _emit 0C0h _emit 00Fh _emit 095h _emit 0C1h _emit 084h _emit 0C9h _emit 074h _emit 01Fh _emit 068h
        /* g_1019903C */ dword ptr [g_1019903C]
        _emit 068h
        /* g_10193358 */ dword ptr [g_10193358]
        _emit 050h _emit 0E8h _emit 01Ah _emit 080h _emit 00Bh _emit 000h _emit 08Bh _emit 015h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 052h _emit 0E8h _emit 046h _emit 07Fh _emit 00Bh _emit 000h _emit 083h _emit 0C4h _emit 010h _emit 0A1h
        /* g_101D1BF8 */ dword ptr [g_101D1BF8]
        _emit 08Bh _emit 008h _emit 056h _emit 050h _emit 0FFh _emit 091h _emit 0A0h _emit 001h _emit 000h _emit 000h _emit 0A1h
        /* g_1076A830 */ dword ptr [g_1076A830]
        _emit 085h _emit 0C0h _emit 075h _emit 0AEh _emit 0C7h _emit 005h _emit 05Ch _emit 067h _emit 076h _emit 010h
        /* g_1076675C */ dword ptr [g_1076675C]
        _emit 0C3h
    }
}
