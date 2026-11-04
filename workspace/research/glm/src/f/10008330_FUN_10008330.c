extern int g_101CE5EF;
extern int g_10678510;
extern int g_10678AC4;

__declspec(naked) void FUN_10008330(void)
{
    __asm {
        _emit 0A0h
        /* g_101CE5EF */ dword ptr [g_101CE5EF]
        _emit 084h _emit 0C0h _emit 074h _emit 066h _emit 0A1h
        /* g_10678510 */ dword ptr [g_10678510]
        _emit 056h _emit 057h _emit 08Bh _emit 0FBh _emit 08Bh _emit 0F3h _emit 06Bh _emit 0FFh _emit 034h _emit 06Bh _emit 0F6h _emit 074h _emit 003h _emit 0F0h _emit 081h _emit 0C7h
        /* g_10678AC4 */ dword ptr [g_10678AC4]
        _emit 057h _emit 08Bh _emit 0C6h _emit 0E8h _emit 066h _emit 07Ch _emit 001h _emit 000h _emit 08Bh _emit 006h _emit 083h _emit 0C4h _emit 004h _emit 083h _emit 0F8h _emit 001h _emit 075h _emit 01Fh _emit 06Ah _emit 0FFh _emit 056h _emit 057h _emit 0E8h _emit 083h _emit 073h _emit 001h _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 053h _emit 0C7h _emit 047h _emit 00Ch _emit 005h _emit 000h _emit 000h _emit 000h _emit 0E8h _emit 003h _emit 0C3h _emit 001h _emit 000h _emit 083h _emit 0C4h _emit 004h _emit 05Fh _emit 05Eh _emit 0C3h _emit 056h _emit 057h _emit 0E8h _emit 0E6h _emit 076h _emit 001h _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 053h _emit 0C7h _emit 047h _emit 00Ch _emit 005h _emit 000h _emit 000h _emit 000h _emit 0E8h _emit 0E6h _emit 0C2h _emit 001h _emit 000h _emit 083h _emit 0C4h _emit 004h _emit 05Fh _emit 05Eh _emit 0C3h
    }
}
