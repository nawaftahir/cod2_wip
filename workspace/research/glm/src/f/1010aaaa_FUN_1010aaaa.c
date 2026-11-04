extern int g_101AB0D0;

__declspec(naked) void FUN_1010aaaa(void)
{
    __asm {
        _emit 0BAh
        /* g_101AB0D0 */ dword ptr [g_101AB0D0]
        _emit 0E9h _emit 00Ch _emit 097h _emit 0FFh _emit 0FFh
    }
}
