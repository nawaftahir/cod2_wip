extern int g_101A530A;

__declspec(naked) void FUN_100f92e9(void)
{
    __asm {
        _emit 0BAh
        /* g_101A530A */ dword ptr [g_101A530A]
        _emit 0EBh _emit 0EDh
    }
}
