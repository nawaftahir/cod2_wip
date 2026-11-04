extern int g_1017E284;
extern int g_1017E288;
extern int g_101A50D0;
extern int g_101AE174;
extern int g_101AE18C;

__declspec(naked) void _ProcessCodePage(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 083h _emit 0ECh _emit 00Ch _emit 0A1h
        /* g_101A50D0 */ dword ptr [g_101A50D0]
        _emit 056h _emit 08Bh _emit 0F1h _emit 085h _emit 0F6h _emit 089h _emit 045h _emit 0FCh _emit 074h _emit 031h _emit 080h _emit 03Eh _emit 000h _emit 074h _emit 02Ch _emit 068h
        /* g_1017E288 */ dword ptr [g_1017E288]
        _emit 056h _emit 0E8h _emit 0D9h _emit 0FEh _emit 0FFh _emit 0FFh _emit 085h _emit 0C0h _emit 059h _emit 059h _emit 074h _emit 01Bh _emit 068h
        /* g_1017E284 */ dword ptr [g_1017E284]
        _emit 056h _emit 0E8h _emit 0C8h _emit 0FEh _emit 0FFh _emit 0FFh _emit 085h _emit 0C0h _emit 059h _emit 059h _emit 075h _emit 028h _emit 06Ah _emit 008h _emit 08Dh _emit 045h _emit 0F4h _emit 050h _emit 06Ah _emit 00Bh _emit 0EBh _emit 00Bh _emit 06Ah _emit 008h _emit 08Dh _emit 045h _emit 0F4h _emit 050h _emit 068h _emit 004h _emit 010h _emit 000h _emit 000h _emit 0FFh _emit 035h
        /* g_101AE174 */ dword ptr [g_101AE174]
        _emit 0FFh _emit 015h
        /* g_101AE18C */ dword ptr [g_101AE18C]
        _emit 085h _emit 0C0h _emit 074h _emit 00Ah _emit 08Dh _emit 075h _emit 0F4h _emit 056h _emit 0E8h _emit 09Bh _emit 06Eh _emit 0FFh _emit 0FFh _emit 059h _emit 08Bh _emit 04Dh _emit 0FCh _emit 05Eh _emit 0E8h _emit 037h _emit 008h _emit 000h _emit 000h _emit 0C9h _emit 0C3h
    }
}
