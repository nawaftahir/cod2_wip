extern int g_101821D0;
extern int g_1076AA34;

__declspec(naked) void ___updatetmbcinfo(void)
{
    __asm {
        _emit 06Ah _emit 010h _emit 068h
        /* g_101821D0 */ dword ptr [g_101821D0]
        _emit 0E8h _emit 085h _emit 047h _emit 0FFh _emit 0FFh _emit 06Ah _emit 00Dh _emit 0E8h _emit 0EBh _emit 051h _emit 0FFh _emit 0FFh _emit 059h _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 0E8h _emit 078h _emit 042h _emit 0FFh _emit 0FFh _emit 08Bh _emit 0F8h _emit 089h _emit 07Dh _emit 0E0h _emit 08Bh _emit 077h _emit 060h _emit 089h _emit 075h _emit 0E4h _emit 03Bh _emit 035h
        /* g_1076AA34 */ dword ptr [g_1076AA34]
        _emit 074h _emit 022h _emit 085h _emit 0F6h _emit 074h _emit 00Bh _emit 0FFh _emit 00Eh _emit 075h _emit 007h _emit 056h _emit 0E8h _emit 013h _emit 016h _emit 0FFh _emit 0FFh _emit 059h _emit 0A1h
        /* g_1076AA34 */ dword ptr [g_1076AA34]
        _emit 089h _emit 047h _emit 060h _emit 08Bh _emit 035h
        /* g_1076AA34 */ dword ptr [g_1076AA34]
        _emit 089h _emit 075h _emit 0E4h _emit 0FFh _emit 006h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 00Bh _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 0C6h _emit 0E8h _emit 06Ah _emit 047h _emit 0FFh _emit 0FFh _emit 0C3h
    }
}
