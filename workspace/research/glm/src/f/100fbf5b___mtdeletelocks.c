extern int g_1010C038;
extern int g_101A4B28;
extern int g_101A4C48;

__declspec(naked) void __mtdeletelocks(void)
{
    __asm {
        _emit 053h _emit 08Bh _emit 01Dh
        /* g_1010C038 */ dword ptr [g_1010C038]
        _emit 056h _emit 0BEh
        /* g_101A4B28 */ dword ptr [g_101A4B28]
        _emit 057h _emit 08Bh _emit 03Eh _emit 085h _emit 0FFh _emit 074h _emit 013h _emit 083h _emit 07Eh _emit 004h _emit 001h _emit 074h _emit 00Dh _emit 057h _emit 0FFh _emit 0D3h _emit 057h _emit 0E8h _emit 052h _emit 0C5h _emit 0FFh _emit 0FFh _emit 083h _emit 026h _emit 000h _emit 059h _emit 083h _emit 0C6h _emit 008h _emit 081h _emit 0FEh
        /* g_101A4C48 */ dword ptr [g_101A4C48]
        _emit 07Ch _emit 0DCh _emit 0BEh
        /* g_101A4B28 */ dword ptr [g_101A4B28]
        _emit 05Fh _emit 08Bh _emit 006h _emit 085h _emit 0C0h _emit 074h _emit 009h _emit 083h _emit 07Eh _emit 004h _emit 001h _emit 075h _emit 003h _emit 050h _emit 0FFh _emit 0D3h _emit 083h _emit 0C6h _emit 008h _emit 081h _emit 0FEh
        /* g_101A4C48 */ dword ptr [g_101A4C48]
        _emit 07Ch _emit 0E6h _emit 05Eh _emit 05Bh _emit 0C3h
    }
}
