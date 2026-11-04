extern int g_101970CC;
extern int g_10197350;
extern int g_101A5A38;
extern int g_101D4AE4;
extern int g_101D4AFC;
extern int g_101D4B00;

__declspec(naked) void FUN_100291c0(void)
{
    __asm {
        _emit 051h _emit 056h _emit 050h _emit 068h
        /* g_101970CC */ dword ptr [g_101970CC]
        _emit 0E8h _emit 0A3h _emit 07Ah _emit 003h _emit 000h _emit 08Dh _emit 04Ch _emit 024h _emit 00Ch _emit 08Bh _emit 0F0h _emit 051h _emit 056h _emit 0FFh _emit 015h
        /* g_101D4AFC */ dword ptr [g_101D4AFC]
        _emit 083h _emit 0C4h _emit 010h _emit 085h _emit 0C0h _emit 056h _emit 07Dh _emit 010h _emit 068h
        /* g_10197350 */ dword ptr [g_10197350]
        _emit 0E8h _emit 093h _emit 08Ah _emit 003h _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 05Eh _emit 059h _emit 0C3h _emit 08Bh _emit 054h _emit 024h _emit 008h _emit 052h _emit 06Ah _emit 015h _emit 068h
        /* g_101A5A38 */ dword ptr [g_101A5A38]
        _emit 0FFh _emit 015h
        /* g_101D4AE4 */ dword ptr [g_101D4AE4]
        _emit 083h _emit 0C4h _emit 010h _emit 085h _emit 0C0h _emit 074h _emit 009h _emit 08Bh _emit 074h _emit 024h _emit 00Ch _emit 0E8h _emit 0BBh _emit 0FAh _emit 0FFh _emit 0FFh _emit 08Bh _emit 044h _emit 024h _emit 004h _emit 050h _emit 0FFh _emit 015h
        /* g_101D4B00 */ dword ptr [g_101D4B00]
        _emit 083h _emit 0C4h _emit 004h _emit 05Eh _emit 059h _emit 0C3h
    }
}
