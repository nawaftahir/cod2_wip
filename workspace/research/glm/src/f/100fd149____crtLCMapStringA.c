extern int g_1010C044;
extern int g_1010C054;
extern int g_1010C138;
extern int g_1010C13C;
extern int g_1010C140;
extern int g_1017C96C;
extern int g_1017C970;
extern int g_101AE004;
extern int g_101AE198;
extern int g_101AE1A8;

__declspec(naked) void ___crtLCMapStringA(void)
{
    __asm {
        _emit 06Ah _emit 038h _emit 068h
        /* g_1017C970 */ dword ptr [g_1017C970]
        _emit 0E8h _emit 0BBh _emit 0E4h _emit 0FFh _emit 0FFh _emit 033h _emit 0DBh _emit 039h _emit 01Dh
        /* g_101AE004 */ dword ptr [g_101AE004]
        _emit 075h _emit 038h _emit 053h _emit 053h _emit 033h _emit 0F6h _emit 046h _emit 056h _emit 068h
        /* g_1017C96C */ dword ptr [g_1017C96C]
        _emit 068h _emit 000h _emit 001h _emit 000h _emit 000h _emit 053h _emit 0FFh _emit 015h
        /* g_1010C140 */ dword ptr [g_1010C140]
        _emit 085h _emit 0C0h _emit 074h _emit 008h _emit 089h _emit 035h
        /* g_101AE004 */ dword ptr [g_101AE004]
        _emit 0EBh _emit 015h _emit 0FFh _emit 015h
        /* g_1010C054 */ dword ptr [g_1010C054]
        _emit 083h _emit 0F8h _emit 078h _emit 075h _emit 00Ah _emit 0C7h _emit 005h _emit 004h _emit 0E0h _emit 01Ah _emit 010h
        /* g_101AE004 */ dword ptr [g_101AE004]
        _emit 039h _emit 05Dh _emit 014h _emit 07Eh _emit 01Bh _emit 08Bh _emit 04Dh _emit 014h _emit 08Bh _emit 045h _emit 010h _emit 049h _emit 038h _emit 018h _emit 074h _emit 008h _emit 040h _emit 03Bh _emit 0CBh _emit 075h _emit 0F6h _emit 083h _emit 0C9h _emit 0FFh _emit 083h _emit 0C8h _emit 0FFh _emit 02Bh _emit 0C1h _emit 001h _emit 045h _emit 014h _emit 0A1h
        /* g_101AE004 */ dword ptr [g_101AE004]
        _emit 083h _emit 0F8h _emit 002h _emit 00Fh _emit 084h _emit 0DCh _emit 001h _emit 000h _emit 000h _emit 03Bh _emit 0C3h _emit 00Fh _emit 084h _emit 0D4h _emit 001h _emit 000h _emit 000h _emit 083h _emit 0F8h _emit 001h _emit 00Fh _emit 085h _emit 0FEh _emit 001h _emit 000h _emit 000h _emit 033h _emit 0FFh _emit 089h _emit 07Dh _emit 0D4h _emit 089h _emit 05Dh _emit 0C8h _emit 089h _emit 05Dh _emit 0CCh _emit 039h _emit 05Dh _emit 020h _emit 075h _emit 008h _emit 0A1h
        /* g_101AE1A8 */ dword ptr [g_101AE1A8]
        _emit 089h _emit 045h _emit 020h _emit 053h _emit 053h _emit 0FFh _emit 075h _emit 014h _emit 0FFh _emit 075h _emit 010h _emit 033h _emit 0C0h _emit 039h _emit 05Dh _emit 024h _emit 00Fh _emit 095h _emit 0C0h _emit 08Dh _emit 004h _emit 0C5h _emit 001h _emit 000h _emit 000h _emit 000h _emit 050h _emit 0FFh _emit 075h _emit 020h _emit 0FFh _emit 015h
        /* g_1010C13C */ dword ptr [g_1010C13C]
        _emit 08Bh _emit 0F0h _emit 089h _emit 075h _emit 0D0h _emit 03Bh _emit 0F3h _emit 00Fh _emit 084h _emit 0B8h _emit 001h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0FCh _emit 001h _emit 000h _emit 000h _emit 000h _emit 08Dh _emit 004h _emit 036h _emit 083h _emit 0C0h _emit 003h _emit 083h _emit 0E0h _emit 0FCh _emit 0E8h _emit 0FFh _emit 0B5h _emit 0FFh _emit 0FFh _emit 089h _emit 065h _emit 0E8h _emit 08Bh _emit 0C4h _emit 089h _emit 045h _emit 0E4h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0EBh _emit 01Bh _emit 033h _emit 0C0h _emit 040h _emit 0C3h _emit 08Bh _emit 065h _emit 0E8h _emit 0E8h _emit 08Eh _emit 08Dh _emit 000h _emit 000h _emit 033h _emit 0DBh _emit 089h _emit 05Dh _emit 0E4h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 08Bh _emit 07Dh _emit 0D4h _emit 08Bh _emit 075h _emit 0D0h _emit 039h _emit 05Dh _emit 0E4h _emit 075h _emit 01Ch _emit 08Dh _emit 004h _emit 036h _emit 050h _emit 0E8h _emit 0FCh _emit 0F1h _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 045h _emit 0E4h _emit 03Bh _emit 0C3h _emit 00Fh _emit 084h _emit 060h _emit 001h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0C8h _emit 001h _emit 000h _emit 000h _emit 000h _emit 056h _emit 0FFh _emit 075h _emit 0E4h _emit 0FFh _emit 075h _emit 014h _emit 0FFh _emit 075h _emit 010h _emit 06Ah _emit 001h _emit 0FFh _emit 075h _emit 020h _emit 0FFh _emit 015h
        /* g_1010C13C */ dword ptr [g_1010C13C]
        _emit 085h _emit 0C0h _emit 00Fh _emit 084h _emit 0E6h _emit 000h _emit 000h _emit 000h _emit 053h _emit 053h _emit 056h _emit 0FFh _emit 075h _emit 0E4h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 008h _emit 0FFh _emit 015h
        /* g_1010C140 */ dword ptr [g_1010C140]
        _emit 08Bh _emit 0F8h _emit 089h _emit 07Dh _emit 0D4h _emit 03Bh _emit 0FBh _emit 00Fh _emit 084h _emit 0C7h _emit 000h _emit 000h _emit 000h _emit 0F6h _emit 045h _emit 00Dh _emit 004h _emit 074h _emit 02Dh _emit 039h _emit 05Dh _emit 01Ch _emit 00Fh _emit 084h _emit 0B8h _emit 000h _emit 000h _emit 000h _emit 03Bh _emit 07Dh _emit 01Ch _emit 00Fh _emit 08Fh _emit 0AFh _emit 000h _emit 000h _emit 000h _emit 0FFh _emit 075h _emit 01Ch _emit 0FFh _emit 075h _emit 018h _emit 056h _emit 0FFh _emit 075h _emit 0E4h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 008h _emit 0FFh _emit 015h
        /* g_1010C140 */ dword ptr [g_1010C140]
        _emit 0E9h _emit 094h _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0FCh _emit 002h _emit 000h _emit 000h _emit 000h _emit 08Dh _emit 004h _emit 03Fh _emit 083h _emit 0C0h _emit 003h _emit 083h _emit 0E0h _emit 0FCh _emit 0E8h _emit 031h _emit 0B5h _emit 0FFh _emit 0FFh _emit 089h _emit 065h _emit 0E8h _emit 08Bh _emit 0C4h _emit 089h _emit 045h _emit 0E0h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0EBh _emit 01Bh _emit 033h _emit 0C0h _emit 040h _emit 0C3h _emit 08Bh _emit 065h _emit 0E8h _emit 0E8h _emit 0C0h _emit 08Ch _emit 000h _emit 000h _emit 033h _emit 0DBh _emit 089h _emit 05Dh _emit 0E0h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 08Bh _emit 07Dh _emit 0D4h _emit 08Bh _emit 075h _emit 0D0h _emit 039h _emit 05Dh _emit 0E0h _emit 075h _emit 018h _emit 08Dh _emit 004h _emit 03Fh _emit 050h _emit 0E8h _emit 02Eh _emit 0F1h _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 045h _emit 0E0h _emit 03Bh _emit 0C3h _emit 074h _emit 040h _emit 0C7h _emit 045h _emit 0CCh _emit 001h _emit 000h _emit 000h _emit 000h _emit 057h _emit 0FFh _emit 075h _emit 0E0h _emit 056h _emit 0FFh _emit 075h _emit 0E4h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 008h _emit 0FFh _emit 015h
        /* g_1010C140 */ dword ptr [g_1010C140]
        _emit 085h _emit 0C0h _emit 074h _emit 021h _emit 053h _emit 053h _emit 039h _emit 05Dh _emit 01Ch _emit 075h _emit 004h _emit 053h _emit 053h _emit 0EBh _emit 006h _emit 0FFh _emit 075h _emit 01Ch _emit 0FFh _emit 075h _emit 018h _emit 057h _emit 0FFh _emit 075h _emit 0E0h _emit 053h _emit 0FFh _emit 075h _emit 020h _emit 0FFh _emit 015h
        /* g_1010C044 */ dword ptr [g_1010C044]
        _emit 08Bh _emit 0F8h _emit 039h _emit 05Dh _emit 0CCh _emit 074h _emit 009h _emit 0FFh _emit 075h _emit 0E0h _emit 0E8h _emit 045h _emit 0B1h _emit 0FFh _emit 0FFh _emit 059h _emit 039h _emit 05Dh _emit 0C8h _emit 074h _emit 009h _emit 0FFh _emit 075h _emit 0E4h _emit 0E8h _emit 037h _emit 0B1h _emit 0FFh _emit 0FFh _emit 059h _emit 08Bh _emit 0C7h _emit 0E9h _emit 05Bh _emit 001h _emit 000h _emit 000h _emit 089h _emit 05Dh _emit 0D8h _emit 033h _emit 0FFh _emit 089h _emit 05Dh _emit 0C4h _emit 039h _emit 05Dh _emit 008h _emit 075h _emit 008h _emit 0A1h
        /* g_101AE198 */ dword ptr [g_101AE198]
        _emit 089h _emit 045h _emit 008h _emit 039h _emit 05Dh _emit 020h _emit 075h _emit 008h _emit 0A1h
        /* g_101AE1A8 */ dword ptr [g_101AE1A8]
        _emit 089h _emit 045h _emit 020h _emit 0FFh _emit 075h _emit 008h _emit 0E8h _emit 0BCh _emit 0ABh _emit 000h _emit 000h _emit 059h _emit 089h _emit 045h _emit 0C0h _emit 083h _emit 0F8h _emit 0FFh _emit 075h _emit 007h _emit 033h _emit 0C0h _emit 0E9h _emit 021h _emit 001h _emit 000h _emit 000h _emit 03Bh _emit 045h _emit 020h _emit 00Fh _emit 084h _emit 0EEh _emit 000h _emit 000h _emit 000h _emit 053h _emit 053h _emit 08Dh _emit 04Dh _emit 014h _emit 051h _emit 0FFh _emit 075h _emit 010h _emit 050h _emit 0FFh _emit 075h _emit 020h _emit 0E8h _emit 0D4h _emit 0ABh _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 018h _emit 089h _emit 045h _emit 0D8h _emit 03Bh _emit 0C3h _emit 074h _emit 0D4h _emit 053h _emit 053h _emit 0FFh _emit 075h _emit 014h _emit 050h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 008h _emit 0FFh _emit 015h
        /* g_1010C138 */ dword ptr [g_1010C138]
        _emit 08Bh _emit 0F0h _emit 089h _emit 075h _emit 0DCh _emit 03Bh _emit 0F3h _emit 00Fh _emit 084h _emit 0A2h _emit 000h _emit 000h _emit 000h _emit 089h _emit 05Dh _emit 0FCh _emit 083h _emit 0C0h _emit 003h _emit 083h _emit 0E0h _emit 0FCh _emit 0E8h _emit 003h _emit 0B4h _emit 0FFh _emit 0FFh _emit 089h _emit 065h _emit 0E8h _emit 08Bh _emit 0FCh _emit 089h _emit 07Dh _emit 0BCh _emit 056h _emit 053h _emit 057h _emit 0E8h _emit 003h _emit 02Fh _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 0EBh _emit 010h _emit 033h _emit 0C0h _emit 040h _emit 0C3h _emit 08Bh _emit 065h _emit 0E8h _emit 0E8h _emit 08Bh _emit 08Bh _emit 000h _emit 000h _emit 033h _emit 0DBh _emit 033h _emit 0FFh _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 03Bh _emit 0FBh _emit 075h _emit 023h _emit 0FFh _emit 075h _emit 0DCh _emit 0E8h _emit 002h _emit 0F0h _emit 0FFh _emit 0FFh _emit 059h _emit 08Bh _emit 0F8h _emit 03Bh _emit 0FBh _emit 074h _emit 031h _emit 0FFh _emit 075h _emit 0DCh _emit 053h _emit 057h _emit 0E8h _emit 0CDh _emit 02Eh _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 0C7h _emit 045h _emit 0C4h _emit 001h _emit 000h _emit 000h _emit 000h _emit 0FFh _emit 075h _emit 0DCh _emit 057h _emit 0FFh _emit 075h _emit 014h _emit 0FFh _emit 075h _emit 0D8h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 008h _emit 0FFh _emit 015h
        /* g_1010C138 */ dword ptr [g_1010C138]
        _emit 089h _emit 045h _emit 0DCh _emit 03Bh _emit 0C3h _emit 075h _emit 004h _emit 033h _emit 0F6h _emit 0EBh _emit 026h _emit 0FFh _emit 075h _emit 01Ch _emit 0FFh _emit 075h _emit 018h _emit 08Dh _emit 045h _emit 0DCh _emit 050h _emit 057h _emit 0FFh _emit 075h _emit 020h _emit 0FFh _emit 075h _emit 0C0h _emit 0E8h _emit 016h _emit 0ABh _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 018h _emit 08Bh _emit 0F0h _emit 0F7h _emit 0DEh _emit 01Bh _emit 0F6h _emit 0F7h _emit 0DEh
    }
}
