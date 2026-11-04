extern int g_101CE580;
extern int g_101D1B9C;

__declspec(naked) void FUN_1000a7f0(void)
{
    __asm {
        _emit 0A1h
        /* g_101D1B9C */ dword ptr [g_101D1B9C]
        _emit 085h _emit 0C0h _emit 0C7h _emit 005h _emit 080h _emit 0E5h _emit 01Ch _emit 010h
        /* g_101CE580 */ dword ptr [g_101CE580]
        _emit 074h _emit 031h _emit 08Bh _emit 090h _emit 0FCh _emit 000h _emit 000h _emit 000h _emit 033h _emit 0C9h _emit 085h _emit 0D2h _emit 07Eh _emit 025h _emit 033h _emit 0D2h _emit 057h _emit 08Bh _emit 080h _emit 000h _emit 001h _emit 000h _emit 000h _emit 0C7h _emit 044h _emit 010h _emit 038h _emit 000h _emit 000h _emit 000h _emit 000h _emit 0A1h
        /* g_101D1B9C */ dword ptr [g_101D1B9C]
        _emit 08Bh _emit 0B8h _emit 0FCh _emit 000h _emit 000h _emit 000h _emit 041h _emit 083h _emit 0C2h _emit 03Ch _emit 03Bh _emit 0CFh _emit 07Ch _emit 0DFh _emit 05Fh _emit 0C3h
    }
}
