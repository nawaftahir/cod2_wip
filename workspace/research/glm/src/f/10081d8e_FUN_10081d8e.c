extern int g_1010FF38;

__declspec(naked) void FUN_10081d8e(void)
{
    __asm {
        _emit 0E8h _emit 073h _emit 0FFh _emit 0FFh _emit 0FFh _emit 083h _emit 061h _emit 010h _emit 000h _emit 083h _emit 061h _emit 014h _emit 000h _emit 0C7h _emit 001h
        /* g_1010FF38 */ dword ptr [g_1010FF38]
        _emit 08Bh _emit 0C1h _emit 0C3h
    }
}
