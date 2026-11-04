extern int g_1010C044;
extern int g_1010C134;
extern int g_1017C91C;
extern int g_1017C920;
extern int g_101A4DB0;
extern int g_101A4DB4;
extern int g_101A4DB8;
extern int g_101A4E40;
extern int g_101A4E44;
extern int g_101A4E48;
extern int g_101A4E54;
extern int g_101ADF28;
extern int g_101ADF2C;
extern int g_101ADF6E;
extern int g_101ADF7C;
extern int g_101ADF80;
extern int g_101ADFC2;
extern int g_101ADFD0;
extern int g_101ADFD4;
extern int g_101ADFD8;
extern int g_101AE1A8;

__declspec(naked) void __tzset_lk(void)
{
    __asm {
        _emit 06Ah _emit 018h _emit 068h
        /* g_1017C920 */ dword ptr [g_1017C920]
        _emit 0E8h _emit 08Eh _emit 0F1h _emit 0FFh _emit 0FFh _emit 033h _emit 0FFh _emit 089h _emit 07Dh _emit 0E0h _emit 06Ah _emit 007h _emit 0E8h _emit 0EFh _emit 0FBh _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 07Dh _emit 0FCh _emit 08Bh _emit 01Dh
        /* g_101AE1A8 */ dword ptr [g_101AE1A8]
        _emit 089h _emit 05Dh _emit 0D8h _emit 089h _emit 03Dh
        /* g_101ADFD4 */ dword ptr [g_101ADFD4]
        _emit 083h _emit 00Dh _emit 054h
        /* g_101A4E54 */ dword ptr [g_101A4E54]
        _emit 083h _emit 00Dh _emit 048h
        /* g_101A4E48 */ dword ptr [g_101A4E48]
        _emit 068h
        /* g_1017C91C */ dword ptr [g_1017C91C]
        _emit 0E8h _emit 00Eh _emit 0BAh _emit 000h _emit 000h _emit 059h _emit 08Bh _emit 0F0h _emit 089h _emit 075h _emit 0DCh _emit 03Bh _emit 0F7h _emit 00Fh _emit 084h _emit 0B8h _emit 000h _emit 000h _emit 000h _emit 080h _emit 03Eh _emit 000h _emit 00Fh _emit 084h _emit 0AFh _emit 000h _emit 000h _emit 000h _emit 0A1h
        /* g_101ADFD8 */ dword ptr [g_101ADFD8]
        _emit 03Bh _emit 0C7h _emit 074h _emit 021h _emit 050h _emit 056h _emit 0E8h _emit 0C0h _emit 03Eh _emit 000h _emit 000h _emit 059h _emit 059h _emit 085h _emit 0C0h _emit 00Fh _emit 084h _emit 090h _emit 001h _emit 000h _emit 000h _emit 0A1h
        /* g_101ADFD8 */ dword ptr [g_101ADFD8]
        _emit 03Bh _emit 0C7h _emit 074h _emit 007h _emit 050h _emit 0E8h _emit 0D7h _emit 0BFh _emit 0FFh _emit 0FFh _emit 059h _emit 056h _emit 0E8h _emit 000h _emit 0DDh _emit 0FFh _emit 0FFh _emit 040h _emit 050h _emit 0E8h _emit 05Dh _emit 0FFh _emit 0FFh _emit 0FFh _emit 059h _emit 059h _emit 0A3h
        /* g_101ADFD8 */ dword ptr [g_101ADFD8]
        _emit 03Bh _emit 0C7h _emit 00Fh _emit 084h _emit 064h _emit 001h _emit 000h _emit 000h _emit 056h _emit 050h _emit 0E8h _emit 073h _emit 023h _emit 000h _emit 000h _emit 059h _emit 059h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 069h _emit 001h _emit 000h _emit 000h _emit 06Ah _emit 003h _emit 056h _emit 0FFh _emit 035h
        /* g_101A4E40 */ dword ptr [g_101A4E40]
        _emit 0E8h _emit 0BAh _emit 098h _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 00Ch _emit 0A1h
        /* g_101A4E40 */ dword ptr [g_101A4E40]
        _emit 0C6h _emit 040h _emit 003h _emit 000h _emit 083h _emit 0C6h _emit 003h _emit 080h _emit 03Eh _emit 02Dh _emit 075h _emit 008h _emit 0C7h _emit 045h _emit 0E0h _emit 001h _emit 000h _emit 000h _emit 000h _emit 046h _emit 056h _emit 0E8h _emit 04Fh _emit 0AEh _emit 0FFh _emit 0FFh _emit 059h _emit 069h _emit 0C0h _emit 010h _emit 00Eh _emit 000h _emit 000h _emit 0A3h
        /* g_101A4DB0 */ dword ptr [g_101A4DB0]
        _emit 0B3h _emit 030h _emit 08Ah _emit 006h _emit 03Ch _emit 02Bh _emit 074h _emit 010h _emit 03Ah _emit 0C3h _emit 00Fh _emit 08Ch _emit 026h _emit 001h _emit 000h _emit 000h _emit 03Ch _emit 039h _emit 00Fh _emit 08Fh _emit 01Eh _emit 001h _emit 000h _emit 000h _emit 046h _emit 0EBh _emit 0E7h _emit 0A1h
        /* g_101ADFD8 */ dword ptr [g_101ADFD8]
        _emit 03Bh _emit 0C7h _emit 074h _emit 00Dh _emit 050h _emit 0E8h _emit 042h _emit 0BFh _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 03Dh
        /* g_101ADFD8 */ dword ptr [g_101ADFD8]
        _emit 068h
        /* g_101ADF28 */ dword ptr [g_101ADF28]
        _emit 0FFh _emit 015h
        /* g_1010C134 */ dword ptr [g_1010C134]
        _emit 083h _emit 0F8h _emit 0FFh _emit 00Fh _emit 084h _emit 0D1h _emit 000h _emit 000h _emit 000h _emit 033h _emit 0C9h _emit 041h _emit 089h _emit 00Dh
        /* g_101ADFD4 */ dword ptr [g_101ADFD4]
        _emit 0A1h
        /* g_101ADF28 */ dword ptr [g_101ADF28]
        _emit 06Bh _emit 0C0h _emit 03Ch _emit 0A3h
        /* g_101A4DB0 */ dword ptr [g_101A4DB0]
        _emit 066h _emit 039h _emit 03Dh
        /* g_101ADF6E */ dword ptr [g_101ADF6E]
        _emit 074h _emit 010h _emit 08Bh _emit 015h
        /* g_101ADF7C */ dword ptr [g_101ADF7C]
        _emit 06Bh _emit 0D2h _emit 03Ch _emit 003h _emit 0C2h _emit 0A3h
        /* g_101A4DB0 */ dword ptr [g_101A4DB0]
        _emit 066h _emit 039h _emit 03Dh
        /* g_101ADFC2 */ dword ptr [g_101ADFC2]
        _emit 074h _emit 01Fh _emit 0A1h
        /* g_101ADFD0 */ dword ptr [g_101ADFD0]
        _emit 03Bh _emit 0C7h _emit 074h _emit 016h _emit 089h _emit 00Dh
        /* g_101A4DB4 */ dword ptr [g_101A4DB4]
        _emit 02Bh _emit 005h
        /* g_101ADF7C */ dword ptr [g_101ADF7C]
        _emit 06Bh _emit 0C0h _emit 03Ch _emit 0A3h
        /* g_101A4DB8 */ dword ptr [g_101A4DB8]
        _emit 0EBh _emit 00Ch _emit 089h _emit 03Dh
        /* g_101A4DB4 */ dword ptr [g_101A4DB4]
        _emit 089h _emit 03Dh
        /* g_101A4DB8 */ dword ptr [g_101A4DB8]
        _emit 08Dh _emit 045h _emit 0E4h _emit 050h _emit 057h _emit 06Ah _emit 03Fh _emit 0FFh _emit 035h
        /* g_101A4E40 */ dword ptr [g_101A4E40]
        _emit 06Ah _emit 0FFh _emit 068h
        /* g_101ADF2C */ dword ptr [g_101ADF2C]
        _emit 057h _emit 053h _emit 08Bh _emit 035h
        /* g_1010C044 */ dword ptr [g_1010C044]
        _emit 0FFh _emit 0D6h _emit 085h _emit 0C0h _emit 074h _emit 010h _emit 039h _emit 07Dh _emit 0E4h _emit 075h _emit 00Bh _emit 0A1h
        /* g_101A4E40 */ dword ptr [g_101A4E40]
        _emit 0C6h _emit 040h _emit 03Fh _emit 000h _emit 0EBh _emit 008h _emit 0A1h
        /* g_101A4E40 */ dword ptr [g_101A4E40]
        _emit 0C6h _emit 000h _emit 000h _emit 08Dh _emit 045h _emit 0E4h _emit 050h _emit 057h _emit 06Ah _emit 03Fh _emit 0FFh _emit 035h
        /* g_101A4E44 */ dword ptr [g_101A4E44]
        _emit 06Ah _emit 0FFh _emit 068h
        /* g_101ADF80 */ dword ptr [g_101ADF80]
        _emit 057h _emit 053h _emit 0FFh _emit 0D6h _emit 085h _emit 0C0h _emit 074h _emit 010h _emit 039h _emit 07Dh _emit 0E4h _emit 075h _emit 00Bh _emit 0A1h
        /* g_101A4E44 */ dword ptr [g_101A4E44]
        _emit 0C6h _emit 040h _emit 03Fh _emit 000h _emit 0EBh _emit 008h _emit 0A1h
        /* g_101A4E44 */ dword ptr [g_101A4E44]
        _emit 0C6h _emit 000h _emit 000h _emit 06Ah _emit 0FFh _emit 08Dh _emit 045h _emit 0F0h _emit 050h _emit 0E8h _emit 01Dh _emit 04Ah _emit 000h _emit 000h _emit 059h _emit 059h _emit 0E9h _emit 08Ch _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 075h _emit 0DCh _emit 033h _emit 0FFh _emit 06Ah _emit 007h _emit 0E8h _emit 018h _emit 0F9h _emit 0FFh _emit 0FFh _emit 059h _emit 0C3h _emit 080h _emit 03Eh _emit 03Ah _emit 075h _emit 03Eh _emit 046h _emit 056h _emit 0E8h _emit 001h _emit 0ADh _emit 0FFh _emit 0FFh _emit 059h _emit 06Bh _emit 0C0h _emit 03Ch _emit 001h _emit 005h
        /* g_101A4DB0 */ dword ptr [g_101A4DB0]
        _emit 0EBh _emit 005h _emit 03Ch _emit 039h _emit 07Fh _emit 007h _emit 046h _emit 08Ah _emit 006h _emit 03Ah _emit 0C3h _emit 07Dh _emit 0F5h _emit 080h _emit 03Eh _emit 03Ah _emit 075h _emit 01Bh _emit 046h _emit 056h _emit 0E8h _emit 0DEh _emit 0ACh _emit 0FFh _emit 0FFh _emit 059h _emit 001h _emit 005h
        /* g_101A4DB0 */ dword ptr [g_101A4DB0]
        _emit 0EBh _emit 005h _emit 03Ch _emit 039h _emit 07Fh _emit 007h _emit 046h _emit 08Ah _emit 006h _emit 03Ah _emit 0C3h _emit 07Dh _emit 0F5h _emit 039h _emit 07Dh _emit 0E0h _emit 074h _emit 006h _emit 0F7h _emit 01Dh
        /* g_101A4DB0 */ dword ptr [g_101A4DB0]
        _emit 00Fh _emit 0BEh _emit 006h _emit 0A3h
        /* g_101A4DB4 */ dword ptr [g_101A4DB4]
        _emit 03Bh _emit 0C7h _emit 074h _emit 01Ch _emit 06Ah _emit 003h _emit 056h _emit 0FFh _emit 035h
        /* g_101A4E44 */ dword ptr [g_101A4E44]
        _emit 0E8h _emit 0EEh _emit 096h _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 00Ch _emit 0A1h
        /* g_101A4E44 */ dword ptr [g_101A4E44]
        _emit 0C6h _emit 040h _emit 003h _emit 000h _emit 0EBh _emit 008h
    }
}
