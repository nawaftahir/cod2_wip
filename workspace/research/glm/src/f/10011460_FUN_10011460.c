extern int g_101D1BF4;
extern int g_101D4814;
extern int g_101D4818;

__declspec(naked) void FUN_10011460(void)
{
    __asm {
        _emit 051h _emit 056h _emit 08Bh _emit 077h _emit 020h _emit 083h _emit 0FEh _emit 001h _emit 07Eh _emit 036h _emit 08Dh _emit 09Bh _emit 000h _emit 000h _emit 000h _emit 000h _emit 0A1h
        /* g_101D1BF4 */ dword ptr [g_101D1BF4]
        _emit 08Dh _emit 054h _emit 024h _emit 004h _emit 052h _emit 033h _emit 0D2h _emit 089h _emit 035h
        /* g_101D4814 */ dword ptr [g_101D4814]
        _emit 038h _emit 057h _emit 008h _emit 08Bh _emit 008h _emit 00Fh _emit 094h _emit 0C2h _emit 056h _emit 052h _emit 06Ah _emit 015h _emit 06Ah _emit 001h _emit 06Ah _emit 000h _emit 050h _emit 0FFh _emit 051h _emit 02Ch _emit 085h _emit 0C0h _emit 07Dh _emit 01Dh _emit 04Eh _emit 083h _emit 0FEh _emit 001h _emit 07Fh _emit 0D0h _emit 0C7h _emit 005h _emit 014h _emit 048h _emit 01Dh _emit 010h
        /* g_101D4814 */ dword ptr [g_101D4814]
        _emit 0C7h _emit 005h _emit 018h _emit 048h _emit 01Dh _emit 010h
        /* g_101D4818 */ dword ptr [g_101D4818]
        _emit 05Eh _emit 059h _emit 0C3h _emit 08Bh _emit 044h _emit 024h _emit 004h _emit 048h _emit 0A3h
        /* g_101D4818 */ dword ptr [g_101D4818]
        _emit 05Eh _emit 059h _emit 0C3h
    }
}
