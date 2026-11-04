extern int g_1017C488;

__declspec(naked) void _fclose(void)
{
    __asm {
        _emit 06Ah _emit 00Ch _emit 068h
        /* g_1017C488 */ dword ptr [g_1017C488]
        _emit 0E8h _emit 07Bh _emit 045h _emit 000h _emit 000h _emit 083h _emit 04Dh _emit 0E4h _emit 0FFh _emit 08Bh _emit 075h _emit 008h _emit 0F6h _emit 046h _emit 00Ch _emit 040h _emit 074h _emit 00Dh _emit 083h _emit 066h _emit 00Ch _emit 000h _emit 08Bh _emit 045h _emit 0E4h _emit 0E8h _emit 09Dh _emit 045h _emit 000h _emit 000h _emit 0C3h _emit 056h _emit 0E8h _emit 004h _emit 044h _emit 000h _emit 000h _emit 059h _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 056h _emit 0E8h _emit 07Dh _emit 0FFh _emit 0FFh _emit 0FFh _emit 059h _emit 089h _emit 045h _emit 0E4h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 005h _emit 000h _emit 000h _emit 000h _emit 0EBh _emit 0D7h
    }
}
