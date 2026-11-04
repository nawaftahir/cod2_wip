extern int g_1019BD8C;
extern int g_1019BE40;

__declspec(naked) void FUN_10012ee0(void)
{
    __asm {
        _emit 051h _emit 033h _emit 0C0h _emit 089h _emit 004h _emit 024h _emit 0DBh _emit 004h _emit 024h _emit 040h _emit 03Dh _emit 000h _emit 004h _emit 000h _emit 000h _emit 089h _emit 004h _emit 024h _emit 0D8h _emit 00Dh
        /* g_1019BE40 */ dword ptr [g_1019BE40]
        _emit 0D8h _emit 00Dh
        /* g_1019BD8C */ dword ptr [g_1019BD8C]
        _emit 0D9h _emit 0FEh _emit 0D9h _emit 01Ch _emit 085h _emit 00Ch _emit 062h _emit 01Dh _emit 010h _emit 07Ch _emit 0DDh _emit 059h _emit 0C3h
    }
}
