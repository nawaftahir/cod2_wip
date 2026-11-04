extern int g_1017C468;

__declspec(naked) void __fsopen(void)
{
    __asm {
        _emit 06Ah _emit 010h _emit 068h
        /* g_1017C468 */ dword ptr [g_1017C468]
        _emit 0E8h _emit 06Eh _emit 049h _emit 000h _emit 000h _emit 0E8h _emit 0F4h _emit 055h _emit 000h _emit 000h _emit 089h _emit 045h _emit 0E4h _emit 085h _emit 0C0h _emit 075h _emit 00Fh _emit 0E8h _emit 063h _emit 055h _emit 000h _emit 000h _emit 0C7h _emit 000h _emit 018h _emit 000h _emit 000h _emit 000h _emit 033h _emit 0C0h _emit 0EBh _emit 025h _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 050h _emit 0FFh _emit 075h _emit 010h _emit 0FFh _emit 075h _emit 00Ch _emit 0FFh _emit 075h _emit 008h _emit 0E8h _emit 0DEh _emit 053h _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 010h _emit 089h _emit 045h _emit 0E0h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 009h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 045h _emit 0E0h _emit 0E8h _emit 064h _emit 049h _emit 000h _emit 000h _emit 0C3h
    }
}
