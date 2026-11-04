extern int g_10194250;
extern int g_101AE4B8;
extern int g_101AE4C0;
extern int g_101AE4CC;
extern int g_101AE4D8;
extern int g_101AE4F0;
extern int g_101AE508;
extern int g_101D1B28;
extern int g_101D4D00;
extern int g_101D5D28;
extern int g_101D616C;
extern int g_101D620C;

__declspec(naked) void FUN_10012040(void)
{
    __asm {
        _emit 057h _emit 0E8h _emit 03Ah _emit 0B8h _emit 0FFh _emit 0FFh _emit 0E8h _emit 095h _emit 053h _emit 000h _emit 000h _emit 0B8h
        /* g_10194250 */ dword ptr [g_10194250]
        _emit 0C7h _emit 005h _emit 028h _emit 05Dh _emit 01Dh _emit 010h
        /* g_101D5D28 */ dword ptr [g_101D5D28]
        _emit 0E8h _emit 001h _emit 02Ch _emit 000h _emit 000h _emit 0A3h
        /* g_101D1B28 */ dword ptr [g_101D1B28]
        _emit 033h _emit 0C0h _emit 0B9h _emit 028h _emit 000h _emit 000h _emit 000h _emit 0BFh
        /* g_101D616C */ dword ptr [g_101D616C]
        _emit 0F3h _emit 0ABh _emit 0B9h _emit 015h _emit 000h _emit 000h _emit 000h _emit 0BFh
        /* g_101AE4B8 */ dword ptr [g_101AE4B8]
        _emit 0F3h _emit 0ABh _emit 0A3h
        /* g_101D620C */ dword ptr [g_101D620C]
        _emit 0B8h _emit 000h _emit 010h _emit 000h _emit 000h _emit 0A3h
        /* g_101AE4C0 */ dword ptr [g_101AE4C0]
        _emit 0C7h _emit 005h _emit 0CCh _emit 0E4h _emit 01Ah _emit 010h
        /* g_101AE4CC */ dword ptr [g_101AE4CC]
        _emit 0A3h
        /* g_101AE4D8 */ dword ptr [g_101AE4D8]
        _emit 0C7h _emit 005h _emit 0F0h _emit 0E4h _emit 01Ah _emit 010h
        /* g_101AE4F0 */ dword ptr [g_101AE4F0]
        _emit 0A3h
        /* g_101AE508 */ dword ptr [g_101AE508]
        _emit 0C6h _emit 005h _emit 000h
        /* g_101D4D00 */ dword ptr [g_101D4D00]
        _emit 05Fh _emit 0C3h
    }
}
