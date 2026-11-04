extern int g_1010C000;
extern int g_1010C004;
extern int g_1010C008;
extern int g_10110098;

__declspec(naked) void FUN_10083ec3(void)
{
    __asm {
        _emit 08Bh _emit 0FFh _emit 055h _emit 08Bh _emit 0ECh _emit 051h _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 08Dh _emit 045h _emit 0FCh _emit 050h _emit 068h
        /* g_10110098 */ dword ptr [g_10110098]
        _emit 068h _emit 002h _emit 000h _emit 000h _emit 080h _emit 0FFh _emit 015h
        /* g_1010C008 */ dword ptr [g_1010C008]
        _emit 085h _emit 0C0h _emit 075h _emit 037h _emit 056h _emit 08Dh _emit 045h _emit 014h _emit 050h _emit 0FFh _emit 075h _emit 010h _emit 08Dh _emit 045h _emit 010h _emit 050h _emit 06Ah _emit 000h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 0FCh _emit 0FFh _emit 015h
        /* g_1010C000 */ dword ptr [g_1010C000]
        _emit 0FFh _emit 075h _emit 0FCh _emit 08Bh _emit 0F0h _emit 0FFh _emit 015h
        /* g_1010C004 */ dword ptr [g_1010C004]
        _emit 085h _emit 0F6h _emit 05Eh _emit 075h _emit 00Dh _emit 08Bh _emit 045h _emit 010h _emit 03Bh _emit 045h _emit 008h _emit 075h _emit 005h _emit 033h _emit 0C0h _emit 040h _emit 0EBh _emit 002h _emit 033h _emit 0C0h _emit 0C9h _emit 0C2h _emit 010h _emit 000h
    }
}
