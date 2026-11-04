extern int g_101A66B0;
extern int g_101AAC70;

__declspec(naked) void FUN_1005f4d0(void)
{
    __asm {
        _emit 08Bh _emit 015h
        /* g_101AAC70 */ dword ptr [g_101AAC70]
        _emit 00Fh _emit 0BEh _emit 008h _emit 069h _emit 0D2h _emit 05Ch _emit 004h _emit 000h _emit 000h _emit 081h _emit 0C2h
        /* g_101A66B0 */ dword ptr [g_101A66B0]
        _emit 083h _emit 0F9h _emit 020h _emit 07Fh _emit 028h _emit 08Dh _emit 09Bh _emit 000h _emit 000h _emit 000h _emit 000h _emit 085h _emit 0C9h _emit 074h _emit 01Ch _emit 083h _emit 0F9h _emit 00Ah _emit 075h _emit 00Ch _emit 0FFh _emit 082h _emit 000h _emit 004h _emit 000h _emit 000h _emit 0C7h _emit 006h _emit 001h _emit 000h _emit 000h _emit 000h _emit 00Fh _emit 0BEh _emit 048h _emit 001h _emit 040h _emit 083h _emit 0F9h _emit 020h _emit 07Eh _emit 0E1h _emit 0C3h _emit 033h _emit 0C0h _emit 0C3h
    }
}
