extern int g_10193358;
extern int g_10195DE8;
extern int g_10195DEC;
extern int g_10195DF0;
extern int g_10195DFC;
extern int g_10195E08;
extern int g_101984EC;
extern int g_101CE7EC;
extern int g_10764584;

__declspec(naked) void FUN_10037b20(void)
{
    __asm {
        _emit 083h _emit 0ECh _emit 018h _emit 0C7h _emit 004h _emit 024h
        /* g_101984EC */ dword ptr [g_101984EC]
        _emit 0C7h _emit 044h _emit 024h _emit 004h
        /* g_10195E08 */ dword ptr [g_10195E08]
        _emit 0C7h _emit 044h _emit 024h _emit 008h
        /* g_10195DFC */ dword ptr [g_10195DFC]
        _emit 0C7h _emit 044h _emit 024h _emit 00Ch
        /* g_10195DF0 */ dword ptr [g_10195DF0]
        _emit 0C7h _emit 044h _emit 024h _emit 010h
        /* g_10195DEC */ dword ptr [g_10195DEC]
        _emit 0C7h _emit 044h _emit 024h _emit 014h
        /* g_10195DE8 */ dword ptr [g_10195DE8]
        _emit 08Bh _emit 00Ch _emit 084h _emit 051h _emit 052h _emit 0E8h _emit 014h _emit 091h _emit 002h _emit 000h _emit 08Bh _emit 00Dh
        /* g_101CE7EC */ dword ptr [g_101CE7EC]
        _emit 08Bh _emit 051h _emit 008h _emit 083h _emit 0C4h _emit 008h _emit 085h _emit 0D2h _emit 074h _emit 02Ah _emit 08Bh _emit 015h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 085h _emit 0D2h _emit 00Fh _emit 095h _emit 0C1h _emit 084h _emit 0C9h _emit 074h _emit 01Bh _emit 050h _emit 068h
        /* g_10193358 */ dword ptr [g_10193358]
        _emit 052h _emit 0E8h _emit 07Eh _emit 0F1h _emit 00Bh _emit 000h _emit 08Bh _emit 015h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 052h _emit 0E8h _emit 0AAh _emit 0F0h _emit 00Bh _emit 000h _emit 083h _emit 0C4h _emit 010h _emit 083h _emit 0C4h _emit 018h _emit 0C3h
    }
}
