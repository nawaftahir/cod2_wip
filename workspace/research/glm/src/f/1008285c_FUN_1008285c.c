extern int g_1010FFCC;

__declspec(naked) void FUN_1008285c(void)
{
    __asm {
        _emit 06Ah _emit 001h _emit 08Bh _emit 0D1h _emit 0E8h _emit 056h _emit 0FFh _emit 0FFh _emit 0FFh _emit 083h _emit 062h _emit 010h _emit 000h _emit 0C7h _emit 002h
        /* g_1010FFCC */ dword ptr [g_1010FFCC]
        _emit 08Bh _emit 0C2h _emit 0C3h
    }
}
