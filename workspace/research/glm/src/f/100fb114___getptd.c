extern int g_1010C054;
extern int g_1010C0FC;
extern int g_1010C110;
extern int g_101A4898;
extern int g_101A4E88;
extern int g_101ADDBC;
extern int g_101ADDC0;

__declspec(naked) void __getptd(void)
{
    __asm {
        _emit 053h _emit 056h _emit 0FFh _emit 015h
        /* g_1010C054 */ dword ptr [g_1010C054]
        _emit 0FFh _emit 035h
        /* g_101A4898 */ dword ptr [g_101A4898]
        _emit 08Bh _emit 0D8h _emit 0FFh _emit 015h
        /* g_101ADDBC */ dword ptr [g_101ADDBC]
        _emit 08Bh _emit 0F0h _emit 085h _emit 0F6h _emit 075h _emit 049h _emit 068h _emit 08Ch _emit 000h _emit 000h _emit 000h _emit 06Ah _emit 001h _emit 0E8h _emit 08Dh _emit 026h _emit 000h _emit 000h _emit 08Bh _emit 0F0h _emit 085h _emit 0F6h _emit 059h _emit 059h _emit 074h _emit 02Dh _emit 056h _emit 0FFh _emit 035h
        /* g_101A4898 */ dword ptr [g_101A4898]
        _emit 0FFh _emit 015h
        /* g_101ADDC0 */ dword ptr [g_101ADDC0]
        _emit 085h _emit 0C0h _emit 074h _emit 01Ch _emit 0C7h _emit 046h _emit 054h
        /* g_101A4E88 */ dword ptr [g_101A4E88]
        _emit 0C7h _emit 046h _emit 014h _emit 001h _emit 000h _emit 000h _emit 000h _emit 0FFh _emit 015h
        /* g_1010C0FC */ dword ptr [g_1010C0FC]
        _emit 083h _emit 04Eh _emit 004h _emit 0FFh _emit 089h _emit 006h _emit 0EBh _emit 008h _emit 06Ah _emit 010h _emit 0E8h _emit 0BAh _emit 0C6h _emit 0FFh _emit 0FFh _emit 059h _emit 053h _emit 0FFh _emit 015h
        /* g_1010C110 */ dword ptr [g_1010C110]
        _emit 08Bh _emit 0C6h _emit 05Eh _emit 05Bh _emit 0C3h
    }
}
