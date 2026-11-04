extern int g_101925CC;
extern int g_1019BC84;
extern int g_101D1B9C;

__declspec(naked) void FUN_10007d60(void)
{
    __asm {
        _emit 0A1h
        /* g_101D1B9C */ dword ptr [g_101D1B9C]
        _emit 085h _emit 0C0h _emit 075h _emit 00Fh _emit 068h
        /* g_101925CC */ dword ptr [g_101925CC]
        _emit 06Ah _emit 001h _emit 0E8h _emit 04Bh _emit 0BBh _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 0A1h
        /* g_101D1B9C */ dword ptr [g_101D1B9C]
        _emit 08Bh _emit 048h _emit 00Ch _emit 083h _emit 039h _emit 0FFh _emit 075h _emit 034h _emit 08Bh _emit 041h _emit 00Ch _emit 0D9h _emit 040h _emit 008h _emit 0D8h _emit 04Eh _emit 008h _emit 0D9h _emit 040h _emit 004h _emit 0D8h _emit 04Eh _emit 004h _emit 0DEh _emit 0C1h _emit 0D9h _emit 000h _emit 0D8h _emit 00Eh _emit 0DEh _emit 0C1h _emit 0D8h _emit 060h _emit 00Ch _emit 0D8h _emit 01Dh
        /* g_1019BC84 */ dword ptr [g_1019BC84]
        _emit 0DFh _emit 0E0h _emit 0F6h _emit 0C4h _emit 041h _emit 075h _emit 005h _emit 08Bh _emit 049h _emit 010h _emit 0EBh _emit 003h _emit 08Bh _emit 049h _emit 014h _emit 083h _emit 039h _emit 0FFh _emit 074h _emit 0CCh _emit 08Bh _emit 041h _emit 008h _emit 0C3h
    }
}
