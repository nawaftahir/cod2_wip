extern int g_10193358;
extern int g_10198F80;
extern int g_101CE7EC;
extern int g_101D1BF8;
extern int g_10764584;
extern int g_107667B8;
extern int g_1076A830;

__declspec(naked) void FUN_10038430(void)
{
    __asm {
        _emit 039h _emit 035h
        /* g_107667B8 */ dword ptr [g_107667B8]
        _emit 074h _emit 05Fh _emit 0EBh _emit 006h _emit 08Dh _emit 09Bh _emit 000h _emit 000h _emit 000h _emit 000h _emit 0A1h
        /* g_101CE7EC */ dword ptr [g_101CE7EC]
        _emit 08Bh _emit 048h _emit 008h _emit 085h _emit 0C9h _emit 074h _emit 02Dh _emit 0A1h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 085h _emit 0C0h _emit 00Fh _emit 095h _emit 0C1h _emit 084h _emit 0C9h _emit 074h _emit 01Fh _emit 068h
        /* g_10198F80 */ dword ptr [g_10198F80]
        _emit 068h
        /* g_10193358 */ dword ptr [g_10193358]
        _emit 050h _emit 0E8h _emit 09Bh _emit 0E8h _emit 00Bh _emit 000h _emit 08Bh _emit 00Dh
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 051h _emit 0E8h _emit 0C7h _emit 0E7h _emit 00Bh _emit 000h _emit 083h _emit 0C4h _emit 010h _emit 0A1h
        /* g_101D1BF8 */ dword ptr [g_101D1BF8]
        _emit 08Bh _emit 010h _emit 056h _emit 050h _emit 0FFh _emit 092h _emit 0ACh _emit 001h _emit 000h _emit 000h _emit 0A1h
        /* g_1076A830 */ dword ptr [g_1076A830]
        _emit 085h _emit 0C0h _emit 075h _emit 0AFh _emit 089h
    }
}
