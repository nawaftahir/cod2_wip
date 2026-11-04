extern int g_101AE500;
extern int g_101AE504;
extern int g_101AE508;
extern int g_101D49DC;
extern int g_10678504;

__declspec(naked) void FUN_100058b0(void)
{
    __asm {
        _emit 08Bh _emit 00Dh
        /* g_101AE504 */ dword ptr [g_101AE504]
        _emit 053h _emit 055h _emit 08Bh _emit 06Ch _emit 024h _emit 00Ch _emit 056h _emit 08Bh _emit 035h
        /* g_101AE500 */ dword ptr [g_101AE500]
        _emit 033h _emit 0DBh _emit 085h _emit 0C9h _emit 057h _emit 07Eh _emit 043h _emit 033h _emit 0D2h _emit 08Dh _emit 064h _emit 024h _emit 000h _emit 0A1h
        /* g_10678504 */ dword ptr [g_10678504]
        _emit 02Bh _emit 044h _emit 032h _emit 020h _emit 08Dh _emit 03Ch _emit 032h _emit 078h _emit 00Bh _emit 03Bh _emit 047h _emit 024h _emit 07Fh _emit 006h _emit 043h _emit 083h _emit 0C2h _emit 028h _emit 0EBh _emit 020h _emit 049h _emit 08Dh _emit 004h _emit 089h _emit 089h _emit 00Dh
        /* g_101AE504 */ dword ptr [g_101AE504]
        _emit 08Dh _emit 034h _emit 0C6h _emit 0B9h _emit 00Ah _emit 000h _emit 000h _emit 000h _emit 0F3h _emit 0A5h _emit 08Bh _emit 035h
        /* g_101AE500 */ dword ptr [g_101AE500]
        _emit 08Bh _emit 00Dh
        /* g_101AE504 */ dword ptr [g_101AE504]
        _emit 03Bh _emit 0D9h _emit 07Ch _emit 0C3h _emit 085h _emit 0F6h _emit 074h _emit 04Fh _emit 08Bh _emit 045h _emit 048h _emit 085h _emit 0C0h _emit 075h _emit 024h _emit 0A1h
        /* g_101AE508 */ dword ptr [g_101AE508]
        _emit 08Dh _emit 00Ch _emit 080h _emit 0C1h _emit 0E1h _emit 003h _emit 051h _emit 0FFh _emit 015h
        /* g_101D49DC */ dword ptr [g_101D49DC]
        _emit 089h _emit 045h _emit 048h _emit 08Bh _emit 035h
        /* g_101AE500 */ dword ptr [g_101AE500]
        _emit 08Bh _emit 00Dh
        /* g_101AE504 */ dword ptr [g_101AE504]
        _emit 083h _emit 0C4h _emit 004h _emit 08Bh _emit 07Dh _emit 048h _emit 08Dh _emit 00Ch _emit 089h _emit 0C1h _emit 0E1h _emit 003h _emit 08Bh _emit 0D1h _emit 0C1h _emit 0E9h _emit 002h _emit 0F3h _emit 0A5h _emit 08Bh _emit 0CAh _emit 083h _emit 0E1h _emit 003h _emit 0F3h _emit 0A4h _emit 0A1h
        /* g_101AE504 */ dword ptr [g_101AE504]
        _emit 05Fh _emit 05Eh _emit 089h _emit 045h _emit 04Ch _emit 05Dh _emit 05Bh _emit 0C3h _emit 05Fh _emit 05Eh _emit 089h _emit 04Dh _emit 04Ch _emit 05Dh _emit 05Bh _emit 0C3h
    }
}
