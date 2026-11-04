extern int g_1004C490;
extern int g_1004CB30;

__declspec(naked) void FUN_1004cf60(void)
{
    __asm {
        _emit 08Bh _emit 046h _emit 004h _emit 068h _emit 0ACh _emit 000h _emit 000h _emit 000h _emit 06Ah _emit 001h _emit 056h _emit 0FFh _emit 010h _emit 089h _emit 086h _emit 0A0h _emit 001h _emit 000h _emit 000h _emit 033h _emit 0C9h _emit 0C7h _emit 000h
        /* g_1004C490 */ dword ptr [g_1004C490]
        _emit 0C7h _emit 040h _emit 004h
        /* g_1004CB30 */ dword ptr [g_1004CB30]
        _emit 083h _emit 0C4h _emit 00Ch _emit 089h _emit 048h _emit 038h _emit 089h _emit 048h _emit 028h _emit 089h _emit 048h _emit 03Ch _emit 089h _emit 048h _emit 02Ch _emit 089h _emit 048h _emit 040h _emit 089h _emit 048h _emit 030h _emit 089h _emit 048h _emit 044h _emit 089h _emit 048h _emit 034h _emit 0C3h
    }
}
