extern int g_1010C0E0;
extern int g_10193C40;
extern int g_101D1BF4;
extern int g_101D1BF8;
extern int g_101D1BFC;
extern int g_101D49C8;

__declspec(naked) void FUN_100126d0(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 06Ch _emit 024h _emit 00Ch _emit 056h _emit 057h _emit 0EBh _emit 007h _emit 08Dh _emit 0A4h _emit 024h _emit 000h _emit 000h _emit 000h _emit 000h _emit 068h
        /* g_10193C40 */ dword ptr [g_10193C40]
        _emit 06Ah _emit 000h _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 083h _emit 0C4h _emit 008h _emit 033h _emit 0FFh _emit 08Bh _emit 054h _emit 024h _emit 010h _emit 0A1h
        /* g_101D1BF4 */ dword ptr [g_101D1BF4]
        _emit 08Bh _emit 008h _emit 068h
        /* g_101D1BF8 */ dword ptr [g_101D1BF8]
        _emit 053h _emit 055h _emit 052h _emit 08Bh _emit 015h
        /* g_101D1BFC */ dword ptr [g_101D1BFC]
        _emit 06Ah _emit 001h _emit 052h _emit 050h _emit 0FFh _emit 051h _emit 040h _emit 08Bh _emit 0F0h _emit 085h _emit 0F6h _emit 07Dh _emit 023h _emit 06Ah _emit 064h _emit 0FFh _emit 015h
        /* g_1010C0E0 */ dword ptr [g_1010C0E0]
        _emit 047h _emit 083h _emit 0FFh _emit 014h _emit 075h _emit 0CCh _emit 0A1h
        /* g_101D1BFC */ dword ptr [g_101D1BFC]
        _emit 085h _emit 0C0h _emit 074h _emit 00Ch _emit 0C7h _emit 005h _emit 0FCh _emit 01Bh _emit 01Dh _emit 010h
        /* g_101D1BFC */ dword ptr [g_101D1BFC]
        _emit 0EBh
    }
}
