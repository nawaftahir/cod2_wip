extern int g_10196BA4;
extern int g_10196BBC;
extern int g_10196BDC;
extern int g_10196BFC;
extern int g_10196C1C;
extern int g_10196C3C;
extern int g_10196C5C;
extern int g_10196C6C;

__declspec(naked) void FUN_10022710(void)
{
    __asm {
        _emit 08Dh _emit 041h _emit 0EBh _emit 083h _emit 0F8h _emit 03Bh _emit 077h _emit 038h _emit 00Fh _emit 0B6h _emit 080h _emit 080h _emit 027h _emit 002h _emit 010h _emit 0FFh _emit 024h _emit 085h _emit 060h _emit 027h _emit 002h _emit 010h _emit 0B8h
        /* g_10196C6C */ dword ptr [g_10196C6C]
        _emit 0C3h _emit 0B8h
        /* g_10196C5C */ dword ptr [g_10196C5C]
        _emit 0C3h _emit 0B8h
        /* g_10196C3C */ dword ptr [g_10196C3C]
        _emit 0C3h _emit 0B8h
        /* g_10196C1C */ dword ptr [g_10196C1C]
        _emit 0C3h _emit 0B8h
        /* g_10196BFC */ dword ptr [g_10196BFC]
        _emit 0C3h _emit 0B8h
        /* g_10196BDC */ dword ptr [g_10196BDC]
        _emit 0C3h _emit 0B8h
        /* g_10196BBC */ dword ptr [g_10196BBC]
        _emit 0C3h _emit 051h _emit 068h
        /* g_10196BA4 */ dword ptr [g_10196BA4]
        _emit 0E8h _emit 015h _emit 0E5h _emit 003h _emit 000h _emit 083h _emit 0C4h _emit 008h _emit 0C3h
    }
}
