extern int g_1017C9D0;
extern int g_1019C8FC;

__declspec(naked) void __RTC_Initialize(void)
{
    __asm {
        _emit 06Ah _emit 00Ch _emit 068h
        /* g_1017C9D0 */ dword ptr [g_1017C9D0]
        _emit 0E8h _emit 03Fh _emit 0D7h _emit 0FFh _emit 0FFh _emit 0C7h _emit 045h _emit 0E4h
        /* g_1019C8FC */ dword ptr [g_1019C8FC]
        _emit 081h _emit 07Dh _emit 0E4h
        /* g_1019C8FC */ dword ptr [g_1019C8FC]
        _emit 073h _emit 022h _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 08Bh _emit 045h _emit 0E4h _emit 08Bh _emit 000h _emit 085h _emit 0C0h _emit 074h _emit 00Bh _emit 0FFh _emit 0D0h _emit 0EBh _emit 007h _emit 033h _emit 0C0h _emit 040h _emit 0C3h _emit 08Bh _emit 065h _emit 0E8h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 083h _emit 045h _emit 0E4h _emit 004h _emit 0EBh
    }
}
