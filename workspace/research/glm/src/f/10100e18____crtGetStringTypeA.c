extern int g_1010C054;
extern int g_1010C13C;
extern int g_1010C1A0;
extern int g_1010C1A4;
extern int g_1017C96C;
extern int g_1017E2B0;
extern int g_101AE198;
extern int g_101AE1A8;
extern int g_101AE1B0;

__declspec(naked) void ___crtGetStringTypeA(void)
{
    __asm {
        _emit 06Ah _emit 01Ch _emit 068h
        /* g_1017E2B0 */ dword ptr [g_1017E2B0]
        _emit 0E8h _emit 0ECh _emit 0A7h _emit 0FFh _emit 0FFh _emit 033h _emit 0F6h _emit 039h _emit 035h
        /* g_101AE1B0 */ dword ptr [g_101AE1B0]
        _emit 075h _emit 035h _emit 08Dh _emit 045h _emit 0E4h _emit 050h _emit 033h _emit 0FFh _emit 047h _emit 057h _emit 068h
        /* g_1017C96C */ dword ptr [g_1017C96C]
        _emit 057h _emit 0FFh _emit 015h
        /* g_1010C1A4 */ dword ptr [g_1010C1A4]
        _emit 085h _emit 0C0h _emit 074h _emit 008h _emit 089h _emit 03Dh
        /* g_101AE1B0 */ dword ptr [g_101AE1B0]
        _emit 0EBh _emit 015h _emit 0FFh _emit 015h
        /* g_1010C054 */ dword ptr [g_1010C054]
        _emit 083h _emit 0F8h _emit 078h _emit 075h _emit 00Ah _emit 0C7h _emit 005h _emit 0B0h _emit 0E1h _emit 01Ah _emit 010h
        /* g_101AE1B0 */ dword ptr [g_101AE1B0]
        _emit 0A1h
        /* g_101AE1B0 */ dword ptr [g_101AE1B0]
        _emit 083h _emit 0F8h _emit 002h _emit 00Fh _emit 084h _emit 0EAh _emit 000h _emit 000h _emit 000h _emit 03Bh _emit 0C6h _emit 00Fh _emit 084h _emit 0E2h _emit 000h _emit 000h _emit 000h _emit 083h _emit 0F8h _emit 001h _emit 00Fh _emit 085h _emit 0FFh _emit 000h _emit 000h _emit 000h _emit 089h _emit 075h _emit 0DCh _emit 089h _emit 075h _emit 0E0h _emit 039h _emit 075h _emit 018h _emit 075h _emit 008h _emit 0A1h
        /* g_101AE1A8 */ dword ptr [g_101AE1A8]
        _emit 089h _emit 045h _emit 018h _emit 056h _emit 056h _emit 0FFh _emit 075h _emit 010h _emit 0FFh _emit 075h _emit 00Ch _emit 033h _emit 0C0h _emit 039h _emit 075h _emit 020h _emit 00Fh _emit 095h _emit 0C0h _emit 08Dh _emit 004h _emit 0C5h _emit 001h _emit 000h _emit 000h _emit 000h _emit 050h _emit 0FFh _emit 075h _emit 018h _emit 0FFh _emit 015h
        /* g_1010C13C */ dword ptr [g_1010C13C]
        _emit 08Bh _emit 0F8h _emit 089h _emit 07Dh _emit 0D8h _emit 085h _emit 0FFh _emit 00Fh _emit 084h _emit 0BEh _emit 000h _emit 000h _emit 000h _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 08Dh _emit 01Ch _emit 03Fh _emit 08Bh _emit 0C3h _emit 083h _emit 0C0h _emit 003h _emit 083h _emit 0E0h _emit 0FCh _emit 0E8h _emit 059h _emit 079h _emit 0FFh _emit 0FFh _emit 089h _emit 065h _emit 0E8h _emit 08Bh _emit 0F4h _emit 089h _emit 075h _emit 0D4h _emit 053h _emit 06Ah _emit 000h _emit 056h _emit 0E8h _emit 058h _emit 0F4h _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 00Ch _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0EBh _emit 015h _emit 033h _emit 0C0h _emit 040h _emit 0C3h _emit 08Bh _emit 065h _emit 0E8h _emit 0E8h _emit 0DCh _emit 050h _emit 000h _emit 000h _emit 033h _emit 0F6h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 08Bh _emit 07Dh _emit 0D8h _emit 085h _emit 0F6h _emit 075h _emit 017h _emit 057h _emit 06Ah _emit 002h _emit 0E8h _emit 0B7h _emit 0C8h _emit 0FFh _emit 0FFh _emit 059h _emit 059h _emit 08Bh _emit 0F0h _emit 085h _emit 0F6h _emit 074h _emit 067h _emit 0C7h _emit 045h _emit 0E0h _emit 001h _emit 000h _emit 000h _emit 000h _emit 057h _emit 056h _emit 0FFh _emit 075h _emit 010h _emit 0FFh _emit 075h _emit 00Ch _emit 06Ah _emit 001h _emit 0FFh _emit 075h _emit 018h _emit 0FFh _emit 015h
        /* g_1010C13C */ dword ptr [g_1010C13C]
        _emit 085h _emit 0C0h _emit 074h _emit 011h _emit 0FFh _emit 075h _emit 014h _emit 050h _emit 056h _emit 0FFh _emit 075h _emit 008h _emit 0FFh _emit 015h
        /* g_1010C1A4 */ dword ptr [g_1010C1A4]
        _emit 089h _emit 045h _emit 0DCh _emit 083h _emit 07Dh _emit 0E0h _emit 000h _emit 074h _emit 007h _emit 056h _emit 0E8h _emit 07Bh _emit 075h _emit 0FFh _emit 0FFh _emit 059h _emit 08Bh _emit 045h _emit 0DCh _emit 0EBh _emit 06Eh _emit 08Bh _emit 05Dh _emit 01Ch _emit 03Bh _emit 0DEh _emit 075h _emit 006h _emit 08Bh _emit 01Dh
        /* g_101AE198 */ dword ptr [g_101AE198]
        _emit 08Bh _emit 07Dh _emit 018h _emit 085h _emit 0FFh _emit 075h _emit 006h _emit 08Bh _emit 03Dh
        /* g_101AE1A8 */ dword ptr [g_101AE1A8]
        _emit 053h _emit 0E8h _emit 00Ch _emit 070h _emit 000h _emit 000h _emit 059h _emit 083h _emit 0F8h _emit 0FFh _emit 075h _emit 004h _emit 033h _emit 0C0h _emit 0EBh _emit 044h _emit 03Bh _emit 0C7h _emit 074h _emit 01Eh _emit 06Ah _emit 000h _emit 06Ah _emit 000h _emit 08Dh _emit 04Dh _emit 010h _emit 051h _emit 0FFh _emit 075h _emit 00Ch _emit 050h _emit 057h _emit 0E8h _emit 02Fh _emit 070h _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 018h _emit 08Bh _emit 0F0h _emit 085h _emit 0F6h _emit 074h _emit 0DDh _emit 089h _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 014h _emit 0FFh _emit 075h _emit 010h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 008h _emit 053h _emit 0FFh _emit 015h
        /* g_1010C1A0 */ dword ptr [g_1010C1A0]
        _emit 08Bh _emit 0F8h _emit 085h
    }
}
