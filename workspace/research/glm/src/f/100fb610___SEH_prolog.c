extern int g_100FB664;

__declspec(naked) void __SEH_prolog(void)
{
    __asm {
        _emit 068h
        /* g_100FB664 */ dword ptr [g_100FB664]
        _emit 064h _emit 0A1h _emit 000h _emit 000h _emit 000h _emit 000h _emit 050h _emit 08Bh _emit 044h _emit 024h _emit 010h _emit 089h _emit 06Ch _emit 024h _emit 010h _emit 08Dh _emit 06Ch _emit 024h _emit 010h _emit 02Bh _emit 0E0h _emit 053h _emit 056h _emit 057h _emit 08Bh _emit 045h _emit 0F8h _emit 089h _emit 065h _emit 0E8h _emit 050h _emit 08Bh _emit 045h _emit 0FCh _emit 0C7h _emit 045h _emit 0FCh _emit 0FFh _emit 0FFh _emit 0FFh _emit 0FFh _emit 089h _emit 045h _emit 0F8h _emit 08Dh _emit 045h _emit 0F0h _emit 064h _emit 0A3h _emit 000h _emit 000h _emit 000h _emit 000h _emit 0C3h
    }
}
