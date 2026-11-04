extern int g_1010C0AC;
extern int g_10182530;
extern int g_1076AC94;
extern int g_1076AC98;

__declspec(naked) void __msize(void)
{
    __asm {
        _emit 06Ah _emit 010h _emit 068h
        /* g_10182530 */ dword ptr [g_10182530]
        _emit 0E8h _emit 08Ah _emit 01Eh _emit 0FFh _emit 0FFh _emit 083h _emit 03Dh _emit 098h
        /* g_1076AC98 */ dword ptr [g_1076AC98]
        _emit 075h _emit 03Ah _emit 06Ah _emit 004h _emit 0E8h _emit 0E7h _emit 028h _emit 0FFh _emit 0FFh _emit 059h _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 08Bh _emit 075h _emit 008h _emit 056h _emit 0E8h _emit 007h _emit 07Ah _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 045h _emit 0E0h _emit 085h _emit 0C0h _emit 074h _emit 00Bh _emit 08Bh _emit 076h _emit 0FCh _emit 083h _emit 0EEh _emit 009h _emit 089h _emit 075h _emit 0E4h _emit 0EBh _emit 003h _emit 08Bh _emit 075h _emit 0E4h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 024h _emit 000h _emit 000h _emit 000h _emit 083h _emit 07Dh _emit 0E0h _emit 000h _emit 075h _emit 013h _emit 0FFh _emit 075h _emit 008h _emit 06Ah _emit 000h _emit 0FFh _emit 035h
        /* g_1076AC94 */ dword ptr [g_1076AC94]
        _emit 0FFh _emit 015h
        /* g_1010C0AC */ dword ptr [g_1010C0AC]
        _emit 08Bh _emit 0F0h _emit 08Bh _emit 0C6h _emit 0E8h _emit 068h _emit 01Eh _emit 0FFh _emit 0FFh _emit 0C3h
    }
}
