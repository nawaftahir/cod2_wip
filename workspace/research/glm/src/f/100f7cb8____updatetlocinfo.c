extern int g_1017C680;

__declspec(naked) void ___updatetlocinfo(void)
{
    __asm {
        _emit 06Ah _emit 00Ch _emit 068h
        /* g_1017C680 */ dword ptr [g_1017C680]
        _emit 0E8h _emit 04Ch _emit 039h _emit 000h _emit 000h _emit 06Ah _emit 00Ch _emit 0E8h _emit 0B2h _emit 043h _emit 000h _emit 000h _emit 059h _emit 083h _emit 065h _emit 0FCh _emit 000h _emit 0E8h _emit 0D1h _emit 0FDh _emit 0FFh _emit 0FFh _emit 089h _emit 045h _emit 0E4h _emit 083h _emit 04Dh _emit 0FCh _emit 0FFh _emit 0E8h _emit 009h _emit 000h _emit 000h _emit 000h _emit 08Bh _emit 045h _emit 0E4h _emit 0E8h _emit 062h _emit 039h _emit 000h _emit 000h _emit 0C3h
    }
}
