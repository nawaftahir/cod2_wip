extern int g_1010C044;
extern int g_1010C054;
extern int g_1010C0A8;
extern int g_10182570;
extern int g_101AE1A8;
extern int g_101AE264;

__declspec(naked) void ___crtGetLocaleInfoA(void)
{
    __asm {
        _emit 06Ah _emit 018h _emit 068h
        /* g_10182570 */ dword ptr [g_10182570]
        _emit 0E8h _emit 056h _emit 01Ah _emit 0FFh _emit 0FFh _emit 033h _emit 0F6h _emit 039h _emit 035h
        /* g_101AE264 */ dword ptr [g_101AE264]
        _emit 075h _emit 02Eh _emit 056h _emit 056h _emit 033h _emit 0FFh _emit 047h _emit 057h _emit 056h _emit 0FFh _emit 015h
        /* g_1010C0A8 */ dword ptr [g_1010C0A8]
        _emit 085h _emit 0C0h _emit 074h _emit 008h _emit 089h _emit 03Dh
        /* g_101AE264 */ dword ptr [g_101AE264]
        _emit 0EBh _emit 015h _emit 0FFh _emit 015h
        /* g_1010C054 */ dword ptr [g_1010C054]
        _emit 083h _emit 0F8h _emit 078h _emit 075h _emit 00Ah _emit 0C7h _emit 005h _emit 064h _emit 0E2h _emit 01Ah _emit 010h
        /* g_101AE264 */ dword ptr [g_101AE264]
        _emit 0A1h
        /* g_101AE264 */ dword ptr [g_101AE264]
        _emit 083h _emit 0F8h _emit 002h _emit 00Fh _emit 084h _emit 0D3h _emit 000h _emit 000h _emit 000h _emit 03Bh _emit 0C6h _emit 00Fh _emit 084h _emit 0CBh _emit 000h _emit 000h _emit 000h _emit 083h _emit 0F8h _emit 001h _emit 075h _emit 02Ah _emit 089h _emit 075h _emit 0E4h _emit 089h _emit 075h _emit 0E0h _emit 039h _emit 075h _emit 018h _emit 075h _emit 008h _emit 0A1h
        /* g_101AE1A8 */ dword ptr [g_101AE1A8]
        _emit 089h _emit 045h _emit 018h _emit 056h _emit 056h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 008h _emit 0FFh _emit 015h
        /* g_1010C0A8 */ dword ptr [g_1010C0A8]
        _emit 08Bh _emit 0D8h _emit 089h _emit 05Dh _emit 0DCh _emit 03Bh _emit 0DEh _emit 075h _emit 007h _emit 033h _emit 0C0h _emit 0E9h _emit 0A7h _emit 000h _emit 000h _emit 000h _emit 089h _emit 075h _emit 0FCh _emit 08Dh _emit 004h _emit 01Bh _emit 083h _emit 0C0h _emit 003h _emit 083h _emit 0E0h _emit 0FCh _emit 0E8h _emit 0E1h _emit 0EBh _emit 0FEh _emit 0FFh _emit 089h _emit 065h _emit 0E8h _emit 08Bh _emit 0FCh _emit 089h _emit 07Dh _emit 0D8h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0EBh _emit 017h _emit 033h _emit 0C0h _emit 040h _emit 0C3h _emit 08Bh _emit 065h _emit 0E8h _emit 0E8h _emit 070h _emit 0C3h _emit 0FFh _emit 0FFh _emit 033h _emit 0F6h _emit 033h _emit 0FFh _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 08Bh _emit 05Dh _emit 0DCh _emit 03Bh _emit 0FEh _emit 075h _emit 017h _emit 08Dh _emit 004h _emit 01Bh _emit 050h _emit 0E8h _emit 0E3h _emit 027h _emit 0FFh _emit 0FFh _emit 059h _emit 08Bh _emit 0F8h _emit 03Bh _emit 0FEh _emit 074h _emit 0AFh _emit 0C7h _emit 045h _emit 0E0h _emit 001h _emit 000h _emit 000h _emit 000h _emit 053h _emit 057h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 008h _emit 0FFh _emit 015h
        /* g_1010C0A8 */ dword ptr [g_1010C0A8]
        _emit 085h _emit 0C0h _emit 074h _emit 021h _emit 056h _emit 056h _emit 039h _emit 075h _emit 014h _emit 075h _emit 004h _emit 056h _emit 056h _emit 0EBh _emit 006h _emit 0FFh _emit 075h _emit 014h _emit 0FFh _emit 075h _emit 010h _emit 06Ah _emit 0FFh _emit 057h _emit 056h _emit 0FFh _emit 075h _emit 018h _emit 0FFh _emit 015h
        /* g_1010C044 */ dword ptr [g_1010C044]
        _emit 089h _emit 045h _emit 0E4h _emit 039h _emit 075h _emit 0E0h _emit 074h _emit 007h _emit 057h _emit 0E8h _emit 003h _emit 0E8h _emit 0FEh _emit 0FFh _emit 059h _emit 08Bh _emit 045h _emit 0E4h _emit 0EBh _emit 012h _emit 0FFh _emit 075h _emit 014h _emit 0FFh
    }
}
