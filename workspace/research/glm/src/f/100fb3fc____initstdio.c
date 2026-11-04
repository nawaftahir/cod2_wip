extern int g_101A48A0;
extern int g_101A48B0;
extern int g_101A4910;
extern int g_101A4B20;
extern int g_1076ADB8;
extern int g_1076BDC0;

__declspec(naked) void ___initstdio(void)
{
    __asm {
        _emit 0A1h
        /* g_1076BDC0 */ dword ptr [g_1076BDC0]
        _emit 085h _emit 0C0h _emit 056h _emit 06Ah _emit 014h _emit 05Eh _emit 075h _emit 007h _emit 0B8h _emit 000h _emit 002h _emit 000h _emit 000h _emit 0EBh _emit 006h _emit 03Bh _emit 0C6h _emit 07Dh _emit 007h _emit 08Bh _emit 0C6h _emit 0A3h
        /* g_1076BDC0 */ dword ptr [g_1076BDC0]
        _emit 06Ah _emit 004h _emit 050h _emit 0E8h _emit 0A6h _emit 023h _emit 000h _emit 000h _emit 085h _emit 0C0h _emit 059h _emit 059h _emit 0A3h
        /* g_1076ADB8 */ dword ptr [g_1076ADB8]
        _emit 075h _emit 01Eh _emit 06Ah _emit 004h _emit 056h _emit 089h _emit 035h
        /* g_1076BDC0 */ dword ptr [g_1076BDC0]
        _emit 0E8h _emit 08Dh _emit 023h _emit 000h _emit 000h _emit 085h _emit 0C0h _emit 059h _emit 059h _emit 0A3h
        /* g_1076ADB8 */ dword ptr [g_1076ADB8]
        _emit 075h _emit 005h _emit 06Ah _emit 01Ah _emit 058h _emit 05Eh _emit 0C3h _emit 033h _emit 0D2h _emit 0B9h
        /* g_101A48A0 */ dword ptr [g_101A48A0]
        _emit 0EBh _emit 005h _emit 0A1h
        /* g_1076ADB8 */ dword ptr [g_1076ADB8]
        _emit 089h _emit 00Ch _emit 002h _emit 083h _emit 0C1h _emit 020h _emit 083h _emit 0C2h _emit 004h _emit 081h _emit 0F9h
        /* g_101A4B20 */ dword ptr [g_101A4B20]
        _emit 07Ch _emit 0EAh _emit 033h _emit 0C9h _emit 0BAh
        /* g_101A48B0 */ dword ptr [g_101A48B0]
        _emit 08Bh _emit 0F1h _emit 08Bh _emit 0C1h _emit 083h _emit 0E0h _emit 01Fh _emit 0C1h _emit 0FEh _emit 005h _emit 08Bh _emit 034h _emit 0B5h _emit 0A0h _emit 0ACh _emit 076h _emit 010h _emit 08Dh _emit 004h _emit 0C0h _emit 08Bh _emit 004h _emit 086h _emit 083h _emit 0F8h _emit 0FFh _emit 074h _emit 004h _emit 085h _emit 0C0h _emit 075h _emit 003h _emit 083h _emit 00Ah _emit 0FFh _emit 083h _emit 0C2h _emit 020h _emit 041h _emit 081h _emit 0FAh
        /* g_101A4910 */ dword ptr [g_101A4910]
        _emit 07Ch _emit 0D1h _emit 033h _emit 0C0h _emit 05Eh _emit 0C3h
    }
}
