extern int g_101A4DB8;
extern int g_101A4E48;
extern int g_101A4E4C;
extern int g_101A4E50;
extern int g_101A4E54;
extern int g_101A4E58;
extern int g_101A4E5C;

__declspec(naked) void cvtdate(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 051h _emit 051h _emit 053h _emit 056h _emit 057h _emit 08Bh _emit 07Dh _emit 010h _emit 08Bh _emit 0F0h _emit 08Bh _emit 0C7h _emit 06Ah _emit 004h _emit 099h _emit 05Bh _emit 0F7h _emit 0FBh _emit 083h _emit 07Dh _emit 00Ch _emit 001h _emit 00Fh _emit 085h _emit 0E9h _emit 000h _emit 000h _emit 000h _emit 085h _emit 0D2h _emit 089h _emit 055h _emit 0F8h _emit 075h _emit 00Ch _emit 08Bh _emit 0C7h _emit 06Ah _emit 064h _emit 099h _emit 05Bh _emit 0F7h _emit 0FBh _emit 085h _emit 0D2h _emit 075h _emit 01Fh _emit 08Dh _emit 087h _emit 06Ch _emit 007h _emit 000h _emit 000h _emit 099h _emit 0BBh _emit 090h _emit 001h _emit 000h _emit 000h _emit 0F7h _emit 0FBh _emit 085h _emit 0D2h _emit 074h _emit 00Dh _emit 08Bh _emit 0C6h _emit 0C1h _emit 0E0h _emit 002h _emit 08Bh _emit 0B0h _emit 0ECh _emit 055h _emit 01Ah _emit 010h _emit 0EBh _emit 00Bh _emit 08Bh _emit 0C6h _emit 0C1h _emit 0E0h _emit 002h _emit 08Bh _emit 0B0h _emit 0B8h _emit 055h _emit 01Ah _emit 010h _emit 089h _emit 045h _emit 00Ch _emit 08Dh _emit 087h _emit 02Bh _emit 001h _emit 000h _emit 000h _emit 099h _emit 08Dh _emit 05Fh _emit 0FFh _emit 0BFh _emit 090h _emit 001h _emit 000h _emit 000h _emit 0F7h _emit 0FFh _emit 06Ah _emit 064h _emit 05Fh _emit 046h _emit 06Ah _emit 004h _emit 089h _emit 045h _emit 0FCh _emit 08Bh _emit 0C3h _emit 099h _emit 0F7h _emit 0FFh _emit 08Bh _emit 055h _emit 0FCh _emit 05Fh _emit 06Ah _emit 007h _emit 02Bh _emit 0D0h _emit 08Bh _emit 045h _emit 010h _emit 048h _emit 08Bh _emit 0DAh _emit 099h _emit 0F7h _emit 0FFh _emit 08Bh _emit 07Dh _emit 010h _emit 08Bh _emit 0D7h _emit 069h _emit 0D2h _emit 06Dh _emit 001h _emit 000h _emit 000h _emit 003h _emit 0C6h _emit 003h _emit 0C3h _emit 08Dh _emit 084h _emit 002h _emit 025h _emit 09Ch _emit 0FFh _emit 0FFh _emit 099h _emit 05Bh _emit 0F7h _emit 0FBh _emit 08Bh _emit 045h _emit 014h _emit 06Bh _emit 0C0h _emit 007h _emit 02Bh _emit 0C2h _emit 003h _emit 045h _emit 018h _emit 03Bh _emit 055h _emit 018h _emit 07Fh _emit 006h _emit 08Dh _emit 074h _emit 006h _emit 0F9h _emit 0EBh _emit 002h _emit 003h _emit 0F0h _emit 083h _emit 07Dh _emit 014h _emit 005h _emit 075h _emit 076h _emit 083h _emit 07Dh _emit 0F8h _emit 000h _emit 075h _emit 00Ch _emit 08Bh _emit 0C7h _emit 06Ah _emit 064h _emit 099h _emit 05Bh _emit 0F7h _emit 0FBh _emit 085h _emit 0D2h _emit 075h _emit 01Dh _emit 08Dh _emit 087h _emit 06Ch _emit 007h _emit 000h _emit 000h _emit 099h _emit 0BBh _emit 090h _emit 001h _emit 000h _emit 000h _emit 0F7h _emit 0FBh _emit 085h _emit 0D2h _emit 074h _emit 00Bh _emit 08Bh _emit 045h _emit 00Ch _emit 08Bh _emit 080h _emit 0F0h _emit 055h _emit 01Ah _emit 010h _emit 0EBh _emit 009h _emit 08Bh _emit 045h _emit 00Ch _emit 08Bh _emit 080h _emit 0BCh _emit 055h _emit 01Ah _emit 010h _emit 03Bh _emit 0F0h _emit 07Eh _emit 03Ah _emit 083h _emit 0EEh _emit 007h _emit 0EBh _emit 035h _emit 085h _emit 0D2h _emit 075h _emit 00Ch _emit 08Bh _emit 0C7h _emit 06Ah _emit 064h _emit 099h _emit 05Bh _emit 0F7h _emit 0FBh _emit 085h _emit 0D2h _emit 075h _emit 01Bh _emit 08Dh _emit 087h _emit 06Ch _emit 007h _emit 000h _emit 000h _emit 099h _emit 0BBh _emit 090h _emit 001h _emit 000h _emit 000h _emit 0F7h _emit 0FBh _emit 085h _emit 0D2h _emit 074h _emit 009h _emit 08Bh _emit 034h _emit 0B5h _emit 0ECh _emit 055h _emit 01Ah _emit 010h _emit 0EBh _emit 007h _emit 08Bh _emit 034h _emit 0B5h _emit 0B8h _emit 055h _emit 01Ah _emit 010h _emit 003h _emit 075h _emit 01Ch _emit 06Bh _emit 0C9h _emit 03Ch _emit 003h _emit 04Dh _emit 020h _emit 06Bh _emit 0C9h _emit 03Ch _emit 083h _emit 07Dh _emit 008h _emit 001h _emit 075h _emit 020h _emit 003h _emit 04Dh _emit 024h _emit 089h _emit 035h
        /* g_101A4E4C */ dword ptr [g_101A4E4C]
        _emit 069h _emit 0C9h _emit 0E8h _emit 003h _emit 000h _emit 000h _emit 003h _emit 04Dh _emit 028h _emit 089h _emit 03Dh
        /* g_101A4E48 */ dword ptr [g_101A4E48]
        _emit 089h _emit 00Dh
        /* g_101A4E50 */ dword ptr [g_101A4E50]
        _emit 0EBh _emit 047h _emit 003h _emit 00Dh
        /* g_101A4DB8 */ dword ptr [g_101A4DB8]
        _emit 089h _emit 035h
        /* g_101A4E58 */ dword ptr [g_101A4E58]
        _emit 003h _emit 04Dh _emit 024h _emit 069h _emit 0C9h _emit 0E8h _emit 003h _emit 000h _emit 000h _emit 003h _emit 04Dh _emit 028h _emit 089h _emit 00Dh
        /* g_101A4E5C */ dword ptr [g_101A4E5C]
        _emit 079h _emit 009h _emit 081h _emit 0C1h _emit 000h _emit 05Ch _emit 026h _emit 005h _emit 04Eh _emit 0EBh _emit 00Ch _emit 0B8h _emit 000h _emit 05Ch _emit 026h _emit 005h _emit 03Bh _emit 0C8h _emit 07Ch _emit 00Fh _emit 02Bh _emit 0C8h _emit 046h _emit 089h _emit 00Dh
        /* g_101A4E5C */ dword ptr [g_101A4E5C]
        _emit 089h _emit 035h
        /* g_101A4E58 */ dword ptr [g_101A4E58]
        _emit 089h _emit 03Dh
        /* g_101A4E54 */ dword ptr [g_101A4E54]
        _emit 05Fh _emit 05Eh _emit 05Bh _emit 0C9h _emit 0C3h
    }
}
