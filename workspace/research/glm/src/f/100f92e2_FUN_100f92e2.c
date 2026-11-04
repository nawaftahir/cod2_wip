extern int g_101A52EA;

__declspec(naked) void FUN_100f92e2(void)
{
    __asm {
        _emit 0BAh
        /* g_101A52EA */ dword ptr [g_101A52EA]
        _emit 0EBh _emit 0F4h
    }
}
