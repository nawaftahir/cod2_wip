extern int g_101A50D0;
extern int g_101A5630;
extern int g_101A5790;

__declspec(naked) void ___multtenpow12(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 083h _emit 0ECh _emit 010h _emit 0A1h
        /* g_101A50D0 */ dword ptr [g_101A50D0]
        _emit 053h _emit 0BBh
        /* g_101A5630 */ dword ptr [g_101A5630]
        _emit 033h _emit 0C9h _emit 083h _emit 0EBh _emit 060h _emit 039h _emit 04Dh _emit 00Ch _emit 089h _emit 045h _emit 0FCh _emit 074h _emit 05Dh _emit 07Dh _emit 00Bh _emit 0F7h _emit 05Dh _emit 00Ch _emit 0BBh
        /* g_101A5790 */ dword ptr [g_101A5790]
        _emit 083h _emit 0EBh _emit 060h _emit 039h _emit 04Dh _emit 010h _emit 075h _emit 006h _emit 08Bh _emit 045h _emit 008h _emit 066h _emit 089h _emit 008h _emit 039h _emit 04Dh _emit 00Ch _emit 074h _emit 040h _emit 056h _emit 057h _emit 08Bh _emit 045h _emit 00Ch _emit 0C1h _emit 07Dh _emit 00Ch _emit 003h _emit 083h _emit 0E0h _emit 007h _emit 083h _emit 0C3h _emit 054h _emit 03Bh _emit 0C1h _emit 074h _emit 026h _emit 08Dh _emit 004h _emit 040h _emit 08Dh _emit 034h _emit 083h _emit 066h _emit 081h _emit 03Eh _emit 000h _emit 080h _emit 072h _emit 00Ch _emit 08Dh _emit 07Dh _emit 0F0h _emit 0A5h _emit 0A5h _emit 0A5h _emit 0FFh _emit 04Dh _emit 0F2h _emit 08Dh _emit 075h _emit 0F0h _emit 056h _emit 0FFh _emit 075h _emit 008h _emit 0E8h _emit 05Eh _emit 0FDh _emit 0FFh _emit 0FFh _emit 059h _emit 059h _emit 033h _emit 0C9h _emit 039h _emit 04Dh _emit 00Ch _emit 075h _emit 0C4h _emit 05Fh _emit 05Eh _emit 08Bh _emit 04Dh _emit 0FCh _emit 05Bh _emit 0E8h _emit 038h _emit 07Ah _emit 0FFh _emit 0FFh _emit 0C9h _emit 0C3h
    }
}
