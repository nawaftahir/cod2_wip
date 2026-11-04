extern int g_101CE7EC;
extern int g_101D4A6C;
extern int g_10764584;

__declspec(naked) void FUN_10037890(void)
{
    __asm {
        _emit 08Bh _emit 00Dh
        /* g_101CE7EC */ dword ptr [g_101CE7EC]
        _emit 08Bh _emit 041h _emit 008h _emit 085h _emit 0C0h _emit 074h _emit 021h _emit 08Bh _emit 015h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 085h _emit 0D2h _emit 00Fh _emit 095h _emit 0C2h _emit 084h _emit 0D2h _emit 074h _emit 012h _emit 048h _emit 050h _emit 051h _emit 0FFh _emit 015h
        /* g_101D4A6C */ dword ptr [g_101D4A6C]
        _emit 08Bh _emit 00Dh
        /* g_101CE7EC */ dword ptr [g_101CE7EC]
        _emit 083h _emit 0C4h _emit 008h _emit 08Bh _emit 041h _emit 008h _emit 085h _emit 0C0h _emit 075h _emit 01Dh _emit 0A1h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 085h _emit 0C0h _emit 074h _emit 013h _emit 050h _emit 0E8h _emit 0B5h _emit 0F7h _emit 00Bh _emit 000h _emit 083h _emit 0C4h _emit 004h _emit 0C7h _emit 005h _emit 084h _emit 045h _emit 076h _emit 010h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 0C3h _emit 0E9h _emit 029h _emit 0FFh _emit 0FFh _emit 0FFh
    }
}
