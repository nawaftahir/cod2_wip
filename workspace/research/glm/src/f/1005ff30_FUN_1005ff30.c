extern int g_101A66B0;
extern int g_101AAC70;

__declspec(naked) void FUN_1005ff30(void)
{
    __asm {
        _emit 0A1h
        /* g_101AAC70 */ dword ptr [g_101AAC70]
        _emit 069h _emit 0C0h _emit 05Ch _emit 004h _emit 000h _emit 000h _emit 005h
        /* g_101A66B0 */ dword ptr [g_101A66B0]
        _emit 08Ah _emit 090h _emit 004h _emit 004h _emit 000h _emit 000h _emit 084h _emit 0D2h _emit 074h _emit 01Bh _emit 08Bh _emit 090h _emit 018h _emit 004h _emit 000h _emit 000h _emit 0C6h _emit 080h _emit 004h _emit 004h _emit 000h _emit 000h _emit 000h _emit 089h _emit 011h _emit 08Bh _emit 090h _emit 014h _emit 004h _emit 000h _emit 000h _emit 089h _emit 090h _emit 000h _emit 004h _emit 000h _emit 000h _emit 051h _emit 0B8h _emit 001h _emit 000h _emit 000h _emit 000h _emit 0E8h _emit 020h _emit 0F7h _emit 0FFh _emit 0FFh _emit 050h _emit 0E8h _emit 0B9h _emit 074h _emit 009h _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 0C3h
    }
}
