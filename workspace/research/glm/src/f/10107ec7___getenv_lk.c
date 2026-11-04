extern int g_101AE02C;
extern int g_101AE034;
extern int g_1076ADA0;

__declspec(naked) void __getenv_lk(void)
{
    __asm {
        _emit 083h _emit 03Dh _emit 0A0h
        /* g_1076ADA0 */ dword ptr [g_1076ADA0]
        _emit 056h _emit 08Bh _emit 035h
        /* g_101AE02C */ dword ptr [g_101AE02C]
        _emit 075h _emit 004h _emit 033h _emit 0C0h _emit 05Eh _emit 0C3h _emit 085h _emit 0F6h _emit 053h _emit 057h _emit 075h _emit 01Bh _emit 039h _emit 035h
        /* g_101AE034 */ dword ptr [g_101AE034]
        _emit 074h _emit 051h _emit 0E8h _emit 04Fh _emit 016h _emit 000h _emit 000h _emit 085h _emit 0C0h _emit 075h _emit 048h _emit 08Bh _emit 035h
        /* g_101AE02C */ dword ptr [g_101AE02C]
        _emit 085h _emit 0F6h _emit 074h _emit 03Eh _emit 08Bh _emit 05Ch _emit 024h _emit 010h _emit 085h _emit 0DBh _emit 074h _emit 036h _emit 053h _emit 0E8h _emit 0F6h _emit 022h _emit 0FFh _emit 0FFh _emit 059h _emit 08Bh _emit 0F8h _emit 0EBh _emit 025h _emit 050h _emit 0E8h _emit 0EBh _emit 022h _emit 0FFh _emit 0FFh _emit 03Bh _emit 0C7h _emit 059h _emit 076h _emit 017h _emit 08Bh _emit 006h _emit 080h _emit 03Ch _emit 038h _emit 03Dh _emit 075h _emit 00Fh _emit 057h _emit 053h _emit 050h _emit 0E8h _emit 0C5h _emit 015h _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 085h _emit 0C0h _emit 074h _emit 00Fh _emit 083h _emit 0C6h _emit 004h _emit 08Bh _emit 006h _emit 085h _emit 0C0h _emit 075h _emit 0D5h _emit 033h _emit 0C0h _emit 05Fh _emit 05Bh _emit 05Eh _emit 0C3h _emit 08Bh _emit 006h _emit 08Dh _emit 044h _emit 038h _emit 001h _emit 0EBh _emit 0F4h
    }
}
