extern int g_1017C930;
extern int g_101ADFDC;

__declspec(naked) void ___tzset(void)
{
    __asm {
        _emit 06Ah _emit 008h _emit 068h
        /* g_1017C930 */ dword ptr [g_1017C930]
        _emit 0E8h _emit 0A7h _emit 0EBh _emit 0FFh _emit 0FFh _emit 033h _emit 0F6h _emit 039h _emit 035h
        /* g_101ADFDC */ dword ptr [g_101ADFDC]
        _emit 075h _emit 027h _emit 06Ah _emit 006h _emit 0E8h _emit 003h _emit 0F6h _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 075h _emit 0FCh _emit 039h _emit 035h
        /* g_101ADFDC */ dword ptr [g_101ADFDC]
        _emit 075h _emit 00Bh _emit 0E8h _emit 0EBh _emit 0F9h _emit 0FFh _emit 0FFh _emit 0FFh _emit 005h
        /* g_101ADFDC */ dword ptr [g_101ADFDC]
        _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 006h _emit 000h _emit 000h _emit 000h _emit 0E8h _emit 0ACh _emit 0EBh _emit 0FFh _emit 0FFh _emit 0C3h
    }
}
