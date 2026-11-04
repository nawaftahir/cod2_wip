extern int g_1010C030;
extern int g_101A48A0;
extern int g_101A4B00;

__declspec(naked) void __lock_file(void)
{
    __asm {
        _emit 08Bh _emit 044h _emit 024h _emit 004h _emit 0B9h
        /* g_101A48A0 */ dword ptr [g_101A48A0]
        _emit 03Bh _emit 0C1h _emit 072h _emit 017h _emit 03Dh
        /* g_101A4B00 */ dword ptr [g_101A4B00]
        _emit 077h _emit 010h _emit 02Bh _emit 0C1h _emit 0C1h _emit 0F8h _emit 005h _emit 083h _emit 0C0h _emit 010h _emit 050h _emit 0E8h _emit 0A2h _emit 00Bh _emit 000h _emit 000h _emit 059h _emit 0C3h _emit 083h _emit 0C0h _emit 020h _emit 050h _emit 0FFh _emit 015h
        /* g_1010C030 */ dword ptr [g_1010C030]
        _emit 0C3h
    }
}
