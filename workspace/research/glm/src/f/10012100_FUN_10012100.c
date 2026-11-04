extern int g_10193D08;
extern int g_10193D34;
extern int g_10193D54;
extern int g_10193D7C;
extern int g_10193DA0;
extern int g_10193DC4;
extern int g_101D1BF8;
extern int g_101D494C;
extern int g_101D4958;
extern int g_101D49C8;

__declspec(naked) void FUN_10012100(void)
{
    __asm {
        _emit 068h
        /* g_10193DC4 */ dword ptr [g_10193DC4]
        _emit 06Ah _emit 000h _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 0E8h _emit 00Eh _emit 00Ch _emit 001h _emit 000h _emit 068h
        /* g_10193DA0 */ dword ptr [g_10193DA0]
        _emit 06Ah _emit 000h _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 0E8h _emit 0FCh _emit 097h _emit 001h _emit 000h _emit 0E8h _emit 077h _emit 098h _emit 001h _emit 000h _emit 068h
        /* g_10193D7C */ dword ptr [g_10193D7C]
        _emit 06Ah _emit 000h _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 0E8h _emit 025h _emit 0FAh _emit 0FFh _emit 0FFh _emit 068h
        /* g_10193D54 */ dword ptr [g_10193D54]
        _emit 06Ah _emit 000h _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 0E8h _emit 0A3h _emit 0FAh _emit 0FFh _emit 0FFh _emit 068h
        /* g_10193D34 */ dword ptr [g_10193D34]
        _emit 06Ah _emit 000h _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 0A1h
        /* g_101D1BF8 */ dword ptr [g_101D1BF8]
        _emit 083h _emit 0C4h _emit 028h _emit 068h
        /* g_101D494C */ dword ptr [g_101D494C]
        _emit 06Ah _emit 008h _emit 0C6h _emit 005h _emit 058h
        /* g_101D4958 */ dword ptr [g_101D4958]
        _emit 08Bh _emit 008h _emit 050h _emit 0FFh _emit 091h _emit 0D8h _emit 001h _emit 000h _emit 000h _emit 085h _emit 0C0h _emit 07Dh _emit 01Bh _emit 050h _emit 050h _emit 0E8h _emit 0B8h _emit 0DCh _emit 00Dh _emit 000h _emit 050h _emit 068h
        /* g_10193D08 */ dword ptr [g_10193D08]
        _emit 06Ah _emit 000h _emit 0FFh _emit 015h
        /* g_101D49C8 */ dword ptr [g_101D49C8]
        _emit 083h _emit 0C4h _emit 010h _emit 032h _emit 0C0h _emit 0C3h
    }
}
