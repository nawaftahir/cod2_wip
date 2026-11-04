extern int g_1076AA30;
extern int g_1076AA38;
extern int g_1076AA40;
extern int g_1076AB44;
extern int g_1076AB50;

__declspec(naked) void setSBCS(void)
{
    __asm {
        _emit 057h _emit 06Ah _emit 040h _emit 033h _emit 0C0h _emit 059h _emit 0BFh
        /* g_1076AA40 */ dword ptr [g_1076AA40]
        _emit 0F3h _emit 0ABh _emit 0AAh _emit 033h _emit 0C0h _emit 0A3h
        /* g_1076AB44 */ dword ptr [g_1076AB44]
        _emit 0A3h
        /* g_1076AA38 */ dword ptr [g_1076AA38]
        _emit 0A3h
        /* g_1076AA30 */ dword ptr [g_1076AA30]
        _emit 0BFh
        /* g_1076AB50 */ dword ptr [g_1076AB50]
        _emit 0ABh _emit 0ABh _emit 0ABh _emit 05Fh _emit 0C3h
    }
}
