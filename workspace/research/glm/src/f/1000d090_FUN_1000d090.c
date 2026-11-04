extern int g_101D0A68;
extern int g_101D0A6C;
extern int g_101D0A70;

__declspec(naked) void FUN_1000d090(void)
{
    __asm {
        _emit 00Fh _emit 0B6h _emit 0C0h _emit 083h _emit 0F8h _emit 005h _emit 077h _emit 034h _emit 0FFh _emit 024h _emit 085h _emit 0D4h _emit 0D0h _emit 000h _emit 010h _emit 0A1h
        /* g_101D0A68 */ dword ptr [g_101D0A68]
        _emit 0EBh _emit 00Ch _emit 0A1h
        /* g_101D0A6C */ dword ptr [g_101D0A6C]
        _emit 0EBh _emit 005h _emit 0A1h
        /* g_101D0A70 */ dword ptr [g_101D0A70]
        _emit 085h _emit 0C0h _emit 0C6h _emit 041h _emit 001h _emit 002h _emit 07Dh _emit 005h _emit 033h _emit 0C0h _emit 088h _emit 001h _emit 0C3h _emit 083h _emit 0F8h _emit 003h _emit 07Eh _emit 005h _emit 0B8h _emit 003h _emit 000h _emit 000h _emit 000h _emit 088h _emit 001h _emit 0C3h _emit 066h _emit 0C7h _emit 001h _emit 000h _emit 000h _emit 0C3h
    }
}
