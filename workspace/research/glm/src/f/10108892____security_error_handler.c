extern int g_1010C160;
extern int g_1017CD90;
extern int g_1017CDB8;
extern int g_1017CDD8;
extern int g_1017CDDC;
extern int g_1018233C;
extern int g_10182348;
extern int g_101823E8;
extern int g_10182408;
extern int g_101824BC;
extern int g_101824E0;
extern int g_101A50D0;
extern int g_101AE258;

__declspec(naked) void ___security_error_handler(void)
{
    __asm {
        _emit 068h _emit 018h _emit 001h _emit 000h _emit 000h _emit 068h
        /* g_101824E0 */ dword ptr [g_101824E0]
        _emit 0E8h _emit 06Fh _emit 02Dh _emit 0FFh _emit 0FFh _emit 0A1h
        /* g_101A50D0 */ dword ptr [g_101A50D0]
        _emit 089h _emit 045h _emit 0E4h _emit 0A1h
        /* g_101AE258 */ dword ptr [g_101AE258]
        _emit 033h _emit 0C9h _emit 03Bh _emit 0C1h _emit 074h _emit 01Fh _emit 089h _emit 04Dh _emit 0FCh _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 008h _emit 0FFh _emit 0D0h _emit 059h _emit 059h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E9h _emit 008h _emit 001h _emit 000h _emit 000h _emit 033h _emit 0C0h _emit 040h _emit 0C3h _emit 08Bh _emit 065h _emit 0E8h _emit 0EBh _emit 0EEh _emit 08Bh _emit 045h _emit 008h _emit 048h _emit 074h _emit 016h _emit 0BFh
        /* g_101824BC */ dword ptr [g_101824BC]
        _emit 0C7h _emit 085h _emit 0D8h _emit 0FEh _emit 0FFh _emit 0FFh
        /* g_10182408 */ dword ptr [g_10182408]
        _emit 0BEh _emit 0D4h _emit 000h _emit 000h _emit 000h _emit 0EBh _emit 014h _emit 0BFh
        /* g_101823E8 */ dword ptr [g_101823E8]
        _emit 0C7h _emit 085h _emit 0D8h _emit 0FEh _emit 0FFh _emit 0FFh
        /* g_10182348 */ dword ptr [g_10182348]
        _emit 0BEh _emit 0B9h _emit 000h _emit 000h _emit 000h _emit 088h _emit 04Dh _emit 0E0h _emit 068h _emit 004h _emit 001h _emit 000h _emit 000h _emit 08Dh _emit 085h _emit 0DCh _emit 0FEh _emit 0FFh _emit 0FFh _emit 050h _emit 051h _emit 0FFh _emit 015h
        /* g_1010C160 */ dword ptr [g_1010C160]
        _emit 085h _emit 0C0h _emit 075h _emit 013h _emit 068h
        /* g_1017CDDC */ dword ptr [g_1017CDDC]
        _emit 08Dh _emit 085h _emit 0DCh _emit 0FEh _emit 0FFh _emit 0FFh _emit 050h _emit 0E8h _emit 062h _emit 05Fh _emit 0FFh _emit 0FFh _emit 059h _emit 059h _emit 08Dh _emit 09Dh _emit 0DCh _emit 0FEh _emit 0FFh _emit 0FFh _emit 08Bh _emit 0C3h _emit 050h _emit 0E8h _emit 0C2h _emit 018h _emit 0FFh _emit 0FFh _emit 059h _emit 083h _emit 0C0h _emit 00Bh _emit 083h _emit 0F8h _emit 03Ch _emit 076h _emit 025h _emit 08Bh _emit 0C3h _emit 050h _emit 0E8h _emit 0B1h _emit 018h _emit 0FFh _emit 0FFh _emit 08Bh _emit 0D8h _emit 08Dh _emit 085h _emit 0DCh _emit 0FEh _emit 0FFh _emit 0FFh _emit 083h _emit 0E8h _emit 031h _emit 003h _emit 0D8h _emit 06Ah _emit 003h _emit 068h
        /* g_1017CDD8 */ dword ptr [g_1017CDD8]
        _emit 053h _emit 0E8h _emit 087h _emit 0D4h _emit 0FEh _emit 0FFh _emit 083h _emit 0C4h _emit 010h _emit 053h _emit 0E8h _emit 08Eh _emit 018h _emit 0FFh _emit 0FFh _emit 059h _emit 08Dh _emit 044h _emit 030h _emit 00Ch _emit 083h _emit 0C0h _emit 003h _emit 083h _emit 0E0h _emit 0FCh _emit 0E8h _emit 0AEh _emit 0FEh _emit 0FEh _emit 0FFh _emit 089h _emit 065h _emit 0E8h _emit 08Bh _emit 0F4h _emit 057h _emit 056h _emit 0E8h _emit 002h _emit 05Fh _emit 0FFh _emit 0FFh _emit 0BFh
        /* g_1017CDB8 */ dword ptr [g_1017CDB8]
        _emit 057h _emit 056h _emit 0E8h _emit 006h _emit 05Fh _emit 0FFh _emit 0FFh _emit 068h
        /* g_1018233C */ dword ptr [g_1018233C]
        _emit 056h _emit 0E8h _emit 0FBh _emit 05Eh _emit 0FFh _emit 0FFh _emit 053h _emit 056h _emit 0E8h _emit 0F4h _emit 05Eh _emit 0FFh _emit 0FFh _emit 057h _emit 056h _emit 0E8h _emit 0EDh _emit 05Eh _emit 0FFh _emit 0FFh _emit 0FFh _emit 0B5h _emit 0D8h _emit 0FEh _emit 0FFh _emit 0FFh _emit 056h _emit 0E8h _emit 0E1h _emit 05Eh _emit 0FFh _emit 0FFh _emit 068h _emit 010h _emit 020h _emit 001h _emit 000h _emit 068h
        /* g_1017CD90 */ dword ptr [g_1017CD90]
        _emit 056h _emit 0E8h _emit 0B6h _emit 0F8h _emit 0FFh _emit 0FFh _emit 083h
    }
}
