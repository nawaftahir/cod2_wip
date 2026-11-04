extern int g_101CE708;
extern int g_101D4970;
extern int g_101D4980;
extern int g_101D4998;
extern int g_101D49C0;
extern int g_101D49E8;

__declspec(naked) void FUN_10011b60(void)
{
    __asm {
        _emit 0A1h
        /* g_101CE708 */ dword ptr [g_101CE708]
        _emit 08Bh _emit 050h _emit 008h _emit 033h _emit 0C9h _emit 083h _emit 0FAh _emit 002h _emit 00Fh _emit 095h _emit 0C1h _emit 056h _emit 0B8h
        /* g_101D4998 */ dword ptr [g_101D4998]
        _emit 049h _emit 083h _emit 0E1h _emit 0E4h _emit 083h _emit 0C1h _emit 040h _emit 0C1h _emit 0E1h _emit 00Fh _emit 0E8h _emit 0BBh _emit 0FEh _emit 0FFh _emit 0FFh _emit 0C7h _emit 005h _emit 0A4h _emit 049h _emit 01Dh _emit 010h
        /* g_101D4998 */ dword ptr [g_101D4998]
        _emit 0BEh
        /* g_101D4980 */ dword ptr [g_101D4980]
        _emit 08Bh _emit 015h
        /* g_101CE708 */ dword ptr [g_101CE708]
        _emit 08Bh _emit 042h _emit 008h _emit 033h _emit 0C9h _emit 083h _emit 0F8h _emit 002h _emit 00Fh _emit 095h _emit 0C1h _emit 08Bh _emit 0C6h _emit 049h _emit 083h _emit 0E1h _emit 0E4h _emit 083h _emit 0C1h _emit 040h _emit 0C1h _emit 0E1h _emit 011h _emit 0E8h _emit 08Ah _emit 0FEh _emit 0FFh _emit 0FFh _emit 083h _emit 0C6h _emit 00Ch _emit 081h _emit 0FEh
        /* g_101D4998 */ dword ptr [g_101D4998]
        _emit 075h _emit 0D3h _emit 0B9h _emit 000h _emit 000h _emit 020h _emit 000h _emit 0B8h
        /* g_101D4970 */ dword ptr [g_101D4970]
        _emit 0E8h _emit 000h _emit 0FFh _emit 0FFh _emit 0FFh _emit 068h _emit 000h _emit 000h _emit 0A0h _emit 000h _emit 0C7h _emit 005h _emit 07Ch _emit 049h _emit 01Dh _emit 010h
        /* g_101D4970 */ dword ptr [g_101D4970]
        _emit 0FFh _emit 015h
        /* g_101D49E8 */ dword ptr [g_101D49E8]
        _emit 083h _emit 0C4h _emit 004h _emit 0A3h
        /* g_101D49C0 */ dword ptr [g_101D49C0]
        _emit 05Eh _emit 0C3h
    }
}
