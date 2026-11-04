extern int g_101CE830;
extern int g_1072D9D0;
extern int g_1072D9E0;

__declspec(naked) void FUN_100309a0(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 083h _emit 0E4h _emit 0F8h _emit 051h _emit 0A1h
        /* g_1072D9D0 */ dword ptr [g_1072D9D0]
        _emit 085h _emit 0C0h _emit 056h _emit 075h _emit 009h _emit 0A1h
        /* g_1072D9E0 */ dword ptr [g_1072D9E0]
        _emit 085h _emit 0C0h _emit 074h _emit 005h _emit 0E8h _emit 011h _emit 09Fh _emit 000h _emit 000h _emit 0A1h
        /* g_101CE830 */ dword ptr [g_101CE830]
        _emit 08Bh _emit 048h _emit 008h _emit 033h _emit 0F6h _emit 085h _emit 0C9h _emit 07Eh _emit 032h _emit 08Dh _emit 049h _emit 000h _emit 068h _emit 000h _emit 000h _emit 07Fh _emit 03Fh _emit 068h _emit 000h _emit 000h _emit 040h _emit 03Ch _emit 0E8h _emit 041h _emit 0FFh _emit 0FFh _emit 0FFh _emit 068h _emit 000h _emit 000h _emit 07Dh _emit 03Fh _emit 068h _emit 000h _emit 000h _emit 080h _emit 03Bh _emit 0E8h _emit 032h _emit 0FFh _emit 0FFh _emit 0FFh _emit 08Bh _emit 00Dh
        /* g_101CE830 */ dword ptr [g_101CE830]
        _emit 08Bh _emit 041h _emit 008h _emit 083h _emit 0C4h _emit 010h _emit 046h _emit 03Bh _emit 0F0h _emit 07Ch _emit 0D1h _emit 08Bh _emit 04Dh _emit 008h _emit 08Bh _emit 001h _emit 00Fh _emit 0B7h _emit 050h _emit 002h _emit 003h _emit 0D0h _emit 089h _emit 011h _emit 05Eh _emit 08Bh _emit 0E5h _emit 05Dh _emit 0C3h
    }
}
