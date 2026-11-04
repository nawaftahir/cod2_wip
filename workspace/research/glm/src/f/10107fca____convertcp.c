extern int g_1010C044;
extern int g_1010C13C;
extern int g_1010C188;
extern int g_101822B0;
extern int g_101A50D0;

__declspec(naked) void ___convertcp(void)
{
    __asm {
        _emit 06Ah _emit 038h _emit 068h
        /* g_101822B0 */ dword ptr [g_101822B0]
        _emit 0E8h _emit 03Ah _emit 036h _emit 0FFh _emit 0FFh _emit 0A1h
        /* g_101A50D0 */ dword ptr [g_101A50D0]
        _emit 089h _emit 045h _emit 0E4h _emit 033h _emit 0FFh _emit 089h _emit 07Dh _emit 0CCh _emit 089h _emit 07Dh _emit 0BCh _emit 08Bh _emit 045h _emit 014h _emit 08Bh _emit 018h _emit 089h _emit 05Dh _emit 0C0h _emit 089h _emit 07Dh _emit 0C4h _emit 08Bh _emit 045h _emit 008h _emit 03Bh _emit 045h _emit 00Ch _emit 00Fh _emit 084h _emit 073h _emit 001h _emit 000h _emit 000h _emit 08Dh _emit 04Dh _emit 0D0h _emit 051h _emit 050h _emit 08Bh _emit 035h
        /* g_1010C188 */ dword ptr [g_1010C188]
        _emit 0FFh _emit 0D6h _emit 085h _emit 0C0h _emit 074h _emit 020h _emit 083h _emit 07Dh _emit 0D0h _emit 001h _emit 075h _emit 01Ah _emit 08Dh _emit 045h _emit 0D0h _emit 050h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 0D6h _emit 085h _emit 0C0h _emit 074h _emit 00Dh _emit 083h _emit 07Dh _emit 0D0h _emit 001h _emit 075h _emit 007h _emit 0C7h _emit 045h _emit 0C4h _emit 001h _emit 000h _emit 000h _emit 000h _emit 039h _emit 07Dh _emit 0C4h _emit 074h _emit 01Ah _emit 083h _emit 0FBh _emit 0FFh _emit 074h _emit 004h _emit 08Bh _emit 0F3h _emit 0EBh _emit 00Ch _emit 0FFh _emit 075h _emit 010h _emit 0E8h _emit 0BCh _emit 021h _emit 0FFh _emit 0FFh _emit 059h _emit 08Bh _emit 0F0h _emit 046h _emit 089h _emit 075h _emit 0C8h _emit 0EBh _emit 003h _emit 08Bh _emit 075h _emit 0C8h _emit 039h _emit 07Dh _emit 0C4h _emit 075h _emit 01Ah _emit 057h _emit 057h _emit 053h _emit 0FFh _emit 075h _emit 010h _emit 06Ah _emit 001h _emit 0FFh _emit 075h _emit 008h _emit 0FFh _emit 015h
        /* g_1010C13C */ dword ptr [g_1010C13C]
        _emit 08Bh _emit 0F0h _emit 089h _emit 075h _emit 0C8h _emit 03Bh _emit 0F7h _emit 074h _emit 058h _emit 089h _emit 07Dh _emit 0FCh _emit 08Dh _emit 004h _emit 036h _emit 083h _emit 0C0h _emit 003h _emit 083h _emit 0E0h _emit 0FCh _emit 0E8h _emit 0B0h _emit 007h _emit 0FFh _emit 0FFh _emit 089h _emit 065h _emit 0E8h _emit 08Bh _emit 0DCh _emit 089h _emit 05Dh _emit 0B8h _emit 08Dh _emit 004h _emit 036h _emit 050h _emit 057h _emit 053h _emit 0E8h _emit 0ADh _emit 082h _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 00Ch _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0EBh _emit 017h _emit 033h _emit 0C0h _emit 040h _emit 0C3h _emit 08Bh _emit 065h _emit 0E8h _emit 0E8h _emit 031h _emit 0DFh _emit 0FFh _emit 0FFh _emit 033h _emit 0FFh _emit 033h _emit 0DBh _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 08Bh _emit 075h _emit 0C8h _emit 03Bh _emit 0DFh _emit 075h _emit 01Eh _emit 056h _emit 06Ah _emit 002h _emit 0E8h _emit 00Ah _emit 057h _emit 0FFh _emit 0FFh _emit 059h _emit 059h _emit 08Bh _emit 0D8h _emit 03Bh _emit 0DFh _emit 075h _emit 007h _emit 033h _emit 0C0h _emit 0E9h _emit 0B4h _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 045h _emit 0BCh _emit 001h _emit 000h _emit 000h _emit 000h _emit 056h _emit 053h _emit 0FFh _emit 075h _emit 0C0h _emit 0FFh _emit 075h _emit 010h _emit 06Ah _emit 001h _emit 0FFh _emit 075h _emit 008h _emit 0FFh _emit 015h
        /* g_1010C13C */ dword ptr [g_1010C13C]
        _emit 085h _emit 0C0h _emit 00Fh _emit 084h _emit 083h _emit 000h _emit 000h _emit 000h _emit 039h _emit 07Dh _emit 018h _emit 074h _emit 020h _emit 057h _emit 057h _emit 0FFh _emit 075h _emit 01Ch _emit 0FFh _emit 075h _emit 018h _emit 056h _emit 053h _emit 057h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 015h
        /* g_1010C044 */ dword ptr [g_1010C044]
        _emit 085h _emit 0C0h _emit 074h _emit 066h _emit 08Bh _emit 045h _emit 018h _emit 089h _emit 045h _emit 0CCh _emit 0EBh _emit 05Eh _emit 039h _emit 07Dh _emit 0C4h _emit 075h _emit 016h _emit 057h _emit 057h _emit 057h _emit 057h _emit 056h _emit 053h _emit 057h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 015h
        /* g_1010C044 */ dword ptr [g_1010C044]
        _emit 08Bh _emit 0F0h _emit 03Bh _emit 0F7h _emit 074h _emit 043h _emit 056h _emit 06Ah _emit 001h _emit 0E8h _emit 091h _emit 056h _emit 0FFh _emit 0FFh _emit 059h _emit 059h _emit 089h _emit 045h _emit 0CCh _emit 03Bh _emit 0C7h _emit 074h _emit 032h _emit 057h _emit 057h _emit 056h _emit 050h _emit 056h _emit 053h _emit 057h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 015h
        /* g_1010C044 */ dword ptr [g_1010C044]
        _emit 03Bh _emit 0C7h _emit 075h _emit 00Eh _emit 0FFh _emit 075h _emit 0CCh _emit 0E8h _emit 073h _emit 003h _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 07Dh _emit 0CCh _emit 0EBh _emit 010h _emit 083h _emit 07Dh _emit 0C0h _emit 0FFh _emit 074h _emit 00Ah _emit 08Bh _emit 04Dh _emit 014h _emit 089h _emit 001h _emit 0EBh _emit 003h _emit 08Bh _emit 05Dh _emit 0B8h _emit 039h _emit 07Dh _emit 0BCh _emit 074h _emit 007h _emit 053h _emit 0E8h _emit 052h _emit 003h
    }
}
