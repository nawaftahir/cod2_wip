extern int g_101AC95C;

__declspec(naked) void FUN_1006518e(void)
{
    __asm {
        _emit 08Bh _emit 081h _emit 0A8h _emit 002h _emit 000h _emit 000h _emit 0A3h
        /* g_101AC95C */ dword ptr [g_101AC95C]
        _emit 083h _emit 0A1h _emit 0A4h _emit 002h _emit 000h _emit 000h _emit 000h _emit 0E9h _emit 024h _emit 0E8h _emit 0FFh _emit 0FFh
    }
}
