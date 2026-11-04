extern int g_1010C148;
extern int g_1010C14C;
extern int g_1017C9B0;
extern int g_1019E024;
extern int g_1019E02C;
extern int g_1019E030;
extern int g_1019E034;
extern int g_101AE044;
extern int g_101AE048;
extern int g_101AE04C;
extern int g_1076ADA4;
extern int g_1076ADA8;

__declspec(naked) void doexit(void)
{
    __asm {
        _emit 06Ah _emit 008h _emit 068h
        /* g_1017C9B0 */ dword ptr [g_1017C9B0]
        _emit 0E8h _emit 03Eh _emit 0DFh _emit 0FFh _emit 0FFh _emit 06Ah _emit 008h _emit 0E8h _emit 0A4h _emit 0E9h _emit 0FFh _emit 0FFh _emit 059h _emit 033h _emit 0FFh _emit 089h _emit 07Dh _emit 0FCh _emit 033h _emit 0F6h _emit 046h _emit 039h _emit 035h
        /* g_101AE04C */ dword ptr [g_101AE04C]
        _emit 075h _emit 010h _emit 0FFh _emit 075h _emit 008h _emit 0FFh _emit 015h
        /* g_1010C14C */ dword ptr [g_1010C14C]
        _emit 050h _emit 0FFh _emit 015h
        /* g_1010C148 */ dword ptr [g_1010C148]
        _emit 089h _emit 035h
        /* g_101AE048 */ dword ptr [g_101AE048]
        _emit 08Ah _emit 045h _emit 010h _emit 0A2h
        /* g_101AE044 */ dword ptr [g_101AE044]
        _emit 039h _emit 07Dh _emit 00Ch _emit 075h _emit 037h _emit 039h _emit 03Dh
        /* g_1076ADA8 */ dword ptr [g_1076ADA8]
        _emit 074h _emit 01Fh _emit 0A1h
        /* g_1076ADA4 */ dword ptr [g_1076ADA4]
        _emit 083h _emit 0E8h _emit 004h _emit 0A3h
        /* g_1076ADA4 */ dword ptr [g_1076ADA4]
        _emit 03Bh _emit 005h
        /* g_1076ADA8 */ dword ptr [g_1076ADA8]
        _emit 072h _emit 00Ah _emit 08Bh _emit 000h _emit 03Bh _emit 0C7h _emit 074h _emit 0E5h _emit 0FFh _emit 0D0h _emit 0EBh _emit 0E1h _emit 068h
        /* g_1019E02C */ dword ptr [g_1019E02C]
        _emit 0B8h
        /* g_1019E024 */ dword ptr [g_1019E024]
        _emit 0E8h _emit 0E3h _emit 0FEh _emit 0FFh _emit 0FFh _emit 059h _emit 068h
        /* g_1019E034 */ dword ptr [g_1019E034]
        _emit 0B8h
        /* g_1019E030 */ dword ptr [g_1019E030]
        _emit 0E8h _emit 0D3h _emit 0FEh _emit 0FFh _emit 0FFh _emit 059h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 018h _emit 000h _emit 000h _emit 000h _emit 039h _emit 07Dh _emit 010h _emit 075h _emit 021h _emit 089h _emit 035h
        /* g_101AE04C */ dword ptr [g_101AE04C]
        _emit 0FFh _emit 075h _emit 008h _emit 0E8h _emit 074h _emit 0FEh _emit 0FFh _emit 0FFh _emit 033h _emit 0FFh _emit 033h _emit 0F6h _emit 046h _emit 039h _emit 07Dh _emit 010h _emit 074h _emit 008h _emit 06Ah
    }
}
