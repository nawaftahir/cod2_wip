extern int g_10110420;

__declspec(naked) void FUN_10086add(void)
{
    __asm {
        _emit 08Bh _emit 0FFh _emit 056h _emit 08Bh _emit 0F1h _emit 0FFh _emit 0B6h _emit 0D0h _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 006h
        /* g_10110420 */ dword ptr [g_10110420]
        _emit 0E8h _emit 072h _emit 00Dh _emit 007h _emit 000h _emit 059h _emit 08Bh _emit 08Eh _emit 0E0h _emit 000h _emit 000h _emit 000h _emit 085h _emit 0C9h _emit 074h _emit 006h _emit 08Bh _emit 001h _emit 06Ah _emit 001h _emit 0FFh _emit 010h _emit 08Bh _emit 0CEh _emit 05Eh _emit 0E9h _emit 0FDh _emit 0F7h _emit 0FFh _emit 0FFh
    }
}
