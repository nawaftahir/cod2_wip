extern int g_101A5490;

__declspec(naked) void __ld12tod(void)
{
    __asm {
        _emit 068h
        /* g_101A5490 */ dword ptr [g_101A5490]
        _emit 0FFh _emit 074h _emit 024h _emit 00Ch _emit 0FFh _emit 074h _emit 024h _emit 00Ch _emit 0E8h _emit 096h _emit 0FEh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 00Ch _emit 0C3h
    }
}
