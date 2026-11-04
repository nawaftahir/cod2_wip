extern int g_1010C028;
extern int g_10193358;
extern int g_10197EC0;
extern int g_101CE7EC;
extern int g_101D1BF8;
extern int g_101D492D;
extern int g_10764584;
extern int g_1076A830;

__declspec(naked) void FUN_10033010(void)
{
    __asm {
        _emit 0A1h
        /* g_101CE7EC */ dword ptr [g_101CE7EC]
        _emit 08Bh _emit 048h _emit 008h _emit 085h _emit 0C9h _emit 074h _emit 02Dh _emit 0A1h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 085h _emit 0C0h _emit 00Fh _emit 095h _emit 0C1h _emit 084h _emit 0C9h _emit 074h _emit 01Fh _emit 068h
        /* g_10197EC0 */ dword ptr [g_10197EC0]
        _emit 068h
        /* g_10193358 */ dword ptr [g_10193358]
        _emit 050h _emit 0E8h _emit 0CBh _emit 03Ch _emit 00Ch _emit 000h _emit 08Bh _emit 00Dh
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 051h _emit 0E8h _emit 0F7h _emit 03Bh _emit 00Ch _emit 000h _emit 083h _emit 0C4h _emit 010h _emit 0A1h
        /* g_101D1BF8 */ dword ptr [g_101D1BF8]
        _emit 08Bh _emit 010h _emit 050h _emit 0FFh _emit 092h _emit 0A8h _emit 000h _emit 000h _emit 000h _emit 0A1h
        /* g_1076A830 */ dword ptr [g_1076A830]
        _emit 085h _emit 0C0h _emit 075h _emit 0B0h _emit 0C6h _emit 005h _emit 02Dh
        /* g_101D492D */ dword ptr [g_101D492D]
        _emit 0E8h _emit 064h _emit 0FCh _emit 0FFh _emit 0FFh _emit 0E8h _emit 09Fh _emit 0FCh _emit 0FFh _emit 0FFh _emit 0E8h _emit 05Ah _emit 0FCh _emit 0FFh _emit 0FFh _emit 08Bh _emit 044h _emit 024h _emit 004h _emit 050h _emit 0FFh _emit 015h
        /* g_1010C028 */ dword ptr [g_1010C028]
        _emit 0C3h
    }
}
