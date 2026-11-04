extern int g_101A4FD0;

__declspec(naked) void __Getdays(void)
{
    __asm {
        _emit 053h _emit 055h _emit 056h _emit 057h _emit 08Bh _emit 03Dh
        /* g_101A4FD0 */ dword ptr [g_101A4FD0]
        _emit 033h _emit 0F6h _emit 033h _emit 0DBh _emit 0FFh _emit 074h _emit 09Fh _emit 01Ch _emit 0E8h _emit 061h _emit 0B8h _emit 0FFh _emit 0FFh _emit 0FFh _emit 034h _emit 09Fh _emit 08Bh _emit 0E8h _emit 0E8h _emit 057h _emit 0B8h _emit 0FFh _emit 0FFh _emit 003h _emit 0C6h _emit 043h _emit 083h _emit 0FBh _emit 007h _emit 059h _emit 059h _emit 08Dh _emit 074h _emit 028h _emit 002h _emit 072h _emit 0DFh _emit 046h _emit 056h _emit 0E8h _emit 0A6h _emit 0DAh _emit 0FFh _emit 0FFh _emit 08Bh _emit 0E8h _emit 085h _emit 0EDh _emit 059h _emit 074h _emit 03Bh _emit 08Bh _emit 0F5h _emit 033h _emit 0DBh _emit 0C6h _emit 006h _emit 03Ah _emit 0FFh _emit 034h _emit 09Fh _emit 046h _emit 056h _emit 0E8h _emit 0BAh _emit 0FEh _emit 0FFh _emit 0FFh _emit 050h _emit 0E8h _emit 024h _emit 0B8h _emit 0FFh _emit 0FFh _emit 003h _emit 0F0h _emit 0C6h _emit 006h _emit 03Ah _emit 0FFh _emit 074h _emit 09Fh _emit 01Ch _emit 046h _emit 056h _emit 0E8h _emit 0A4h _emit 0FEh _emit 0FFh _emit 0FFh _emit 050h _emit 0E8h _emit 00Eh _emit 0B8h _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 018h _emit 003h _emit 0F0h _emit 043h _emit 083h _emit 0FBh _emit 007h _emit 072h _emit 0CCh _emit 0C6h _emit 006h _emit 000h _emit 05Fh _emit 05Eh _emit 08Bh _emit 0C5h _emit 05Dh _emit 05Bh _emit 0C3h
    }
}
