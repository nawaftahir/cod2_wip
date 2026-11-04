extern int g_101CE684;
extern int g_101D1B9C;
extern int g_1072DDB8;
extern int g_10764590;

__declspec(naked) void FUN_1003c050(void)
{
    __asm {
        _emit 051h _emit 08Bh _emit 00Dh
        /* g_1072DDB8 */ dword ptr [g_1072DDB8]
        _emit 056h _emit 08Dh _emit 034h _emit 040h _emit 0C1h _emit 0E6h _emit 004h _emit 081h _emit 0C6h
        /* g_10764590 */ dword ptr [g_10764590]
        _emit 08Bh _emit 046h _emit 00Ch _emit 085h _emit 0C0h _emit 057h _emit 074h _emit 00Ah _emit 03Bh _emit 0C1h _emit 07Fh _emit 006h _emit 08Bh _emit 0F9h _emit 02Bh _emit 0F8h _emit 0EBh _emit 005h _emit 0BFh _emit 00Ah _emit 000h _emit 000h _emit 000h _emit 0A1h
        /* g_101CE684 */ dword ptr [g_101CE684]
        _emit 089h _emit 04Eh _emit 00Ch _emit 08Ah _emit 048h _emit 008h _emit 084h _emit 0C9h _emit 074h _emit 022h _emit 08Bh _emit 00Dh
        /* g_101D1B9C */ dword ptr [g_101D1B9C]
        _emit 08Ah _emit 081h _emit 060h _emit 001h _emit 000h _emit 000h _emit 084h _emit 0C0h _emit 074h _emit 012h _emit 057h _emit 08Bh _emit 0D6h _emit 0E8h _emit 03Eh _emit 0FCh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 004h _emit 08Bh _emit 0D6h _emit 0E8h _emit 0B4h _emit 0FEh _emit 0FFh _emit 0FFh _emit 05Fh _emit 05Eh _emit 059h _emit 0C3h
    }
}
