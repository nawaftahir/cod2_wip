extern int g_101822C0;

__declspec(naked) void __onexit(void)
{
    __asm {
        _emit 06Ah _emit 00Ch _emit 068h
        /* g_101822C0 */ dword ptr [g_101822C0]
        _emit 0E8h _emit 0C9h _emit 033h _emit 0FFh _emit 0FFh _emit 0E8h _emit 0C8h _emit 053h _emit 0FFh _emit 0FFh _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 08Bh _emit 07Dh _emit 008h _emit 0E8h _emit 03Bh _emit 0FFh _emit 0FFh _emit 0FFh _emit 089h _emit 045h _emit 0E4h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 009h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 045h _emit 0E4h _emit 0E8h _emit 0DFh _emit 033h _emit 0FFh _emit 0FFh _emit 0C3h
    }
}
