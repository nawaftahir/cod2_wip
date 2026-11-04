extern int g_1019bc78;
extern int g_1072daf0;
extern int g_1072daf4;
extern int g_1072daf8;
extern int g_1072dafc;
extern int g_1072db00;
extern int g_1072db04;
extern int g_1072db08;
extern int g_1072db0c;
extern int g_1072db10;
extern int g_1072db14;
extern int g_1072db18;
extern int g_1072db1c;
extern int g_1072ddc8;

__declspec(naked) void FUN_10032120(void)
{
    __asm {
    push ecx
    mov eax, dword ptr g_1072ddc8
    fld dword ptr g_1019bc78
    fdiv dword ptr [eax + 0x144]
    fld st(0)
    fmul dword ptr [eax + 0x140]
    fsub dword ptr [eax + 8]
    fld st(1)
    fmul dword ptr [eax + 0x13c]
    fsub dword ptr [eax + 4]
    fld st(2)
    fmul dword ptr [eax + 0x138]
    fsub dword ptr [eax]
    mov dword ptr g_1072dafc, 0
    fstp dword ptr g_1072daf0
    fstp dword ptr g_1072daf4
    fstp dword ptr g_1072daf8
    fadd st(0), st(0)
    fst dword ptr [esp]
    fmul dword ptr [eax + 0x110]
    fld dword ptr [esp]
    fmul dword ptr [eax + 0x10c]
    fld dword ptr [esp]
    fmul dword ptr [eax + 0x108]
    mov dword ptr g_1072db0c, 0
    fstp dword ptr g_1072db00
    fstp dword ptr g_1072db04
    fstp dword ptr g_1072db08
    fld dword ptr [esp]
    fmul dword ptr [eax + 0x120]
    fchs
    fld dword ptr [esp]
    fmul dword ptr [eax + 0x11c]
    fchs
    fld dword ptr [esp]
    fmul dword ptr [eax + 0x118]
    mov dword ptr g_1072db1c, 0
    fchs
    fstp dword ptr g_1072db10
    fstp dword ptr g_1072db14
    fstp dword ptr g_1072db18
    pop ecx
    ret
    }
}
