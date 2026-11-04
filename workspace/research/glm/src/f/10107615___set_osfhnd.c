extern int g_1010C0C0;
extern int g_101ADD8C;
extern int g_1076AC9C;

__declspec(naked) void __set_osfhnd(void)
{
    __asm {
        _emit 08Bh _emit 04Ch _emit 024h _emit 004h _emit 03Bh _emit 00Dh
        /* g_1076AC9C */ dword ptr [g_1076AC9C]
        _emit 056h _emit 057h _emit 073h _emit 055h _emit 08Bh _emit 0C1h _emit 0C1h _emit 0F8h _emit 005h _emit 08Dh _emit 03Ch _emit 085h _emit 0A0h _emit 0ACh _emit 076h _emit 010h _emit 08Bh _emit 0C1h _emit 083h _emit 0E0h _emit 01Fh _emit 08Dh _emit 034h _emit 0C0h _emit 08Bh _emit 007h _emit 0C1h _emit 0E6h _emit 002h _emit 083h _emit 03Ch _emit 006h _emit 0FFh _emit 075h _emit 036h _emit 083h _emit 03Dh _emit 08Ch
        /* g_101ADD8C */ dword ptr [g_101ADD8C]
        _emit 053h _emit 08Bh _emit 05Ch _emit 024h _emit 014h _emit 075h _emit 01Eh _emit 083h _emit 0E9h _emit 000h _emit 074h _emit 010h _emit 049h _emit 074h _emit 008h _emit 049h _emit 075h _emit 013h _emit 053h _emit 06Ah _emit 0F4h _emit 0EBh _emit 008h _emit 053h _emit 06Ah _emit 0F5h _emit 0EBh _emit 003h _emit 053h _emit 06Ah _emit 0F6h _emit 0FFh _emit 015h
        /* g_1010C0C0 */ dword ptr [g_1010C0C0]
        _emit 08Bh _emit 007h _emit 089h _emit 01Ch _emit 006h _emit 033h _emit 0C0h _emit 05Bh _emit 0EBh _emit 016h _emit 0E8h _emit 099h _emit 04Bh _emit 0FFh _emit 0FFh _emit 0C7h _emit 000h _emit 009h _emit 000h _emit 000h _emit 000h _emit 0E8h _emit 097h _emit 04Bh _emit 0FFh _emit 0FFh _emit 083h _emit 020h _emit 000h _emit 083h _emit 0C8h _emit 0FFh _emit 05Fh _emit 05Eh _emit 0C3h
    }
}
