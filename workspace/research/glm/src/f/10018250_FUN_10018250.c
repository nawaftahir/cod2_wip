extern int g_101DA964;
extern int g_101DA968;

__declspec(naked) void FUN_10018250(void)
{
    __asm {
        _emit 053h _emit 055h _emit 08Bh _emit 06Ch _emit 024h _emit 00Ch _emit 056h _emit 057h _emit 08Bh _emit 03Dh
        /* g_101DA964 */ dword ptr [g_101DA964]
        _emit 033h _emit 0DBh _emit 04Fh _emit 078h _emit 02Dh _emit 08Bh _emit 00Dh
        /* g_101DA968 */ dword ptr [g_101DA968]
        _emit 08Dh _emit 034h _emit 01Fh _emit 0D1h _emit 0FEh _emit 08Dh _emit 004h _emit 076h _emit 08Bh _emit 014h _emit 081h _emit 052h _emit 055h _emit 0E8h _emit 054h _emit 0F6h _emit 00Dh _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 085h _emit 0C0h _emit 074h _emit 015h _emit 07Dh _emit 005h _emit 08Dh _emit 07Eh _emit 0FFh _emit 0EBh _emit 003h _emit 08Dh _emit 05Eh _emit 001h _emit 03Bh _emit 0DFh _emit 07Eh _emit 0D3h _emit 05Fh _emit 05Eh _emit 05Dh _emit 032h _emit 0C0h _emit 05Bh _emit 0C3h _emit 08Bh _emit 00Dh
        /* g_101DA968 */ dword ptr [g_101DA968]
        _emit 08Dh _emit 004h _emit 076h _emit 08Bh _emit 054h _emit 081h _emit 008h _emit 08Dh _emit 004h _emit 081h _emit 08Bh _emit 04Ch _emit 024h _emit 01Ch _emit 05Fh _emit 089h _emit 011h _emit 08Bh _emit 050h _emit 004h _emit 08Bh _emit 044h _emit 024h _emit 014h _emit 05Eh _emit 05Dh _emit 089h _emit 010h _emit 0B0h _emit 001h _emit 05Bh _emit 0C3h
    }
}
