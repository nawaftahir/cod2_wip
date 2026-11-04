extern int g_1010C038;
extern int g_1010C03C;
extern int g_1010C080;
extern int g_1010C0E0;
extern int g_1010C0E4;
extern int g_101ABD58;
extern int g_101ABD70;
extern int g_101ABD74;

__declspec(naked) void FUN_100639c9(void)
{
    __asm {
        _emit 08Bh _emit 0FFh _emit 053h _emit 056h _emit 057h _emit 068h
        /* g_101ABD58 */ dword ptr [g_101ABD58]
        _emit 0FFh _emit 015h
        /* g_1010C03C */ dword ptr [g_1010C03C]
        _emit 08Bh _emit 03Dh
        /* g_1010C0E4 */ dword ptr [g_1010C0E4]
        _emit 033h _emit 0DBh _emit 043h _emit 0BEh
        /* g_101ABD74 */ dword ptr [g_101ABD74]
        _emit 0EBh _emit 007h _emit 053h _emit 0FFh _emit 015h
        /* g_1010C0E0 */ dword ptr [g_1010C0E0]
        _emit 06Ah _emit 000h _emit 053h _emit 056h _emit 0FFh _emit 0D7h _emit 03Bh _emit 0C3h _emit 074h _emit 0EFh _emit 029h _emit 01Dh
        /* g_101ABD70 */ dword ptr [g_101ABD70]
        _emit 075h _emit 00Bh _emit 068h
        /* g_101ABD58 */ dword ptr [g_101ABD58]
        _emit 0FFh _emit 015h
        /* g_1010C038 */ dword ptr [g_1010C038]
        _emit 06Ah _emit 000h _emit 056h _emit 0FFh _emit 015h
        /* g_1010C080 */ dword ptr [g_1010C080]
        _emit 05Fh _emit 05Eh _emit 05Bh _emit 0C3h
    }
}
