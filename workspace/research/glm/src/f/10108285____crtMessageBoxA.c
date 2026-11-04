extern int g_1010C04C;
extern int g_1010C050;
extern int g_101822CC;
extern int g_101822E4;
extern int g_10182300;
extern int g_10182314;
extern int g_10182324;
extern int g_10182330;
extern int g_101AE00C;
extern int g_101AE018;
extern int g_101AE23C;
extern int g_101AE240;
extern int g_101AE244;
extern int g_101AE248;
extern int g_101AE24C;

__declspec(naked) void ___crtMessageBoxA(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 083h _emit 0ECh _emit 010h _emit 053h _emit 033h _emit 0DBh _emit 039h _emit 01Dh
        /* g_101AE23C */ dword ptr [g_101AE23C]
        _emit 056h _emit 057h _emit 075h _emit 06Dh _emit 068h
        /* g_10182330 */ dword ptr [g_10182330]
        _emit 0FFh _emit 015h
        /* g_1010C050 */ dword ptr [g_1010C050]
        _emit 08Bh _emit 0F8h _emit 03Bh _emit 0FBh _emit 00Fh _emit 084h _emit 093h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 035h
        /* g_1010C04C */ dword ptr [g_1010C04C]
        _emit 068h
        /* g_10182324 */ dword ptr [g_10182324]
        _emit 057h _emit 0FFh _emit 0D6h _emit 085h _emit 0C0h _emit 0A3h
        /* g_101AE23C */ dword ptr [g_101AE23C]
        _emit 074h _emit 07Ch _emit 068h
        /* g_10182314 */ dword ptr [g_10182314]
        _emit 057h _emit 0FFh _emit 0D6h _emit 068h
        /* g_10182300 */ dword ptr [g_10182300]
        _emit 057h _emit 0A3h
        /* g_101AE240 */ dword ptr [g_101AE240]
        _emit 0FFh _emit 0D6h _emit 083h _emit 03Dh _emit 00Ch
        /* g_101AE00C */ dword ptr [g_101AE00C]
        _emit 0A3h
        /* g_101AE244 */ dword ptr [g_101AE244]
        _emit 075h _emit 01Eh _emit 068h
        /* g_101822E4 */ dword ptr [g_101822E4]
        _emit 057h _emit 0FFh _emit 0D6h _emit 085h _emit 0C0h _emit 0A3h
        /* g_101AE24C */ dword ptr [g_101AE24C]
        _emit 074h _emit 00Dh _emit 068h
        /* g_101822CC */ dword ptr [g_101822CC]
        _emit 057h _emit 0FFh _emit 0D6h _emit 0A3h
        /* g_101AE248 */ dword ptr [g_101AE248]
        _emit 0A1h
        /* g_101AE248 */ dword ptr [g_101AE248]
        _emit 085h _emit 0C0h _emit 074h _emit 03Ch _emit 0FFh _emit 0D0h _emit 085h _emit 0C0h _emit 074h _emit 01Dh _emit 08Dh _emit 04Dh _emit 0FCh _emit 051h _emit 06Ah _emit 00Ch _emit 08Dh _emit 04Dh _emit 0F0h _emit 051h _emit 06Ah _emit 001h _emit 050h _emit 0FFh _emit 015h
        /* g_101AE24C */ dword ptr [g_101AE24C]
        _emit 085h _emit 0C0h _emit 074h _emit 006h _emit 0F6h _emit 045h _emit 0F8h _emit 001h _emit 075h _emit 019h _emit 083h _emit 03Dh _emit 018h
        /* g_101AE018 */ dword ptr [g_101AE018]
        _emit 072h _emit 00Ah _emit 080h _emit 04Dh _emit 012h _emit 020h _emit 0EBh _emit 029h _emit 033h _emit 0C0h _emit 0EBh _emit 035h _emit 080h _emit 04Dh _emit 012h _emit 004h _emit 0EBh _emit 01Fh _emit 0A1h
        /* g_101AE240 */ dword ptr [g_101AE240]
        _emit 085h _emit 0C0h _emit 074h _emit 016h _emit 0FFh _emit 0D0h _emit 08Bh _emit 0D8h _emit 085h _emit 0DBh _emit 074h _emit 00Eh _emit 0A1h
        /* g_101AE244 */ dword ptr [g_101AE244]
        _emit 085h _emit 0C0h _emit 074h _emit 005h _emit 053h _emit 0FFh _emit 0D0h _emit 08Bh _emit 0D8h _emit 0FFh _emit 075h _emit 010h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 008h _emit 053h _emit 0FFh _emit 015h
        /* g_101AE23C */ dword ptr [g_101AE23C]
        _emit 05Fh _emit 05Eh _emit 05Bh _emit 0C9h _emit 0C3h
    }
}
