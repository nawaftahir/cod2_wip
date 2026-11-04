extern int g_101DA9C8;
extern int g_10696D00;
extern int g_106A3128;
extern int g_106A312C;

__declspec(naked) void FUN_1002b8c0(void)
{
    __asm {
        _emit 02Dh
        /* g_10696D00 */ dword ptr [g_10696D00]
        _emit 08Bh _emit 0C8h _emit 0B8h _emit 09Dh _emit 082h _emit 097h _emit 053h _emit 0F7h _emit 0E9h _emit 08Bh _emit 00Dh
        /* g_101DA9C8 */ dword ptr [g_101DA9C8]
        _emit 0C1h _emit 0FAh _emit 007h _emit 08Bh _emit 0C2h _emit 0C1h _emit 0E8h _emit 01Fh _emit 003h _emit 0C2h _emit 08Bh _emit 011h _emit 069h _emit 0C0h _emit 088h _emit 001h _emit 000h _emit 000h _emit 005h
        /* g_10696D00 */ dword ptr [g_10696D00]
        _emit 08Bh _emit 048h _emit 004h _emit 089h _emit 050h _emit 008h _emit 08Bh _emit 010h _emit 089h _emit 011h _emit 08Bh _emit 008h _emit 08Bh _emit 050h _emit 004h _emit 089h _emit 051h _emit 004h _emit 0C7h _emit 000h
        /* g_106A3128 */ dword ptr [g_106A3128]
        _emit 08Bh _emit 00Dh
        /* g_106A312C */ dword ptr [g_106A312C]
        _emit 089h _emit 048h _emit 004h _emit 0A3h
        /* g_106A312C */ dword ptr [g_106A312C]
        _emit 08Bh _emit 050h _emit 004h _emit 089h _emit 002h _emit 0C3h
    }
}
