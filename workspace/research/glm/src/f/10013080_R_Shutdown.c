extern int g_10020330;
extern int g_101AE4B8;
extern int g_101D0B04;
extern int g_101D1B9C;
extern int g_101D1BF8;
extern int g_101D492C;
extern int g_101D4A50;
extern int g_101D4B80;
extern int g_101D4C6C;
extern int g_101D4D00;
extern int g_101D4D28;
extern int g_101D7EB0;
extern int g_101D7FC8;
extern int g_1042E778;
extern int g_10678498;
extern int g_10766750;
extern int g_10766754;
extern int g_10766758;
extern int g_1076A82C;
extern int g_1076A830;

__declspec(naked) void R_Shutdown(void)
{
    __asm {
        _emit 0A1h
        /* g_101D1BF8 */ dword ptr [g_101D1BF8]
        _emit 053h _emit 033h _emit 0DBh _emit 03Bh _emit 0C3h _emit 056h _emit 057h _emit 088h _emit 01Dh
        /* g_101D4D00 */ dword ptr [g_101D4D00]
        _emit 074h _emit 02Fh _emit 038h _emit 01Dh
        /* g_101D492C */ dword ptr [g_101D492C]
        _emit 075h _emit 027h _emit 039h _emit 01Dh
        /* g_10766750 */ dword ptr [g_10766750]
        _emit 075h _emit 010h _emit 039h _emit 01Dh
        /* g_10766754 */ dword ptr [g_10766754]
        _emit 075h _emit 008h _emit 039h _emit 01Dh
        /* g_10766758 */ dword ptr [g_10766758]
        _emit 074h _emit 00Fh _emit 053h _emit 033h _emit 0FFh _emit 033h _emit 0DBh _emit 033h _emit 0F6h _emit 0E8h _emit 060h _emit 0BCh _emit 002h _emit 000h _emit 083h _emit 0C4h _emit 004h _emit 0BEh
        /* g_10678498 */ dword ptr [g_10678498]
        _emit 0E8h _emit 053h _emit 027h _emit 0FFh _emit 0FFh _emit 0BEh
        /* g_101AE4B8 */ dword ptr [g_101AE4B8]
        _emit 0E8h _emit 049h _emit 027h _emit 0FFh _emit 0FFh _emit 0E8h _emit 0B4h _emit 046h _emit 002h _emit 000h _emit 0A1h
        /* g_101D1B9C */ dword ptr [g_101D1B9C]
        _emit 03Bh _emit 0C3h _emit 089h _emit 01Dh
        /* g_101D7EB0 */ dword ptr [g_101D7EB0]
        _emit 074h _emit 028h _emit 08Bh _emit 040h _emit 030h _emit 03Bh _emit 0C3h _emit 074h _emit 01Bh _emit 08Bh _emit 008h _emit 050h _emit 0FFh _emit 051h _emit 008h _emit 08Bh _emit 00Dh
        /* g_1076A830 */ dword ptr [g_1076A830]
        _emit 033h _emit 0C0h _emit 03Bh _emit 0CBh _emit 075h _emit 0EEh _emit 08Bh _emit 015h
        /* g_101D1B9C */ dword ptr [g_101D1B9C]
        _emit 089h _emit 05Ah _emit 030h _emit 089h _emit 01Dh
        /* g_101D1B9C */ dword ptr [g_101D1B9C]
        _emit 06Ah _emit 001h _emit 053h _emit 068h
        /* g_10020330 */ dword ptr [g_10020330]
        _emit 06Ah _emit 001h _emit 089h _emit 01Dh
        /* g_1076A82C */ dword ptr [g_1076A82C]
        _emit 0FFh _emit 015h
        /* g_101D4B80 */ dword ptr [g_101D4B80]
        _emit 083h _emit 0C4h _emit 010h _emit 0E8h _emit 00Fh _emit 044h _emit 000h _emit 000h _emit 033h _emit 0C0h _emit 0B9h _emit 067h _emit 00Ah _emit 000h _emit 000h _emit 0BFh
        /* g_101D7FC8 */ dword ptr [g_101D7FC8]
        _emit 0F3h _emit 0ABh _emit 0B9h _emit 000h _emit 004h _emit 000h _emit 000h _emit 0BFh
        /* g_101D4D28 */ dword ptr [g_101D4D28]
        _emit 0F3h _emit 0ABh _emit 089h _emit 01Dh
        /* g_101D0B04 */ dword ptr [g_101D0B04]
        _emit 0E8h _emit 0BAh _emit 09Bh _emit 0FFh _emit 0FFh _emit 089h _emit 01Dh
        /* g_101D1B9C */ dword ptr [g_101D1B9C]
        _emit 0E8h _emit 0DFh _emit 0B3h _emit 000h _emit 000h _emit 0E8h _emit 08Ah _emit 089h _emit 001h _emit 000h _emit 08Bh _emit 044h _emit 024h _emit 010h _emit 05Fh _emit 05Eh _emit 03Bh _emit 0C3h _emit 05Bh _emit 074h _emit 013h _emit 0E8h _emit 03Ah _emit 0FCh _emit 0FFh _emit 0FFh _emit 068h _emit 000h _emit 020h _emit 000h _emit 000h _emit 0FFh _emit 015h
        /* g_101D4A50 */ dword ptr [g_101D4A50]
        _emit 083h _emit 0C4h _emit 004h _emit 0E9h _emit 0D7h _emit 021h _emit 0FFh _emit 0FFh _emit 0CCh _emit 0CCh _emit 0CCh _emit 0CCh _emit 0CCh _emit 0CCh _emit 0CCh _emit 056h _emit 057h _emit 0E8h _emit 0E9h _emit 0FDh _emit 0FFh _emit 0FFh _emit 08Bh _emit 07Ch _emit 024h _emit 00Ch _emit 0B9h _emit 00Bh _emit 000h _emit 000h _emit 000h _emit 0BEh
        /* g_101D4C6C */ dword ptr [g_101D4C6C]
        _emit 0F3h _emit 0A5h _emit 05Fh _emit 05Eh _emit 0C3h _emit 0CCh _emit 0CCh _emit 0CCh _emit 0CCh _emit 0CCh _emit 0CCh _emit 0A1h
        /* g_1042E778 */ dword ptr [g_1042E778]
        _emit 08Bh _emit 090h _emit 000h _emit 000h _emit 003h _emit 000h _emit 056h _emit 08Bh _emit 0B0h _emit 004h _emit 000h _emit 003h _emit 000h _emit 0B9h _emit 000h _emit 000h _emit 003h _emit 000h _emit 02Bh _emit 0CAh _emit 08Dh _emit 08Ch _emit 031h _emit 000h _emit 0E0h _emit 0FFh _emit 0FFh _emit 083h _emit 0F9h _emit 004h _emit 05Eh _emit 07Dh _emit 00Bh _emit 0C7h _emit 080h _emit 008h _emit 000h _emit 003h _emit 000h _emit 000h _emit 000h _emit 000h _emit 000h _emit 0C3h _emit 08Dh _emit 00Ch _emit 002h _emit 083h _emit 0C2h _emit 004h _emit 089h _emit 090h _emit 000h _emit 000h _emit 003h _emit 000h _emit 089h _emit 088h _emit 008h _emit 000h _emit 003h _emit 000h _emit 066h _emit 0C7h _emit 001h _emit 021h _emit 000h _emit 066h _emit 0C7h _emit 041h
    }
}
