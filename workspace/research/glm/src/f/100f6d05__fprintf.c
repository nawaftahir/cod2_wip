extern int g_1017C478;

__declspec(naked) void _fprintf(void)
{
    __asm {
        _emit 06Ah _emit 014h _emit 068h
        /* g_1017C478 */ dword ptr [g_1017C478]
        _emit 0E8h _emit 0FFh _emit 048h _emit 000h _emit 000h _emit 08Bh _emit 075h _emit 008h _emit 089h _emit 075h _emit 0E0h _emit 056h _emit 0E8h _emit 09Ch _emit 047h _emit 000h _emit 000h _emit 059h _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 056h _emit 0E8h _emit 035h _emit 048h _emit 000h _emit 000h _emit 089h _emit 045h _emit 0E4h _emit 08Dh _emit 045h _emit 010h _emit 050h _emit 0FFh _emit 075h _emit 00Ch _emit 056h _emit 0E8h _emit 0AEh _emit 037h _emit 000h _emit 000h _emit 089h _emit 045h _emit 0DCh _emit 056h _emit 0FFh _emit 075h _emit 0E4h _emit 0E8h _emit 0A1h _emit 048h _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 018h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 009h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 045h _emit 0DCh _emit 0E8h _emit 0F3h _emit 048h _emit 000h _emit 000h _emit 0C3h
    }
}
