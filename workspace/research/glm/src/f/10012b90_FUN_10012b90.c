extern int g_10193C74;
extern int g_10193C84;
extern int g_101CE66C;
extern int g_101CE688;
extern int g_101CE6CC;
extern int g_101CE6DC;
extern int g_101CE7FC;
extern int g_101D4AC4;

__declspec(naked) void FUN_10012b90(void)
{
    __asm {
        _emit 051h _emit 0A1h
        /* g_101CE688 */ dword ptr [g_101CE688]
        _emit 053h _emit 057h _emit 050h _emit 0FFh _emit 015h
        /* g_101D4AC4 */ dword ptr [g_101D4AC4]
        _emit 08Dh _emit 07Eh _emit 018h _emit 057h _emit 08Dh _emit 05Eh _emit 014h _emit 053h _emit 068h
        /* g_10193C84 */ dword ptr [g_10193C84]
        _emit 050h _emit 0E8h _emit 0CCh _emit 031h _emit 00Eh _emit 000h _emit 08Bh _emit 00Dh
        /* g_101CE7FC */ dword ptr [g_101CE7FC]
        _emit 051h _emit 0FFh _emit 015h
        /* g_101D4AC4 */ dword ptr [g_101D4AC4]
        _emit 08Dh _emit 054h _emit 024h _emit 020h _emit 052h _emit 068h
        /* g_10193C74 */ dword ptr [g_10193C74]
        _emit 050h _emit 0E8h _emit 0AFh _emit 031h _emit 00Eh _emit 000h _emit 08Bh _emit 044h _emit 024h _emit 02Ch _emit 08Bh _emit 00Fh _emit 08Bh _emit 01Bh _emit 050h _emit 051h _emit 0E8h _emit 022h _emit 0FFh _emit 0FFh _emit 0FFh _emit 08Bh _emit 015h
        /* g_101CE6CC */ dword ptr [g_101CE6CC]
        _emit 08Bh _emit 00Dh
        /* g_101CE66C */ dword ptr [g_101CE66C]
        _emit 089h _emit 046h _emit 004h _emit 08Bh _emit 042h _emit 008h _emit 089h _emit 046h _emit 00Ch _emit 08Bh _emit 051h _emit 008h _emit 0A1h
        /* g_101CE6DC */ dword ptr [g_101CE6DC]
        _emit 083h _emit 0C4h _emit 02Ch _emit 089h _emit 056h _emit 010h _emit 0C6h _emit 046h _emit 008h _emit 001h _emit 0C7h _emit 006h _emit 000h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 048h _emit 008h _emit 05Fh _emit 089h _emit 04Eh _emit 020h _emit 05Bh _emit 059h _emit 0C3h
    }
}
