extern int g_101ADDD8;

__declspec(naked) void __mtinitlocks(void)
{
    __asm {
        _emit 056h _emit 057h _emit 033h _emit 0F6h _emit 0BFh
        /* g_101ADDD8 */ dword ptr [g_101ADDD8]
        _emit 083h _emit 03Ch _emit 0F5h _emit 02Ch _emit 04Bh _emit 01Ah _emit 010h _emit 001h _emit 075h _emit 01Eh _emit 08Dh _emit 004h _emit 0F5h _emit 028h _emit 04Bh _emit 01Ah _emit 010h _emit 089h _emit 038h _emit 068h _emit 0A0h _emit 00Fh _emit 000h _emit 000h _emit 0FFh _emit 030h _emit 083h _emit 0C7h _emit 018h _emit 0E8h _emit 029h _emit 0BBh _emit 000h _emit 000h _emit 085h _emit 0C0h _emit 059h _emit 059h _emit 074h _emit 00Ch _emit 046h _emit 083h _emit 0FEh _emit 024h _emit 07Ch _emit 0D2h _emit 033h _emit 0C0h _emit 040h _emit 05Fh _emit 05Eh _emit 0C3h _emit 083h _emit 024h _emit 0F5h _emit 028h _emit 04Bh _emit 01Ah _emit 010h _emit 000h _emit 033h _emit 0C0h _emit 0EBh _emit 0F1h
    }
}
