extern int g_1010C038;
extern int g_1076ACA0;
extern int g_1076ADA0;

__declspec(naked) void __ioterm(void)
{
    __asm {
        _emit 056h _emit 057h _emit 0BEh
        /* g_1076ACA0 */ dword ptr [g_1076ACA0]
        _emit 08Bh _emit 03Eh _emit 085h _emit 0FFh _emit 074h _emit 031h _emit 08Dh _emit 087h _emit 080h _emit 004h _emit 000h _emit 000h _emit 0EBh _emit 01Ah _emit 083h _emit 07Fh _emit 008h _emit 000h _emit 074h _emit 00Ah _emit 08Dh _emit 047h _emit 00Ch _emit 050h _emit 0FFh _emit 015h
        /* g_1010C038 */ dword ptr [g_1010C038]
        _emit 08Bh _emit 006h _emit 083h _emit 0C7h _emit 024h _emit 005h _emit 080h _emit 004h _emit 000h _emit 000h _emit 03Bh _emit 0F8h _emit 072h _emit 0E2h _emit 0FFh _emit 036h _emit 0E8h _emit 014h _emit 0AAh _emit 0FFh _emit 0FFh _emit 083h _emit 026h _emit 000h _emit 059h _emit 083h _emit 0C6h _emit 004h _emit 081h _emit 0FEh
        /* g_1076ADA0 */ dword ptr [g_1076ADA0]
        _emit 07Ch _emit 0BEh _emit 05Fh _emit 05Eh _emit 0C3h
    }
}
