extern int g_10016890;
extern int g_101D0B04;
extern int g_101D0B08;

__declspec(naked) void FUN_10016e70(void)
{
    __asm {
        _emit 0A1h
        /* g_101D0B04 */ dword ptr [g_101D0B04]
        _emit 08Dh _emit 004h _emit 085h _emit 008h _emit 00Bh _emit 01Dh _emit 010h _emit 08Bh _emit 0C8h _emit 081h _emit 0E9h
        /* g_101D0B08 */ dword ptr [g_101D0B08]
        _emit 068h
        /* g_10016890 */ dword ptr [g_10016890]
        _emit 0C1h _emit 0F9h _emit 002h _emit 051h _emit 050h _emit 068h
        /* g_101D0B08 */ dword ptr [g_101D0B08]
        _emit 0E8h _emit 008h _emit 00Bh _emit 000h _emit 000h _emit 08Bh _emit 00Dh
        /* g_101D0B04 */ dword ptr [g_101D0B04]
        _emit 083h _emit 0C4h _emit 010h _emit 033h _emit 0C0h _emit 085h _emit 0C9h _emit 07Eh _emit 01Fh _emit 0EBh _emit 007h _emit 08Dh _emit 0A4h _emit 024h _emit 000h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 014h _emit 085h _emit 008h _emit 00Bh _emit 01Dh _emit 010h _emit 066h _emit 089h _emit 042h _emit 00Ah _emit 08Bh _emit 00Dh _emit 004h _emit 00Bh _emit 01Dh
    }
}
