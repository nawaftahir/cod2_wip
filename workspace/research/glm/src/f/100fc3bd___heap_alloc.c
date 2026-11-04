extern int g_1010C130;
extern int g_1017C910;
extern int g_1076AC70;
extern int g_1076AC94;
extern int g_1076AC98;

__declspec(naked) void __heap_alloc(void)
{
    __asm {
        _emit 06Ah _emit 00Ch _emit 068h
        /* g_1017C910 */ dword ptr [g_1017C910]
        _emit 0E8h _emit 047h _emit 0F2h _emit 0FFh _emit 0FFh _emit 08Bh _emit 075h _emit 008h _emit 083h _emit 03Dh _emit 098h
        /* g_1076AC98 */ dword ptr [g_1076AC98]
        _emit 075h _emit 02Eh _emit 03Bh _emit 035h
        /* g_1076AC70 */ dword ptr [g_1076AC70]
        _emit 077h _emit 026h _emit 06Ah _emit 004h _emit 0E8h _emit 099h _emit 0FCh _emit 0FFh _emit 0FFh _emit 059h _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 056h _emit 0E8h _emit 0E0h _emit 059h _emit 000h _emit 000h _emit 059h _emit 089h _emit 045h _emit 0E4h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 033h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 045h _emit 0E4h _emit 085h _emit 0C0h _emit 075h _emit 023h _emit 085h _emit 0F6h _emit 075h _emit 001h _emit 046h _emit 083h _emit 03Dh _emit 098h
        /* g_1076AC98 */ dword ptr [g_1076AC98]
        _emit 074h _emit 006h _emit 083h _emit 0C6h _emit 00Fh _emit 083h _emit 0E6h _emit 0F0h _emit 056h _emit 06Ah _emit 000h _emit 0FFh _emit 035h
        /* g_1076AC94 */ dword ptr [g_1076AC94]
        _emit 0FFh _emit 015h
        /* g_1010C130 */ dword ptr [g_1010C130]
        _emit 0E8h _emit 020h _emit 0F2h _emit 0FFh _emit 0FFh _emit 0C3h
    }
}
