extern int g_101955B4;
extern int g_101958A8;
extern int g_101958CC;

__declspec(naked) void FUN_10019480(void)
{
    __asm {
        _emit 053h _emit 06Ah _emit 001h _emit 068h
        /* g_101958CC */ dword ptr [g_101958CC]
        _emit 08Bh _emit 0CFh _emit 08Bh _emit 0D8h _emit 0E8h _emit 05Fh _emit 066h _emit 004h _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 085h _emit 0C0h _emit 075h _emit 004h _emit 032h _emit 0C0h _emit 05Bh _emit 0C3h _emit 056h _emit 08Bh _emit 0CFh _emit 0E8h _emit 08Ch _emit 06Ah _emit 004h _emit 000h _emit 08Bh _emit 0F0h _emit 085h _emit 0F6h _emit 07Ch _emit 029h _emit 03Bh _emit 0F3h _emit 07Dh _emit 025h _emit 06Ah _emit 001h _emit 068h
        /* g_101958A8 */ dword ptr [g_101958A8]
        _emit 08Bh _emit 0CFh _emit 0E8h _emit 034h _emit 066h _emit 004h _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 085h _emit 0C0h _emit 074h _emit 01Fh _emit 00Fh _emit 0AFh _emit 074h _emit 024h _emit 00Ch _emit 08Bh _emit 044h _emit 024h _emit 010h _emit 089h _emit 030h _emit 05Eh _emit 0B0h _emit 001h _emit 05Bh _emit 0C3h _emit 04Bh _emit 053h _emit 068h
        /* g_101955B4 */ dword ptr [g_101955B4]
        _emit 0E8h _emit 081h _emit 05Eh _emit 004h _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 05Eh _emit 032h _emit 0C0h _emit 05Bh _emit 0C3h
    }
}
