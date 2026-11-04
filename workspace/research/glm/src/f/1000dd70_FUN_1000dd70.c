extern int g_101931D8;
extern int g_101D5D28;
extern int g_101D5D2C;

__declspec(naked) void FUN_1000dd70(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 06Ch _emit 024h _emit 008h _emit 056h _emit 057h _emit 08Bh _emit 03Dh
        /* g_101D5D28 */ dword ptr [g_101D5D28]
        _emit 033h _emit 0F6h _emit 085h _emit 0FFh _emit 07Eh _emit 03Fh _emit 0BAh
        /* g_101D5D2C */ dword ptr [g_101D5D2C]
        _emit 08Bh _emit 0CDh _emit 0E8h _emit 0C1h _emit 0ECh _emit 001h _emit 000h _emit 085h _emit 0C0h _emit 075h _emit 021h _emit 046h _emit 083h _emit 0C2h _emit 044h _emit 03Bh _emit 0F7h _emit 07Ch _emit 0EDh _emit 083h _emit 0FEh _emit 010h _emit 075h _emit 022h _emit 056h _emit 068h
        /* g_101931D8 */ dword ptr [g_101931D8]
        _emit 0E8h _emit 0D5h _emit 03Eh _emit 005h _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 05Fh _emit 05Eh _emit 033h _emit 0C0h _emit 05Dh _emit 0C3h _emit 08Bh _emit 0C6h _emit 06Bh _emit 0C0h _emit 044h _emit 05Fh _emit 05Eh _emit 005h
        /* g_101D5D2C */ dword ptr [g_101D5D2C]
        _emit 05Dh _emit 0C3h _emit 08Bh _emit 0C6h _emit 06Bh _emit 0C0h _emit 044h _emit 053h _emit 056h _emit 08Dh _emit 098h _emit 02Ch _emit 05Dh _emit 01Dh _emit 010h _emit 055h _emit 0E8h _emit 02Bh _emit 0EFh _emit 001h _emit 000h _emit 0A1h
        /* g_101D5D28 */ dword ptr [g_101D5D28]
        _emit 083h _emit 0C4h _emit 008h _emit 040h _emit 0A3h
        /* g_101D5D28 */ dword ptr [g_101D5D28]
        _emit 08Bh _emit 0C3h _emit 05Bh _emit 05Fh _emit 05Eh _emit 05Dh _emit 0C3h
    }
}
