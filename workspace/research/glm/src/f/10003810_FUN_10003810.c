extern int g_101AE288;
extern int g_101AE384;
extern int g_101AE388;

__declspec(naked) void FUN_10003810(void)
{
    __asm {
        _emit 0A1h
        /* g_101AE384 */ dword ptr [g_101AE384]
        _emit 056h _emit 033h _emit 0F6h _emit 085h _emit 0C0h _emit 057h _emit 07Eh _emit 022h _emit 033h _emit 0FFh _emit 090h _emit 0A1h
        /* g_101AE388 */ dword ptr [g_101AE388]
        _emit 08Bh _emit 04Ch _emit 007h _emit 01Ch _emit 051h _emit 0E8h _emit 071h _emit 060h _emit 002h _emit 000h _emit 0A1h
        /* g_101AE384 */ dword ptr [g_101AE384]
        _emit 083h _emit 0C4h _emit 004h _emit 046h _emit 083h _emit 0C7h _emit 03Ch _emit 03Bh _emit 0F0h _emit 07Ch _emit 0E1h _emit 033h _emit 0F6h _emit 085h _emit 0C0h _emit 07Eh _emit 030h _emit 033h _emit 0FFh _emit 0EBh _emit 007h _emit 08Dh _emit 0A4h _emit 024h _emit 000h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 015h
        /* g_101AE388 */ dword ptr [g_101AE388]
        _emit 08Bh _emit 044h _emit 017h _emit 01Ch _emit 050h _emit 068h
        /* g_101AE288 */ dword ptr [g_101AE288]
        _emit 0E8h _emit 08Bh _emit 063h _emit 002h _emit 000h _emit 0A1h
        /* g_101AE384 */ dword ptr [g_101AE384]
        _emit 083h _emit 0C4h _emit 008h _emit 046h _emit 083h _emit 0C7h _emit 03Ch
    }
}
