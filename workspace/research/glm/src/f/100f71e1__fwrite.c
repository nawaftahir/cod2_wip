extern int g_1017C498;

__declspec(naked) void _fwrite(void)
{
    __asm {
        _emit 06Ah _emit 00Ch _emit 068h
        /* g_1017C498 */ dword ptr [g_1017C498]
        _emit 0E8h _emit 023h _emit 044h _emit 000h _emit 000h _emit 0FFh _emit 075h _emit 014h _emit 0E8h _emit 0C4h _emit 042h _emit 000h _emit 000h _emit 059h _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 0FFh _emit 075h _emit 014h _emit 0FFh _emit 075h _emit 010h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 008h _emit 0E8h _emit 0CFh _emit 0FEh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 010h _emit 089h _emit 045h _emit 0E4h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 009h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 045h _emit 0E4h _emit 0E8h _emit 029h _emit 044h _emit 000h _emit 000h _emit 0C3h
    }
}
