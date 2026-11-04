extern int g_10107A56;
extern int g_1010C04C;
extern int g_1010C07C;
extern int g_1017C7EC;
extern int g_10182244;
extern int g_10182270;
extern int g_101AE00C;
extern int g_101AE22C;

__declspec(naked) void ___crtInitCritSecAndSpinCount(void)
{
    __asm {
        _emit 06Ah _emit 010h _emit 068h
        /* g_10182270 */ dword ptr [g_10182270]
        _emit 0E8h _emit 09Eh _emit 03Bh _emit 0FFh _emit 0FFh _emit 0A1h
        /* g_101AE22C */ dword ptr [g_101AE22C]
        _emit 085h _emit 0C0h _emit 075h _emit 037h _emit 083h _emit 03Dh _emit 00Ch
        /* g_101AE00C */ dword ptr [g_101AE00C]
        _emit 074h _emit 024h _emit 068h
        /* g_1017C7EC */ dword ptr [g_1017C7EC]
        _emit 0FFh _emit 015h
        /* g_1010C07C */ dword ptr [g_1010C07C]
        _emit 085h _emit 0C0h _emit 074h _emit 015h _emit 068h
        /* g_10182244 */ dword ptr [g_10182244]
        _emit 050h _emit 0FFh _emit 015h
        /* g_1010C04C */ dword ptr [g_1010C04C]
        _emit 0A3h
        /* g_101AE22C */ dword ptr [g_101AE22C]
        _emit 085h _emit 0C0h _emit 075h _emit 00Ah _emit 0B8h
        /* g_10107A56 */ dword ptr [g_10107A56]
        _emit 0A3h
        /* g_101AE22C */ dword ptr [g_101AE22C]
        _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 008h _emit 0FFh _emit 0D0h _emit 089h _emit 045h _emit 0E0h _emit 0EBh _emit 024h _emit 08Bh _emit 045h _emit 0ECh _emit 08Bh _emit 000h _emit 08Bh _emit 000h _emit 089h _emit 045h _emit 0E4h
    }
}
