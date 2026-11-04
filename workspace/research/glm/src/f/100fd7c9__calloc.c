extern int g_1010C130;
extern int g_1017C9C0;
extern int g_101AE238;
extern int g_1076AC70;
extern int g_1076AC94;
extern int g_1076AC98;

__declspec(naked) void _calloc(void)
{
    __asm {
        _emit 06Ah _emit 010h _emit 068h
        /* g_1017C9C0 */ dword ptr [g_1017C9C0]
        _emit 0E8h _emit 03Bh _emit 0DEh _emit 0FFh _emit 0FFh _emit 08Bh _emit 075h _emit 008h _emit 00Fh _emit 0AFh _emit 075h _emit 00Ch _emit 089h _emit 075h _emit 0E0h _emit 085h _emit 0F6h _emit 075h _emit 001h _emit 046h _emit 033h _emit 0FFh _emit 089h _emit 07Dh _emit 0E4h _emit 083h _emit 0FEh _emit 0E0h _emit 077h _emit 065h _emit 083h _emit 03Dh _emit 098h
        /* g_1076AC98 */ dword ptr [g_1076AC98]
        _emit 075h _emit 047h _emit 083h _emit 0C6h _emit 00Fh _emit 083h _emit 0E6h _emit 0F0h _emit 089h _emit 075h _emit 00Ch _emit 08Bh _emit 05Dh _emit 0E0h _emit 03Bh _emit 01Dh
        /* g_1076AC70 */ dword ptr [g_1076AC70]
        _emit 077h _emit 033h _emit 06Ah _emit 004h _emit 0E8h _emit 06Bh _emit 0E8h _emit 0FFh _emit 0FFh _emit 059h _emit 021h _emit 07Dh _emit 0FCh _emit 053h _emit 0E8h _emit 0B3h _emit 045h _emit 000h _emit 000h _emit 059h _emit 089h _emit 045h _emit 0E4h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 04Ah _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 07Dh _emit 0E4h _emit 085h _emit 0FFh _emit 074h _emit 012h _emit 0FFh _emit 075h _emit 0E0h _emit 06Ah _emit 000h _emit 057h _emit 0E8h _emit 005h _emit 02Bh _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 085h _emit 0FFh _emit 075h _emit 03Ah _emit 056h _emit 06Ah _emit 008h _emit 0FFh _emit 035h
        /* g_1076AC94 */ dword ptr [g_1076AC94]
        _emit 0FFh _emit 015h
        /* g_1010C130 */ dword ptr [g_1010C130]
        _emit 08Bh _emit 0F8h _emit 085h _emit 0FFh _emit 075h _emit 025h _emit 039h _emit 03Dh
        /* g_101AE238 */ dword ptr [g_101AE238]
        _emit 074h _emit 01Dh _emit 056h _emit 0E8h _emit 047h _emit 0A6h _emit 000h _emit 000h _emit 059h _emit 085h _emit 0C0h _emit 00Fh _emit 085h _emit 076h _emit 0FFh _emit 0FFh _emit 0FFh _emit 0EBh _emit 00Eh _emit 08Bh _emit 075h _emit 00Ch _emit 06Ah _emit 004h _emit 0E8h _emit 036h _emit 0E7h
    }
}
