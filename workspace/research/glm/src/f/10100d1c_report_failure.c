extern int g_1017E2A0;

__declspec(naked) void report_failure(void)
{
    __asm {
        _emit 06Ah _emit 008h _emit 068h
        /* g_1017E2A0 */ dword ptr [g_1017E2A0]
        _emit 0E8h _emit 0E8h _emit 0A8h _emit 0FFh _emit 0FFh _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 06Ah _emit 000h _emit 06Ah _emit 001h _emit 0E8h _emit 05Dh _emit 07Bh _emit 000h _emit 000h _emit 059h _emit 059h _emit 0EBh _emit 007h _emit 033h _emit 0C0h _emit 040h _emit 0C3h _emit 08Bh _emit 065h _emit 0E8h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 06Ah
    }
}
