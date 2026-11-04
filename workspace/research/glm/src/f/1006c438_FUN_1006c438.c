extern int g_101AC95C;

__declspec(naked) void FUN_1006c438(void)
{
    __asm {
        _emit 08Bh _emit 0FFh _emit 055h _emit 08Bh _emit 0ECh _emit 08Bh _emit 00Dh
        /* g_101AC95C */ dword ptr [g_101AC95C]
        _emit 05Dh _emit 0E9h _emit 074h _emit 062h _emit 001h _emit 000h
    }
}
