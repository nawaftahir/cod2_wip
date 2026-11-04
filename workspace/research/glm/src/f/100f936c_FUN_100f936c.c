extern int g_101A529A;
extern int g_1076ADB0;

__declspec(naked) void FUN_100f936c(void)
{
    __asm {
        _emit 083h _emit 03Dh _emit 0B0h
        /* g_1076ADB0 */ dword ptr [g_1076ADB0]
        _emit 074h _emit 03Ch _emit 083h _emit 0ECh _emit 008h _emit 00Fh _emit 0AEh _emit 05Ch _emit 024h _emit 004h _emit 08Bh _emit 044h _emit 024h _emit 004h _emit 025h _emit 080h _emit 01Fh _emit 000h _emit 000h _emit 03Dh _emit 080h _emit 01Fh _emit 000h _emit 000h _emit 075h _emit 00Fh _emit 0D9h _emit 03Ch _emit 024h _emit 066h _emit 08Bh _emit 004h _emit 024h _emit 066h _emit 083h _emit 0E0h _emit 07Fh _emit 066h _emit 083h _emit 0F8h _emit 07Fh _emit 08Dh _emit 064h _emit 024h _emit 008h _emit 075h _emit 00Fh _emit 0E9h _emit 029h _emit 0BEh _emit 000h _emit 000h _emit 0BAh
        /* g_101A529A */ dword ptr [g_101A529A]
        _emit 0E9h _emit 020h _emit 0B0h _emit 000h _emit 000h
    }
}
