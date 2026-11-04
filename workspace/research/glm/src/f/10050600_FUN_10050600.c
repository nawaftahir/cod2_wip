extern int g_10050150;
extern int g_10050170;
extern int g_10050240;
extern int g_10050280;
extern int g_100503D0;

__declspec(naked) void FUN_10050600(void)
{
    __asm {
        _emit 08Bh _emit 047h _emit 004h _emit 056h _emit 06Ah _emit 030h _emit 06Ah _emit 001h _emit 057h _emit 0FFh _emit 010h _emit 08Bh _emit 0F0h _emit 089h _emit 0B7h _emit 0A8h _emit 001h _emit 000h _emit 000h _emit 033h _emit 0C0h _emit 0C7h _emit 006h
        /* g_10050150 */ dword ptr [g_10050150]
        _emit 088h _emit 046h _emit 008h _emit 08Bh _emit 04Fh _emit 06Ch _emit 00Fh _emit 0AFh _emit 04Fh _emit 064h _emit 089h _emit 04Eh _emit 028h _emit 08Bh _emit 08Fh _emit 01Ch _emit 001h _emit 000h _emit 000h _emit 083h _emit 0C4h _emit 00Ch _emit 083h _emit 0F9h _emit 002h _emit 075h _emit 029h _emit 08Bh _emit 046h _emit 028h _emit 050h _emit 0C7h _emit 046h _emit 004h
        /* g_10050170 */ dword ptr [g_10050170]
        _emit 0C7h _emit 046h _emit 00Ch
        /* g_100503D0 */ dword ptr [g_100503D0]
        _emit 08Bh _emit 057h _emit 004h _emit 06Ah _emit 001h _emit 057h _emit 0FFh _emit 052h _emit 004h _emit 083h _emit 0C4h _emit 00Ch _emit 089h _emit 046h _emit 020h _emit 08Bh _emit 0C7h _emit 05Eh _emit 0E9h _emit 021h _emit 0FAh _emit 0FFh _emit 0FFh _emit 089h _emit 046h _emit 020h _emit 0C7h _emit 046h _emit 004h
        /* g_10050240 */ dword ptr [g_10050240]
        _emit 0C7h _emit 046h _emit 00Ch
        /* g_10050280 */ dword ptr [g_10050280]
        _emit 08Bh _emit 0C7h _emit 05Eh _emit 0E9h _emit 008h _emit 0FAh _emit 0FFh _emit 0FFh
    }
}
