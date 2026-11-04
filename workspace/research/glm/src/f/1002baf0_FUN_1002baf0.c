extern int g_10696D00;
extern int g_106A3100;
extern int g_106A3104;
extern int g_106A3128;
extern int g_106A312C;

__declspec(naked) void FUN_1002baf0(void)
{
    __asm {
        _emit 0A1h
        /* g_106A312C */ dword ptr [g_106A312C]
        _emit 085h _emit 0C0h _emit 074h _emit 065h _emit 03Dh
        /* g_106A3128 */ dword ptr [g_106A3128]
        _emit 074h _emit 059h _emit 056h _emit 057h _emit 06Ah _emit 004h _emit 06Ah _emit 000h _emit 050h _emit 068h
        /* g_10696D00 */ dword ptr [g_10696D00]
        _emit 08Bh _emit 0F0h _emit 0E8h _emit 0ADh _emit 0EFh _emit 0FFh _emit 0FFh _emit 0A1h
        /* g_106A312C */ dword ptr [g_106A312C]
        _emit 08Bh _emit 050h _emit 004h _emit 08Bh _emit 038h _emit 08Dh _emit 048h _emit 004h _emit 089h _emit 03Ah _emit 08Bh _emit 000h _emit 08Bh _emit 009h _emit 089h _emit 048h _emit 004h _emit 08Dh _emit 086h _emit 088h _emit 000h _emit 000h _emit 000h _emit 0C7h _emit 000h
        /* g_106A3100 */ dword ptr [g_106A3100]
        _emit 08Bh _emit 015h
        /* g_106A3104 */ dword ptr [g_106A3104]
        _emit 089h _emit 050h _emit 004h _emit 0A3h
        /* g_106A3104 */ dword ptr [g_106A3104]
        _emit 08Bh _emit 048h _emit 004h _emit 089h _emit 001h _emit 0A1h
        /* g_106A312C */ dword ptr [g_106A312C]
        _emit 083h _emit 0C4h _emit 010h _emit 03Dh
        /* g_106A3128 */ dword ptr [g_106A3128]
        _emit 075h _emit 0ABh _emit 05Fh _emit 05Eh _emit 0E9h _emit 042h _emit 0FEh _emit 0FFh _emit 0FFh _emit 0C3h
    }
}
