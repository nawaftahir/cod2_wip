extern int g_101956AC;
extern int g_101958A8;
extern int g_101958CC;

__declspec(naked) void FUN_10018f90(void)
{
    __asm {
        _emit 057h _emit 06Ah _emit 001h _emit 068h
        /* g_101958CC */ dword ptr [g_101958CC]
        _emit 08Bh _emit 0CEh _emit 08Bh _emit 0F8h _emit 0E8h _emit 04Fh _emit 06Bh _emit 004h _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 085h _emit 0C0h _emit 075h _emit 004h _emit 032h _emit 0C0h _emit 05Fh _emit 0C3h _emit 08Bh _emit 0CEh _emit 0E8h _emit 07Dh _emit 06Fh _emit 004h _emit 000h _emit 085h _emit 0C0h _emit 08Bh _emit 04Ch _emit 024h _emit 008h _emit 089h _emit 001h _emit 07Ch _emit 004h _emit 03Bh _emit 0C7h _emit 07Ch _emit 010h _emit 04Fh _emit 057h _emit 050h _emit 068h
        /* g_101956AC */ dword ptr [g_101956AC]
        _emit 0E8h _emit 092h _emit 063h _emit 004h _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 06Ah _emit 001h _emit 068h
        /* g_101958A8 */ dword ptr [g_101958A8]
        _emit 08Bh _emit 0CEh _emit 0E8h _emit 011h _emit 06Bh _emit 004h _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 085h _emit 0C0h _emit 00Fh _emit 095h _emit 0C0h _emit 05Fh _emit 0C3h
    }
}
