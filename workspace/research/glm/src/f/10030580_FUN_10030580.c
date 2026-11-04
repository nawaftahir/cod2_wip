extern int g_1072DECC;
extern int g_1072DED0;

__declspec(naked) void FUN_10030580(void)
{
    __asm {
        _emit 051h _emit 0A1h
        /* g_1072DED0 */ dword ptr [g_1072DED0]
        _emit 056h _emit 08Bh _emit 035h
        /* g_1072DECC */ dword ptr [g_1072DECC]
        _emit 057h _emit 033h _emit 0FFh _emit 085h _emit 0C0h _emit 07Eh _emit 025h _emit 08Bh _emit 004h _emit 0BDh _emit 0D4h _emit 0DEh _emit 072h _emit 010h _emit 050h _emit 08Bh _emit 0C6h _emit 0E8h _emit 02Dh _emit 0FFh _emit 0FFh _emit 0FFh _emit 0A1h
        /* g_1072DED0 */ dword ptr [g_1072DED0]
        _emit 0B9h _emit 001h _emit 000h _emit 000h _emit 000h _emit 02Bh _emit 0CEh _emit 083h _emit 0C4h _emit 004h _emit 047h _emit 03Bh _emit 0F8h _emit 08Bh _emit 0F1h _emit 07Ch _emit 0DBh _emit 05Fh _emit 0C7h _emit 005h _emit 0D0h _emit 0DEh _emit 072h _emit 010h
        /* g_1072DED0 */ dword ptr [g_1072DED0]
        _emit 05Eh _emit 059h _emit 0C3h
    }
}
