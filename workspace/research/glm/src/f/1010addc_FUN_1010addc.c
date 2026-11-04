extern int g_101A523A;

__declspec(naked) void FUN_1010addc(void)
{
    __asm {
        _emit 0DDh _emit 0D8h _emit 0DBh _emit 02Dh
        /* g_101A523A */ dword ptr [g_101A523A]
        _emit 0C3h
    }
}
