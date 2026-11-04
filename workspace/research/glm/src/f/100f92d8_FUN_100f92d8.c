extern int g_101A52CA;

__declspec(naked) void FUN_100f92d8(void)
{
    __asm {
        _emit 0BAh
        /* g_101A52CA */ dword ptr [g_101A52CA]
        _emit 0E9h _emit 01Ch _emit 0AFh _emit 000h _emit 000h
    }
}
