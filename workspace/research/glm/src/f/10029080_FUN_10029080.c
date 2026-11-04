extern int g_101970CC;
extern int g_101A5A38;
extern int g_101D4AE0;
extern int g_101D4B14;

__declspec(naked) void FUN_10029080(void)
{
    __asm {
        _emit 0B8h _emit 000h _emit 020h _emit 000h _emit 000h _emit 0E8h _emit 0A6h _emit 0F7h _emit 00Ch _emit 000h _emit 068h _emit 000h _emit 020h _emit 000h _emit 000h _emit 08Dh _emit 044h _emit 024h _emit 004h _emit 050h _emit 06Ah _emit 015h _emit 068h
        /* g_101A5A38 */ dword ptr [g_101A5A38]
        _emit 0FFh _emit 015h
        /* g_101D4AE0 */ dword ptr [g_101D4AE0]
        _emit 083h _emit 0C4h _emit 010h _emit 085h _emit 0C0h _emit 074h _emit 036h _emit 08Dh _emit 004h _emit 024h _emit 08Dh _emit 050h _emit 001h _emit 08Bh _emit 0FFh _emit 08Ah _emit 008h _emit 040h _emit 084h _emit 0C9h _emit 075h _emit 0F9h _emit 02Bh _emit 0C2h _emit 08Bh _emit 094h _emit 024h _emit 004h _emit 020h _emit 000h _emit 000h _emit 050h _emit 08Dh _emit 04Ch _emit 024h _emit 004h _emit 051h _emit 052h _emit 068h
        /* g_101970CC */ dword ptr [g_101970CC]
        _emit 0E8h _emit 09Fh _emit 07Bh _emit 003h _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 050h _emit 0FFh _emit 015h
        /* g_101D4B14 */ dword ptr [g_101D4B14]
        _emit 083h _emit 0C4h _emit 00Ch _emit 081h _emit 0C4h _emit 000h _emit 020h _emit 000h _emit 000h _emit 0C3h
    }
}
