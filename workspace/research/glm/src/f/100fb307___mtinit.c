extern int g_100FB0DB;
extern int g_100FB185;
extern int g_1010C04C;
extern int g_1010C07C;
extern int g_1010C0FC;
extern int g_1010C118;
extern int g_1010C11C;
extern int g_1010C120;
extern int g_1017C7C0;
extern int g_1017C7C8;
extern int g_1017C7D4;
extern int g_1017C7E0;
extern int g_1017C7EC;
extern int g_101A4898;
extern int g_101A4E88;
extern int g_101ADDB8;
extern int g_101ADDBC;
extern int g_101ADDC0;
extern int g_101ADDC4;

__declspec(naked) void __mtinit(void)
{
    __asm {
        _emit 0E8h _emit 006h _emit 00Ch _emit 000h _emit 000h _emit 085h _emit 0C0h _emit 075h _emit 008h _emit 0E8h _emit 0CFh _emit 0FDh _emit 0FFh _emit 0FFh _emit 033h _emit 0C0h _emit 0C3h _emit 056h _emit 057h _emit 068h
        /* g_1017C7EC */ dword ptr [g_1017C7EC]
        _emit 0FFh _emit 015h
        /* g_1010C07C */ dword ptr [g_1010C07C]
        _emit 08Bh _emit 0F8h _emit 085h _emit 0FFh _emit 074h _emit 06Bh _emit 08Bh _emit 035h
        /* g_1010C04C */ dword ptr [g_1010C04C]
        _emit 068h
        /* g_1017C7E0 */ dword ptr [g_1017C7E0]
        _emit 057h _emit 0FFh _emit 0D6h _emit 068h
        /* g_1017C7D4 */ dword ptr [g_1017C7D4]
        _emit 057h _emit 0A3h
        /* g_101ADDB8 */ dword ptr [g_101ADDB8]
        _emit 0FFh _emit 0D6h _emit 068h
        /* g_1017C7C8 */ dword ptr [g_1017C7C8]
        _emit 057h _emit 0A3h
        /* g_101ADDBC */ dword ptr [g_101ADDBC]
        _emit 0FFh _emit 0D6h _emit 068h
        /* g_1017C7C0 */ dword ptr [g_1017C7C0]
        _emit 057h _emit 0A3h
        /* g_101ADDC0 */ dword ptr [g_101ADDC0]
        _emit 0FFh _emit 0D6h _emit 083h _emit 03Dh _emit 0BCh
        /* g_101ADDBC */ dword ptr [g_101ADDBC]
        _emit 0A3h
        /* g_101ADDC4 */ dword ptr [g_101ADDC4]
        _emit 075h _emit 028h _emit 0A1h
        /* g_1010C120 */ dword ptr [g_1010C120]
        _emit 0A3h
        /* g_101ADDBC */ dword ptr [g_101ADDBC]
        _emit 0A1h
        /* g_1010C11C */ dword ptr [g_1010C11C]
        _emit 0A3h
        /* g_101ADDC0 */ dword ptr [g_101ADDC0]
        _emit 0A1h
        /* g_1010C118 */ dword ptr [g_1010C118]
        _emit 0C7h _emit 005h _emit 0B8h _emit 0DDh _emit 01Ah _emit 010h
        /* g_100FB0DB */ dword ptr [g_100FB0DB]
        _emit 0A3h
        /* g_101ADDC4 */ dword ptr [g_101ADDC4]
        _emit 068h
        /* g_100FB185 */ dword ptr [g_100FB185]
        _emit 0FFh _emit 015h
        /* g_101ADDB8 */ dword ptr [g_101ADDB8]
        _emit 083h _emit 0F8h _emit 0FFh _emit 0A3h
        /* g_101A4898 */ dword ptr [g_101A4898]
        _emit 074h _emit 041h _emit 033h _emit 0FFh _emit 068h _emit 08Ch _emit 000h _emit 000h _emit 000h _emit 047h _emit 057h _emit 0E8h _emit 010h _emit 024h _emit 000h _emit 000h _emit 08Bh _emit 0F0h _emit 085h _emit 0F6h _emit 059h _emit 059h _emit 074h _emit 02Bh _emit 056h _emit 0FFh _emit 035h
        /* g_101A4898 */ dword ptr [g_101A4898]
        _emit 0FFh _emit 015h
        /* g_101ADDC0 */ dword ptr [g_101ADDC0]
        _emit 085h _emit 0C0h _emit 074h _emit 01Ah _emit 0C7h _emit 046h _emit 054h
        /* g_101A4E88 */ dword ptr [g_101A4E88]
        _emit 089h _emit 07Eh _emit 014h _emit 0FFh _emit 015h
        /* g_1010C0FC */ dword ptr [g_1010C0FC]
        _emit 083h _emit 04Eh _emit 004h _emit 0FFh _emit 089h _emit 006h _emit 08Bh _emit 0C7h _emit 0EBh _emit 007h _emit 0E8h _emit 0F3h _emit 0FCh _emit 0FFh _emit 0FFh _emit 033h _emit 0C0h _emit 05Fh _emit 05Eh _emit 0C3h
    }
}
