extern int g_10194458;
extern int g_101DA560;

__declspec(naked) void FUN_10016cf0(void)
{
    __asm {
        _emit 051h _emit 0A1h
        /* g_101DA560 */ dword ptr [g_101DA560]
        _emit 040h _emit 03Dh _emit 000h _emit 001h _emit 000h _emit 000h _emit 0A3h
        /* g_101DA560 */ dword ptr [g_101DA560]
        _emit 075h _emit 014h _emit 068h _emit 0FFh _emit 000h _emit 000h _emit 000h _emit 068h
        /* g_10194458 */ dword ptr [g_10194458]
        _emit 06Ah _emit 001h _emit 0E8h _emit 0ACh _emit 0CBh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 00Ch _emit 08Bh _emit 04Ch _emit 024h _emit 00Ch _emit 08Bh _emit 054h _emit 024h _emit 008h _emit 08Dh _emit 004h _emit 024h _emit 050h _emit 051h _emit 052h _emit 0E8h _emit 0E6h _emit 0FEh _emit 0FFh _emit 0FFh _emit 08Bh _emit 044h _emit 024h _emit 00Ch _emit 08Bh _emit 04Ch _emit 024h _emit 01Ch _emit 089h _emit 00Ch _emit 085h _emit 064h _emit 0A5h _emit 01Dh _emit 010h _emit 083h _emit 0C4h _emit 010h _emit 0C3h
    }
}
