extern int g_101A4840;

__declspec(naked) void FUN_100f92fa(void)
{
    __asm {
        _emit 0BAh
        /* g_101A4840 */ dword ptr [g_101A4840]
        _emit 0E9h _emit 0BCh _emit 0AEh _emit 000h _emit 000h
    }
}
