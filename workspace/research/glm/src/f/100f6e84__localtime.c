extern int g_101A4DB0;
extern int g_101A4DB4;
extern int g_101A4DB8;

__declspec(naked) void _localtime(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 056h _emit 08Bh _emit 075h _emit 008h _emit 083h _emit 03Eh _emit 000h _emit 07Dh _emit 007h _emit 033h _emit 0C0h _emit 0E9h _emit 032h _emit 001h _emit 000h _emit 000h _emit 0E8h _emit 0C1h _emit 05Bh _emit 000h _emit 000h _emit 08Bh _emit 006h _emit 03Dh _emit 080h _emit 0F4h _emit 003h _emit 000h _emit 07Eh _emit 058h _emit 03Dh _emit 07Fh _emit 00Bh _emit 0FCh _emit 07Fh _emit 07Dh _emit 051h _emit 02Bh _emit 005h
        /* g_101A4DB0 */ dword ptr [g_101A4DB0]
        _emit 089h _emit 045h _emit 008h _emit 08Dh _emit 045h _emit 008h _emit 050h _emit 0E8h _emit 05Eh _emit 05Ch _emit 000h _emit 000h _emit 083h _emit 03Dh _emit 0B4h
        /* g_101A4DB4 */ dword ptr [g_101A4DB4]
        _emit 059h _emit 08Bh _emit 0F0h _emit 00Fh _emit 084h _emit 0F9h _emit 000h _emit 000h _emit 000h _emit 056h _emit 0E8h _emit 00Ah _emit 05Ch _emit 000h _emit 000h _emit 085h _emit 0C0h _emit 059h _emit 00Fh _emit 084h _emit 0EAh _emit 000h _emit 000h _emit 000h _emit 0A1h
        /* g_101A4DB8 */ dword ptr [g_101A4DB8]
        _emit 029h _emit 045h _emit 008h _emit 08Dh _emit 045h _emit 008h _emit 050h _emit 0E8h _emit 02Eh _emit 05Ch _emit 000h _emit 000h _emit 08Bh _emit 0F0h _emit 059h _emit 0C7h _emit 046h _emit 020h _emit 001h _emit 000h _emit 000h _emit 000h _emit 0E9h _emit 0CAh _emit 000h _emit 000h _emit 000h _emit 056h _emit 0E8h _emit 019h _emit 05Ch _emit 000h _emit 000h _emit 083h _emit 03Dh _emit 0B4h
        /* g_101A4DB4 */ dword ptr [g_101A4DB4]
        _emit 059h _emit 08Bh _emit 0F0h _emit 074h _emit 028h _emit 056h _emit 0E8h _emit 0C9h _emit 05Bh _emit 000h _emit 000h _emit 085h _emit 0C0h _emit 059h _emit 074h _emit 01Dh _emit 08Bh _emit 006h _emit 02Bh _emit 005h
        /* g_101A4DB8 */ dword ptr [g_101A4DB8]
        _emit 02Bh _emit 005h
        /* g_101A4DB0 */ dword ptr [g_101A4DB0]
        _emit 089h _emit 045h _emit 008h _emit 0C7h _emit 046h _emit 020h _emit 001h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 045h _emit 008h _emit 0EBh _emit 00Bh _emit 08Bh _emit 006h _emit 02Bh _emit 005h
        /* g_101A4DB0 */ dword ptr [g_101A4DB0]
        _emit 089h _emit 045h _emit 008h _emit 053h _emit 06Ah _emit 03Ch _emit 059h _emit 099h _emit 08Bh _emit 0D9h _emit 0F7h _emit 0FBh _emit 085h _emit 0D2h _emit 089h _emit 016h _emit 07Dh _emit 007h _emit 003h _emit 0D1h _emit 089h _emit 016h _emit 029h _emit 04Dh _emit 008h _emit 08Bh _emit 045h _emit 008h _emit 099h _emit 08Bh _emit 0D9h _emit 0F7h _emit 0FBh _emit 003h _emit 046h _emit 004h _emit 089h _emit 045h _emit 008h _emit 099h _emit 0F7h _emit 0FBh _emit 05Bh _emit 085h _emit 0D2h _emit 089h _emit 056h _emit 004h _emit 07Dh _emit 009h _emit 083h _emit 0C2h _emit 03Ch _emit 089h _emit 056h _emit 004h _emit 029h _emit 04Dh _emit 008h _emit 08Bh _emit 045h _emit 008h _emit 099h _emit 0F7h _emit 0F9h _emit 06Ah _emit 018h _emit 059h _emit 003h _emit 046h _emit 008h _emit 089h _emit 045h _emit 008h _emit 099h _emit 0F7h _emit 0F9h _emit 085h _emit 0D2h _emit 089h _emit 056h _emit 008h _emit 07Dh _emit 008h _emit 003h _emit 0D1h _emit 089h _emit 056h _emit 008h _emit 029h _emit 04Dh _emit 008h _emit 08Bh _emit 045h _emit 008h _emit 06Ah _emit 018h _emit 099h _emit 059h _emit 0F7h _emit 0F9h _emit 08Bh _emit 0C8h _emit 085h _emit 0C9h _emit 089h _emit 04Dh _emit 008h _emit 07Eh _emit 01Fh _emit 08Bh _emit 046h _emit 018h _emit 003h _emit 0C1h _emit 099h _emit 06Ah _emit 007h _emit 059h _emit 0F7h _emit 0F9h _emit 089h _emit 056h _emit 018h _emit 08Bh _emit 045h _emit 008h _emit 001h _emit 046h _emit 00Ch _emit 08Bh _emit 045h _emit 008h _emit 001h _emit 046h _emit 01Ch _emit 08Bh _emit 0C6h _emit 05Eh _emit 05Dh _emit 0C3h _emit 07Dh _emit 0F9h _emit 08Bh _emit 046h _emit 018h _emit 08Dh _emit 044h _emit 008h _emit 007h _emit 099h _emit 06Ah _emit 007h _emit 059h _emit 0F7h _emit 0F9h _emit 089h _emit 056h _emit 018h _emit 08Bh _emit 045h _emit 008h _emit 001h _emit 046h _emit 00Ch _emit 08Bh _emit 046h _emit 00Ch _emit 085h _emit 0C0h _emit 07Fh _emit 0D6h _emit 083h _emit 0C0h _emit 01Fh _emit 0FFh _emit 04Eh _emit 014h _emit 089h _emit 046h _emit 00Ch _emit 0C7h _emit 046h _emit 01Ch _emit 06Ch _emit 001h _emit 000h _emit 000h _emit 0C7h _emit 046h _emit 010h _emit 00Bh _emit 000h _emit 000h _emit 000h _emit 0EBh _emit 0C3h
    }
}
