extern int g_1017C4A8;
extern int g_101ADD7C;
extern int g_1076BDD0;

__declspec(naked) void entry(void)
{
    __asm {
        _emit 06Ah _emit 00Ch _emit 068h
        /* g_1017C4A8 */ dword ptr [g_1017C4A8]
        _emit 0E8h _emit 0B6h _emit 03Eh _emit 000h _emit 000h _emit 033h _emit 0C0h _emit 040h _emit 089h _emit 045h _emit 0E4h _emit 08Bh _emit 075h _emit 00Ch _emit 033h _emit 0FFh _emit 03Bh _emit 0F7h _emit 075h _emit 00Ch _emit 039h _emit 03Dh
        /* g_101ADD7C */ dword ptr [g_101ADD7C]
        _emit 00Fh _emit 084h _emit 0B3h _emit 000h _emit 000h _emit 000h _emit 089h _emit 07Dh _emit 0FCh _emit 03Bh _emit 0F0h _emit 074h _emit 005h _emit 083h _emit 0FEh _emit 002h _emit 075h _emit 031h _emit 0A1h
        /* g_1076BDD0 */ dword ptr [g_1076BDD0]
        _emit 03Bh _emit 0C7h _emit 074h _emit 00Ch _emit 0FFh _emit 075h _emit 010h _emit 056h _emit 0FFh _emit 075h _emit 008h _emit 0FFh _emit 0D0h _emit 089h _emit 045h _emit 0E4h _emit 039h _emit 07Dh _emit 0E4h _emit 00Fh _emit 084h _emit 085h _emit 000h _emit 000h _emit 000h _emit 0FFh _emit 075h _emit 010h _emit 056h _emit 0FFh _emit 075h _emit 008h _emit 0E8h _emit 022h _emit 0FEh _emit 0FFh _emit 0FFh _emit 089h _emit 045h _emit 0E4h _emit 03Bh _emit 0C7h _emit 074h _emit 072h _emit 08Bh _emit 05Dh _emit 010h _emit 053h _emit 056h _emit 0FFh _emit 075h _emit 008h _emit 0E8h _emit 029h _emit 06Ah _emit 000h _emit 000h _emit 089h _emit 045h _emit 0E4h _emit 083h _emit 0FEh _emit 001h _emit 075h _emit 00Eh _emit 03Bh _emit 0C7h _emit 075h _emit 00Ah _emit 053h _emit 057h _emit 0FFh _emit 075h _emit 008h _emit 0E8h _emit 0F8h _emit 0FDh _emit 0FFh _emit 0FFh _emit 03Bh _emit 0F7h _emit 074h _emit 005h _emit 083h _emit 0FEh _emit 003h _emit 075h _emit 029h _emit 053h _emit 056h _emit 0FFh _emit 075h _emit 008h _emit 0E8h _emit 0E5h _emit 0FDh _emit 0FFh _emit 0FFh _emit 085h _emit 0C0h _emit 075h _emit 003h _emit 089h _emit 07Dh _emit 0E4h _emit 039h _emit 07Dh _emit 0E4h _emit 074h _emit 013h _emit 0A1h
        /* g_1076BDD0 */ dword ptr [g_1076BDD0]
        _emit 03Bh _emit 0C7h _emit 074h _emit 00Ah _emit 053h _emit 056h _emit 0FFh _emit 075h _emit 008h _emit 0FFh _emit 0D0h _emit 089h _emit 045h _emit 0E4h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 08Bh _emit 045h _emit 0E4h _emit 0EBh _emit 01Ah _emit 08Bh _emit 045h _emit 0ECh _emit 08Bh _emit 008h _emit 08Bh _emit 009h _emit 050h _emit 051h _emit 0E8h _emit 0AFh _emit 069h _emit 000h _emit 000h
    }
}
