extern int g_101A50D0;

__declspec(naked) void __security_check_cookie(void)
{
    __asm {
        _emit 03Bh _emit 00Dh
        /* g_101A50D0 */ dword ptr [g_101A50D0]
        _emit 075h _emit 001h _emit 0C3h _emit 0E9h _emit 0C1h _emit 0FFh _emit 0FFh _emit 0FFh
    }
}
