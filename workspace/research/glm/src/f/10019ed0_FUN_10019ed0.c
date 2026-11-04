extern int g_1018F040;
extern int g_1018F620;

__declspec(naked) void FUN_10019ed0(void)
{
    __asm {
        _emit 056h _emit 068h
        /* g_1018F040 */ dword ptr [g_1018F040]
        _emit 057h _emit 053h _emit 066h _emit 0C7h _emit 006h _emit 001h _emit 000h _emit 0E8h _emit 02Eh _emit 0FFh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 010h _emit 084h _emit 0C0h _emit 074h _emit 003h _emit 0B0h _emit 001h _emit 0C3h _emit 056h _emit 068h
        /* g_1018F620 */ dword ptr [g_1018F620]
        _emit 057h _emit 053h _emit 0E8h _emit 017h _emit 0FFh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 010h _emit 084h _emit 0C0h _emit 00Fh _emit 095h _emit 0C0h _emit 0C3h
    }
}
