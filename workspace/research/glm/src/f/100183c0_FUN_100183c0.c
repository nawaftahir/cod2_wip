extern int g_101958A8;
extern int g_101958AC;
extern int g_101958CC;

__declspec(naked) void FUN_100183c0(void)
{
    __asm {
        _emit 06Ah _emit 001h _emit 050h _emit 08Bh _emit 0CEh _emit 0E8h _emit 026h _emit 077h _emit 004h _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 085h _emit 0C0h _emit 074h _emit 02Fh _emit 06Ah _emit 001h _emit 068h
        /* g_101958CC */ dword ptr [g_101958CC]
        _emit 08Bh _emit 0CEh _emit 0E8h _emit 011h _emit 077h _emit 004h _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 085h _emit 0C0h _emit 074h _emit 01Ah _emit 08Bh _emit 0CEh _emit 0E8h _emit 043h _emit 07Bh _emit 004h _emit 000h _emit 03Bh _emit 0C7h _emit 074h _emit 012h _emit 050h _emit 057h _emit 068h
        /* g_101958AC */ dword ptr [g_101958AC]
        _emit 0E8h _emit 063h _emit 06Fh _emit 004h _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 032h _emit 0C0h _emit 0C3h _emit 06Ah _emit 001h _emit 068h
        /* g_101958A8 */ dword ptr [g_101958A8]
        _emit 08Bh _emit 0CEh _emit 0E8h _emit 0DFh _emit 076h _emit 004h _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 085h _emit 0C0h _emit 00Fh _emit 095h _emit 0C0h _emit 0C3h
    }
}
