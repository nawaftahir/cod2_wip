extern int g_1076AC9C;

__declspec(naked) void __isatty(void)
{
    __asm {
        _emit 08Bh _emit 044h _emit 024h _emit 004h _emit 03Bh _emit 005h
        /* g_1076AC9C */ dword ptr [g_1076AC9C]
        _emit 072h _emit 003h _emit 033h _emit 0C0h _emit 0C3h _emit 08Bh _emit 0C8h _emit 083h _emit 0E0h _emit 01Fh _emit 0C1h _emit 0F9h _emit 005h _emit 08Bh _emit 00Ch _emit 08Dh _emit 0A0h _emit 0ACh _emit 076h _emit 010h _emit 08Dh _emit 004h _emit 0C0h _emit 00Fh _emit 0BEh _emit 044h _emit 081h _emit 004h _emit 083h _emit 0E0h _emit 040h _emit 0C3h
    }
}
