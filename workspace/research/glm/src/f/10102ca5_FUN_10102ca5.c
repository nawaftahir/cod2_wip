extern int g_101A5210;
extern int g_101A521C;

__declspec(naked) void FUN_10102ca5(void)
{
    __asm {
        _emit 051h _emit 051h _emit 08Ah _emit 04Ch _emit 024h _emit 00Ch _emit 0F6h _emit 0C1h _emit 001h _emit 074h _emit 00Bh _emit 0DBh _emit 02Dh
        /* g_101A5210 */ dword ptr [g_101A5210]
        _emit 0DBh _emit 05Ch _emit 024h _emit 00Ch _emit 09Bh _emit 0F6h _emit 0C1h _emit 008h _emit 074h _emit 010h _emit 09Bh _emit 0DFh _emit 0E0h _emit 0DBh _emit 02Dh
        /* g_101A5210 */ dword ptr [g_101A5210]
        _emit 0DDh _emit 01Ch _emit 024h _emit 09Bh _emit 09Bh _emit 0DFh _emit 0E0h _emit 0F6h _emit 0C1h _emit 010h _emit 074h _emit 00Ah _emit 0DBh _emit 02Dh
        /* g_101A521C */ dword ptr [g_101A521C]
        _emit 0DDh _emit 01Ch _emit 024h _emit 09Bh _emit 0F6h _emit 0C1h _emit 004h _emit 074h _emit 009h _emit 0D9h _emit 0EEh _emit 0D9h _emit 0E8h _emit 0DEh _emit 0F1h _emit 0DDh _emit 0D8h _emit 09Bh _emit 0F6h _emit 0C1h _emit 020h _emit 074h _emit 006h _emit 0D9h _emit 0EBh _emit 0DDh _emit 01Ch _emit 024h _emit 09Bh _emit 059h _emit 059h _emit 0C3h
    }
}
