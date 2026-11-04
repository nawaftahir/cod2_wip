extern int g_1010FF18;

__declspec(naked) void FUN_10081aef(void)
{
    __asm {
        _emit 08Bh _emit 041h _emit 00Ch _emit 085h _emit 0C0h _emit 0C7h _emit 001h
        /* g_1010FF18 */ dword ptr [g_1010FF18]
        _emit 074h _emit 009h _emit 00Fh _emit 0B6h _emit 050h _emit 0FFh _emit 02Bh _emit 0C2h _emit 089h _emit 041h _emit 00Ch _emit 0E9h _emit 0F8h _emit 0FEh _emit 0FFh _emit 0FFh
    }
}
