extern int g_10196B6C;
extern int g_101D1BF8;
extern int g_101D4878;

__declspec(naked) void FUN_100228d0(void)
{
    __asm {
        _emit 051h _emit 0A1h
        /* g_101D4878 */ dword ptr [g_101D4878]
        _emit 085h _emit 0C0h _emit 074h _emit 00Dh _emit 08Bh _emit 008h _emit 050h _emit 0FFh _emit 051h _emit 004h _emit 0A1h
        /* g_101D4878 */ dword ptr [g_101D4878]
        _emit 059h _emit 0C3h _emit 0A1h
        /* g_101D1BF8 */ dword ptr [g_101D1BF8]
        _emit 08Bh _emit 010h _emit 06Ah _emit 000h _emit 08Dh _emit 04Ch _emit 024h _emit 004h _emit 051h _emit 06Ah _emit 000h _emit 06Ah _emit 000h _emit 06Ah _emit 000h _emit 06Ah _emit 04Bh _emit 068h _emit 080h _emit 000h _emit 000h _emit 000h _emit 068h _emit 080h _emit 000h _emit 000h _emit 000h _emit 050h _emit 0FFh _emit 052h _emit 074h _emit 085h _emit 0C0h _emit 07Dh _emit 020h _emit 050h _emit 0E8h _emit 027h _emit 0D5h _emit 00Ch _emit 000h _emit 050h _emit 068h _emit 080h _emit 000h _emit 000h _emit 000h _emit 068h _emit 080h _emit 000h _emit 000h _emit 000h _emit 068h
        /* g_10196B6C */ dword ptr [g_10196B6C]
        _emit 06Ah _emit 000h _emit 0E8h _emit 0A4h _emit 0F3h _emit 003h _emit 000h _emit 083h _emit 0C4h _emit 014h _emit 08Bh _emit 004h _emit 024h _emit 059h _emit 0C3h
    }
}
