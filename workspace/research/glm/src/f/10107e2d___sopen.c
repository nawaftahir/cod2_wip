extern int g_10182290;

__declspec(naked) void __sopen(void)
{
    __asm {
        _emit 06Ah _emit 014h _emit 068h
        /* g_10182290 */ dword ptr [g_10182290]
        _emit 0E8h _emit 0D7h _emit 037h _emit 0FFh _emit 0FFh _emit 083h _emit 065h _emit 0E4h _emit 000h _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 0FFh _emit 075h _emit 014h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 008h _emit 08Dh _emit 045h _emit 0E0h _emit 050h _emit 08Dh _emit 045h _emit 0E4h _emit 050h _emit 08Bh _emit 04Dh _emit 010h _emit 0E8h _emit 097h _emit 0FCh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 014h _emit 089h _emit 045h _emit 0DCh _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 009h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 045h _emit 0DCh _emit 0E8h _emit 0DAh _emit 037h _emit 0FFh _emit 0FFh _emit 0C3h
    }
}
