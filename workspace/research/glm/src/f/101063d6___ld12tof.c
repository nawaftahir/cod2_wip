extern int g_101A54A8;

__declspec(naked) void __ld12tof(void)
{
    __asm {
        _emit 068h
        /* g_101A54A8 */ dword ptr [g_101A54A8]
        _emit 0FFh _emit 074h _emit 024h _emit 00Ch _emit 0FFh _emit 074h _emit 024h _emit 00Ch _emit 0E8h _emit 080h _emit 0FEh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 00Ch _emit 0C3h
    }
}
