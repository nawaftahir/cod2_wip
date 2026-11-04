extern int g_1004EC80;
extern int g_1004F040;
extern int g_1004F280;
extern int g_1004F600;
extern int g_1004F790;

__declspec(naked) void FUN_1004f7c0(void)
{
    __asm {
        _emit 08Bh _emit 046h _emit 004h _emit 053h _emit 068h _emit 0A8h _emit 000h _emit 000h _emit 000h _emit 033h _emit 0DBh _emit 053h _emit 056h _emit 0FFh _emit 010h _emit 089h _emit 086h _emit 09Ch _emit 001h _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 0C7h _emit 000h
        /* g_1004F790 */ dword ptr [g_1004F790]
        _emit 0C7h _emit 040h _emit 004h
        /* g_1004F280 */ dword ptr [g_1004F280]
        _emit 0C7h _emit 040h _emit 008h
        /* g_1004F600 */ dword ptr [g_1004F600]
        _emit 0C7h _emit 040h _emit 018h
        /* g_1004F040 */ dword ptr [g_1004F040]
        _emit 089h _emit 058h _emit 05Ch _emit 08Dh _emit 048h _emit 060h _emit 0BAh _emit 010h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 0FFh _emit 0C7h _emit 041h _emit 0BCh
        /* g_1004F040 */ dword ptr [g_1004F040]
        _emit 089h _emit 019h _emit 083h _emit 0C1h _emit 004h _emit 04Ah _emit 075h _emit 0F1h _emit 0B9h
        /* g_1004EC80 */ dword ptr [g_1004EC80]
        _emit 089h _emit 048h _emit 01Ch _emit 089h _emit 048h _emit 054h _emit 08Bh _emit 086h _emit 09Ch _emit 001h _emit 000h _emit 000h _emit 089h _emit 09Eh _emit 0CCh _emit 000h _emit 000h _emit 000h _emit 089h _emit 09Eh _emit 084h _emit 000h _emit 000h _emit 000h _emit 089h _emit 09Eh _emit 084h _emit 001h _emit 000h _emit 000h _emit 088h _emit 058h _emit 00Ch _emit 088h _emit 058h _emit 00Dh _emit 089h _emit 058h _emit 014h _emit 089h _emit 098h _emit 0A0h _emit 000h _emit 000h _emit 000h _emit 05Bh _emit 0C3h
    }
}
