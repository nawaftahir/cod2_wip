extern int g_1017C87C;
extern int g_101A50D0;
extern int g_1076ADB0;
extern int g_1076ADB4;

__declspec(naked) void ___sse2_available_init(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 083h _emit 0ECh _emit 020h _emit 0A1h
        /* g_101A50D0 */ dword ptr [g_101A50D0]
        _emit 089h _emit 045h _emit 0FCh _emit 033h _emit 0C0h _emit 053h _emit 056h _emit 089h _emit 045h _emit 0E4h _emit 089h _emit 045h _emit 0E8h _emit 088h _emit 045h _emit 0ECh _emit 053h _emit 09Ch _emit 058h _emit 08Bh _emit 0C8h _emit 035h _emit 000h _emit 000h _emit 020h _emit 000h _emit 050h _emit 09Dh _emit 09Ch _emit 05Ah _emit 02Bh _emit 0D1h _emit 074h _emit 01Fh _emit 051h _emit 09Dh _emit 033h _emit 0C0h _emit 00Fh _emit 0A2h _emit 089h _emit 045h _emit 0E0h _emit 089h _emit 05Dh _emit 0ECh _emit 089h _emit 055h _emit 0F0h _emit 089h _emit 04Dh _emit 0F4h _emit 0B8h _emit 001h _emit 000h _emit 000h _emit 000h _emit 00Fh _emit 0A2h _emit 089h _emit 055h _emit 0E4h _emit 089h _emit 045h _emit 0E8h _emit 05Bh _emit 083h _emit 025h _emit 0B4h
        /* g_1076ADB4 */ dword ptr [g_1076ADB4]
        _emit 083h _emit 025h _emit 0B0h
        /* g_1076ADB0 */ dword ptr [g_1076ADB0]
        _emit 0F6h _emit 045h _emit 0E7h _emit 004h _emit 074h _emit 05Fh _emit 0E8h _emit 065h _emit 0FFh _emit 0FFh _emit 0FFh _emit 085h _emit 0C0h _emit 074h _emit 056h _emit 06Ah _emit 00Ch _emit 08Dh _emit 045h _emit 0ECh _emit 033h _emit 0F6h _emit 050h _emit 046h _emit 068h
        /* g_1017C87C */ dword ptr [g_1017C87C]
        _emit 089h _emit 035h
        /* g_1076ADB4 */ dword ptr [g_1076ADB4]
        _emit 0E8h _emit 035h _emit 055h _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 085h _emit 0C0h _emit 075h _emit 030h _emit 08Bh _emit 04Dh _emit 0E8h _emit 08Bh _emit 0C1h _emit 0C1h _emit 0F8h _emit 008h _emit 083h _emit 0E0h _emit 00Fh _emit 0C1h _emit 0F9h _emit 014h _emit 08Bh _emit 0D0h _emit 083h _emit 0EAh _emit 00Fh _emit 081h _emit 0E1h _emit 0FFh _emit 000h _emit 000h _emit 000h _emit 0F7h _emit 0DAh _emit 01Bh _emit 0D2h _emit 0F7h _emit 0D2h _emit 023h _emit 0D1h _emit 003h _emit 0D0h _emit 083h _emit 0EAh _emit 00Fh _emit 0F7h _emit 0DAh _emit 01Bh _emit 0D2h _emit 042h _emit 089h _emit 055h _emit 0E0h _emit 075h _emit 006h _emit 089h _emit 035h
        /* g_1076ADB0 */ dword ptr [g_1076ADB0]
        _emit 08Bh _emit 04Dh _emit 0FCh _emit 033h _emit 0C0h _emit 0E8h _emit 05Bh _emit 052h _emit 000h _emit 000h _emit 05Eh _emit 05Bh _emit 0C9h _emit 0C3h
    }
}
