extern int g_101CE644;
extern int g_101D0B00;
extern int g_101D4C6C;
extern int g_101D4C70;
extern int g_101D4D00;
extern int g_1072DA00;
extern int g_1072DDE8;
extern int g_1072DDEC;
extern int g_1072DE48;
extern int g_1072DEBE;
extern int g_10730554;
extern int g_10730558;

__declspec(naked) void FUN_10012e70(void)
{
    __asm {
        _emit 08Bh _emit 015h
        /* g_101CE644 */ dword ptr [g_101CE644]
        _emit 057h _emit 033h _emit 0C0h _emit 0B9h _emit 068h _emit 00Ch _emit 000h _emit 000h _emit 0BFh
        /* g_101D4D00 */ dword ptr [g_101D4D00]
        _emit 0F3h _emit 0ABh _emit 0B9h _emit 03Ch _emit 004h _emit 000h _emit 000h _emit 0BFh
        /* g_101D0B00 */ dword ptr [g_101D0B00]
        _emit 0F3h _emit 0ABh _emit 0B9h _emit 0D8h _emit 0DAh _emit 000h _emit 000h _emit 0BFh
        /* g_1072DA00 */ dword ptr [g_1072DA00]
        _emit 0F3h _emit 0ABh _emit 08Bh _emit 00Dh
        /* g_101D4C70 */ dword ptr [g_101D4C70]
        _emit 0B8h _emit 00Eh _emit 000h _emit 000h _emit 000h _emit 0A3h
        /* g_10730554 */ dword ptr [g_10730554]
        _emit 0A3h
        /* g_10730558 */ dword ptr [g_10730558]
        _emit 0A1h
        /* g_101D4C6C */ dword ptr [g_101D4C6C]
        _emit 089h _emit 00Dh
        /* g_1072DDEC */ dword ptr [g_1072DDEC]
        _emit 0C7h _emit 005h _emit 048h _emit 0DEh _emit 072h _emit 010h
        /* g_1072DE48 */ dword ptr [g_1072DE48]
        _emit 0A3h
        /* g_1072DDE8 */ dword ptr [g_1072DDE8]
        _emit 08Bh _emit 042h _emit 008h _emit 08Ah _emit 088h _emit 0B0h _emit 006h _emit 019h _emit 010h _emit 088h _emit 00Dh
        /* g_1072DEBE */ dword ptr [g_1072DEBE]
        _emit 05Fh _emit 0C3h
    }
}
