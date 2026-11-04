extern int g_101ADD80;
extern int g_101AE02C;
extern int g_1076ADA0;
extern int g_1076ADAC;

__declspec(naked) void __setenvp(void)
{
    __asm {
        _emit 053h _emit 033h _emit 0DBh _emit 039h _emit 01Dh
        /* g_1076ADAC */ dword ptr [g_1076ADAC]
        _emit 056h _emit 057h _emit 075h _emit 005h _emit 0E8h _emit 0FEh _emit 096h _emit 000h _emit 000h _emit 08Bh _emit 035h
        /* g_101ADD80 */ dword ptr [g_101ADD80]
        _emit 033h _emit 0FFh _emit 03Bh _emit 0F3h _emit 075h _emit 012h _emit 0EBh _emit 030h _emit 03Ch _emit 03Dh _emit 074h _emit 001h _emit 047h _emit 056h _emit 0E8h _emit 007h _emit 0C7h _emit 0FFh _emit 0FFh _emit 059h _emit 08Dh _emit 074h _emit 006h _emit 001h _emit 08Ah _emit 006h _emit 03Ah _emit 0C3h _emit 075h _emit 0EAh _emit 08Dh _emit 004h _emit 0BDh _emit 004h _emit 000h _emit 000h _emit 000h _emit 050h _emit 0E8h _emit 053h _emit 0E9h _emit 0FFh _emit 0FFh _emit 08Bh _emit 0F8h _emit 03Bh _emit 0FBh _emit 059h _emit 089h _emit 03Dh
        /* g_101AE02C */ dword ptr [g_101AE02C]
        _emit 075h _emit 005h _emit 083h _emit 0C8h _emit 0FFh _emit 0EBh _emit 058h _emit 08Bh _emit 035h
        /* g_101ADD80 */ dword ptr [g_101ADD80]
        _emit 055h _emit 0EBh _emit 02Ah _emit 056h _emit 0E8h _emit 0CEh _emit 0C6h _emit 0FFh _emit 0FFh _emit 08Bh _emit 0E8h _emit 045h _emit 080h _emit 03Eh _emit 03Dh _emit 059h _emit 074h _emit 019h _emit 055h _emit 0E8h _emit 023h _emit 0E9h _emit 0FFh _emit 0FFh _emit 03Bh _emit 0C3h _emit 059h _emit 089h _emit 007h _emit 074h _emit 037h _emit 056h _emit 050h _emit 0E8h _emit 041h _emit 00Dh _emit 000h _emit 000h _emit 059h _emit 059h _emit 083h _emit 0C7h _emit 004h _emit 003h _emit 0F5h _emit 038h _emit 01Eh _emit 075h _emit 0D2h _emit 0FFh _emit 035h
        /* g_101ADD80 */ dword ptr [g_101ADD80]
        _emit 0E8h _emit 06Bh _emit 0A9h _emit 0FFh _emit 0FFh _emit 089h _emit 01Dh
        /* g_101ADD80 */ dword ptr [g_101ADD80]
        _emit 089h _emit 01Fh _emit 0C7h _emit 005h _emit 0A0h _emit 0ADh _emit 076h _emit 010h
        /* g_1076ADA0 */ dword ptr [g_1076ADA0]
        _emit 033h _emit 0C0h _emit 059h _emit 05Dh _emit 05Fh _emit 05Eh _emit 05Bh _emit 0C3h _emit 0FFh _emit 035h
        /* g_101AE02C */ dword ptr [g_101AE02C]
        _emit 0E8h _emit 046h _emit 0A9h _emit 0FFh _emit 0FFh _emit 089h _emit 01Dh
        /* g_101AE02C */ dword ptr [g_101AE02C]
        _emit 083h _emit 0C8h _emit 0FFh _emit 0EBh _emit 0E4h
    }
}
