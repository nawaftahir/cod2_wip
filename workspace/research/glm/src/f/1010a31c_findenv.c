extern int g_101AE02C;

__declspec(naked) void findenv(void)
{
    __asm {
        _emit 056h _emit 08Bh _emit 035h
        /* g_101AE02C */ dword ptr [g_101AE02C]
        _emit 0EBh _emit 022h _emit 057h _emit 050h _emit 0FFh _emit 074h _emit 024h _emit 010h _emit 0E8h _emit 0BFh _emit 0F1h _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 00Ch _emit 085h _emit 0C0h _emit 075h _emit 00Dh _emit 08Bh _emit 006h _emit 08Ah _emit 004h _emit 007h _emit 03Ch _emit 03Dh _emit 074h _emit 01Ch _emit 084h _emit 0C0h _emit 074h _emit 018h _emit 083h _emit 0C6h _emit 004h _emit 08Bh _emit 006h _emit 085h _emit 0C0h _emit 075h _emit 0D8h _emit 08Bh _emit 0C6h _emit 02Bh _emit 005h
        /* g_101AE02C */ dword ptr [g_101AE02C]
        _emit 05Eh _emit 0C1h _emit 0F8h _emit 002h _emit 0F7h _emit 0D8h _emit 0C3h _emit 08Bh _emit 0C6h _emit 02Bh _emit 005h
        /* g_101AE02C */ dword ptr [g_101AE02C]
        _emit 05Eh _emit 0C1h _emit 0F8h _emit 002h _emit 0C3h
    }
}
