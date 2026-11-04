extern int g_101A4898;
extern int g_101ADDC4;

__declspec(naked) void __mtterm(void)
{
    __asm {
        _emit 0A1h
        /* g_101A4898 */ dword ptr [g_101A4898]
        _emit 083h _emit 0F8h _emit 0FFh _emit 074h _emit 00Eh _emit 050h _emit 0FFh _emit 015h
        /* g_101ADDC4 */ dword ptr [g_101ADDC4]
        _emit 083h _emit 00Dh _emit 098h
        /* g_101A4898 */ dword ptr [g_101A4898]
        _emit 0E9h _emit 05Ah _emit 00Eh _emit 000h _emit 000h
    }
}
