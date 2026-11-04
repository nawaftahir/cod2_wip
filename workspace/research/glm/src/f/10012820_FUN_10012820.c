extern int g_10193BF8;
extern int g_10193C1C;
extern int g_101D1BF4;
extern int g_101D1BFC;
extern int g_101D49C8;

__declspec(naked) void FUN_10012820(void)
{
    __asm {
        _emit 0A1h
        /* g_101D1BF4 */ dword ptr [g_101D1BF4]
        _emit 085h _emit 0C0h _emit 075h _emit 032h _emit 068h
        /* g_10193C1C */ dword ptr [g_10193C1C]
        _emit 06Ah _emit 000h _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 083h _emit 0C4h _emit 008h _emit 06Ah _emit 020h _emit 0E8h _emit 0DAh _emit 0F9h _emit 004h _emit 000h _emit 085h _emit 0C0h _emit 0A3h
        /* g_101D1BF4 */ dword ptr [g_101D1BF4]
        _emit 075h _emit 012h _emit 068h
        /* g_10193BF8 */ dword ptr [g_10193BF8]
        _emit 050h _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 083h _emit 0C4h _emit 008h _emit 032h _emit 0C0h _emit 0C3h _emit 056h _emit 0E8h _emit 06Fh _emit 0FFh _emit 0FFh _emit 0FFh _emit 08Bh _emit 0F0h _emit 0A3h
        /* g_101D1BFC */ dword ptr [g_101D1BFC]
        _emit 0E8h _emit 093h _emit 0F0h _emit 0FFh _emit 0FFh _emit 0A1h
        /* g_101D1BFC */ dword ptr [g_101D1BFC]
        _emit 0E8h _emit 059h _emit 0FBh _emit 0FFh _emit 0FFh _emit 0B0h _emit 001h _emit 05Eh _emit 0C3h
    }
}
