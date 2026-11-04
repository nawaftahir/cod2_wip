extern int g_1010C188;
extern int g_101A50D0;
extern int g_1076AA30;
extern int g_1076AB44;

__declspec(naked) void setSBUpLow(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 081h _emit 0ECh _emit 018h _emit 005h _emit 000h _emit 000h _emit 0A1h
        /* g_101A50D0 */ dword ptr [g_101A50D0]
        _emit 089h _emit 045h _emit 0FCh _emit 056h _emit 08Dh _emit 045h _emit 0E8h _emit 050h _emit 0FFh _emit 035h
        /* g_1076AB44 */ dword ptr [g_1076AB44]
        _emit 0FFh _emit 015h
        /* g_1010C188 */ dword ptr [g_1010C188]
        _emit 083h _emit 0F8h _emit 001h _emit 0BEh _emit 000h _emit 001h _emit 000h _emit 000h _emit 00Fh _emit 085h _emit 00Dh _emit 001h _emit 000h _emit 000h _emit 033h _emit 0C0h _emit 088h _emit 084h _emit 005h _emit 0E8h _emit 0FEh _emit 0FFh _emit 0FFh _emit 040h _emit 03Bh _emit 0C6h _emit 072h _emit 0F4h _emit 08Ah _emit 045h _emit 0EEh _emit 084h _emit 0C0h _emit 0C6h _emit 085h _emit 0E8h _emit 0FEh _emit 0FFh _emit 0FFh _emit 020h _emit 074h _emit 036h _emit 053h _emit 08Dh _emit 055h _emit 0EFh _emit 057h _emit 00Fh _emit 0B6h _emit 00Ah _emit 00Fh _emit 0B6h _emit 0C0h _emit 03Bh _emit 0C1h _emit 077h _emit 01Dh _emit 02Bh _emit 0C8h _emit 041h _emit 08Bh _emit 0D9h _emit 0C1h _emit 0E9h _emit 002h _emit 08Dh _emit 0BCh _emit 005h _emit 0E8h _emit 0FEh _emit 0FFh _emit 0FFh _emit 0B8h _emit 020h _emit 020h _emit 020h _emit 020h _emit 0F3h _emit 0ABh _emit 08Bh _emit 0CBh _emit 083h _emit 0E1h _emit 003h _emit 0F3h _emit 0AAh _emit 042h _emit 08Ah _emit 002h _emit 042h _emit 084h _emit 0C0h _emit 075h _emit 0D1h _emit 05Fh _emit 05Bh _emit 06Ah _emit 000h _emit 0FFh _emit 035h
        /* g_1076AA30 */ dword ptr [g_1076AA30]
        _emit 08Dh _emit 085h _emit 0E8h _emit 0FAh _emit 0FFh _emit 0FFh _emit 0FFh _emit 035h
        /* g_1076AB44 */ dword ptr [g_1076AB44]
        _emit 050h _emit 056h _emit 08Dh _emit 085h _emit 0E8h _emit 0FEh _emit 0FFh _emit 0FFh _emit 050h _emit 06Ah _emit 001h _emit 0E8h _emit 07Fh _emit 0A0h _emit 0FFh _emit 0FFh _emit 06Ah _emit 000h _emit 0FFh _emit 035h
        /* g_1076AB44 */ dword ptr [g_1076AB44]
        _emit 08Dh _emit 085h _emit 0E8h _emit 0FDh _emit 0FFh _emit 0FFh _emit 056h _emit 050h _emit 056h _emit 08Dh _emit 085h _emit 0E8h _emit 0FEh _emit 0FFh _emit 0FFh _emit 050h _emit 056h _emit 0FFh _emit 035h
        /* g_1076AA30 */ dword ptr [g_1076AA30]
        _emit 0E8h _emit 08Ch _emit 063h _emit 0FFh _emit 0FFh _emit 06Ah _emit 000h _emit 0FFh _emit 035h
        /* g_1076AB44 */ dword ptr [g_1076AB44]
        _emit 08Dh _emit 085h _emit 0E8h _emit 0FCh _emit 0FFh _emit 0FFh _emit 056h _emit 050h _emit 056h _emit 08Dh _emit 085h _emit 0E8h _emit 0FEh _emit 0FFh _emit 0FFh _emit 050h _emit 068h _emit 000h _emit 002h _emit 000h _emit 000h _emit 0FFh _emit 035h
        /* g_1076AA30 */ dword ptr [g_1076AA30]
        _emit 0E8h _emit 064h _emit 063h _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 05Ch _emit 033h _emit 0C0h _emit 066h _emit 08Bh _emit 08Ch _emit 045h _emit 0E8h _emit 0FAh _emit 0FFh _emit 0FFh _emit 0F6h _emit 0C1h _emit 001h _emit 074h _emit 016h _emit 080h _emit 088h _emit 041h _emit 0AAh _emit 076h _emit 010h _emit 010h _emit 08Ah _emit 08Ch _emit 005h _emit 0E8h _emit 0FDh _emit 0FFh _emit 0FFh _emit 088h _emit 088h _emit 060h _emit 0ABh _emit 076h _emit 010h _emit 0EBh _emit 01Ch _emit 0F6h _emit 0C1h _emit 002h _emit 074h _emit 010h _emit 080h _emit 088h _emit 041h _emit 0AAh _emit 076h _emit 010h _emit 020h _emit 08Ah _emit 08Ch _emit 005h _emit 0E8h _emit 0FCh _emit 0FFh _emit 0FFh _emit 0EBh _emit 0E3h _emit 0C6h _emit 080h _emit 060h _emit 0ABh _emit 076h _emit 010h _emit 000h _emit 040h _emit 03Bh _emit 0C6h _emit 072h _emit 0BCh _emit 0EBh _emit 044h _emit 033h _emit 0C0h _emit 083h _emit 0F8h _emit 041h _emit 072h _emit 019h _emit 083h _emit 0F8h _emit 05Ah _emit 077h _emit 014h _emit 080h _emit 088h _emit 041h _emit 0AAh _emit 076h _emit 010h _emit 010h _emit 08Ah _emit 0C8h _emit 080h _emit 0C1h _emit 020h _emit 088h _emit 088h _emit 060h _emit 0ABh _emit 076h _emit 010h _emit 0EBh _emit 01Fh _emit 083h _emit 0F8h _emit 061h _emit 072h _emit 013h _emit 083h _emit 0F8h _emit 07Ah _emit 077h _emit 00Eh _emit 080h _emit 088h _emit 041h _emit 0AAh _emit 076h _emit 010h _emit 020h _emit 08Ah _emit 0C8h _emit 080h _emit 0E9h _emit 020h _emit 0EBh _emit 0E0h _emit 0C6h _emit 080h _emit 060h _emit 0ABh _emit 076h _emit 010h _emit 000h _emit 040h _emit 03Bh _emit 0C6h _emit 072h _emit 0BEh _emit 08Bh _emit 04Dh _emit 0FCh _emit 05Eh _emit 0E8h _emit 0D0h _emit 09Eh _emit 0FFh _emit 0FFh _emit 0C9h _emit 0C3h
    }
}
