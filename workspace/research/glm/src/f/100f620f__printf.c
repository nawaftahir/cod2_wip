extern int g_1017C3D8;
extern int g_101A48C0;

__declspec(naked) void _printf(void)
{
    __asm {
        _emit 06Ah _emit 010h _emit 068h
        /* g_1017C3D8 */ dword ptr [g_1017C3D8]
        _emit 0E8h _emit 0F5h _emit 053h _emit 000h _emit 000h _emit 0BEh
        /* g_101A48C0 */ dword ptr [g_101A48C0]
        _emit 056h _emit 06Ah _emit 001h _emit 0E8h _emit 0C0h _emit 052h _emit 000h _emit 000h _emit 059h _emit 059h _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 056h _emit 0E8h _emit 029h _emit 053h _emit 000h _emit 000h _emit 089h _emit 045h _emit 0E4h _emit 08Dh _emit 045h _emit 00Ch _emit 050h _emit 0FFh _emit 075h _emit 008h _emit 056h _emit 0E8h _emit 0A2h _emit 042h _emit 000h _emit 000h _emit 089h _emit 045h _emit 0E0h _emit 056h _emit 0FFh _emit 075h _emit 0E4h _emit 0E8h _emit 095h _emit 053h _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 018h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 00Eh _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 045h _emit 0E0h _emit 0E8h _emit 0E7h _emit 053h _emit 000h _emit 000h _emit 0C3h
    }
}
