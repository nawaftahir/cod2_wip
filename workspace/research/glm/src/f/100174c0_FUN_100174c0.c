extern int g_1018EAC8;
extern int g_1018EB1C;
extern int g_101D7FCC;

__declspec(naked) void FUN_100174c0(void)
{
    __asm {
        _emit 051h _emit 053h _emit 055h _emit 056h _emit 057h _emit 0BDh
        /* g_101D7FCC */ dword ptr [g_101D7FCC]
        _emit 0C7h _emit 044h _emit 024h _emit 010h _emit 020h _emit 000h _emit 000h _emit 000h _emit 083h _emit 07Dh _emit 000h _emit 000h _emit 074h _emit 02Bh _emit 08Dh _emit 05Dh _emit 008h _emit 0BEh
        /* g_1018EAC8 */ dword ptr [g_1018EAC8]
        _emit 08Bh _emit 0FBh _emit 08Bh _emit 043h _emit 0FCh _emit 08Bh _emit 04Dh _emit 000h _emit 056h _emit 050h _emit 051h _emit 0E8h _emit 0D0h _emit 0F0h _emit 0FFh _emit 0FFh _emit 089h _emit 007h _emit 083h _emit 0C6h _emit 015h _emit 083h _emit 0C4h _emit 00Ch _emit 083h _emit 0C7h _emit 004h _emit 081h _emit 0FEh
        /* g_1018EB1C */ dword ptr [g_1018EB1C]
        _emit 07Ch _emit 0DFh _emit 08Bh _emit 044h _emit 024h _emit 010h _emit 083h _emit 0C5h _emit 018h _emit 048h _emit 089h _emit 044h _emit 024h _emit 010h _emit 075h _emit 0C1h _emit 05Fh _emit 05Eh _emit 05Dh _emit 05Bh _emit 059h _emit 0C3h
    }
}
