extern int g_1019bc78;
extern int g_1019bcb4;
extern int g_1019bdd8;
extern void sub_1010aaaa(void);

__declspec(naked) void FUN_1005b8e0(void)
{
    __asm {
    sub esp, 0xc
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    mov dword ptr [esp], ecx
    fld dword ptr [esp]
    fmul dword ptr [esp]
    mov dword ptr [esp], edx
    fstp dword ptr [esp + 4]
    fld dword ptr [esp]
    fmul dword ptr [esp]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp]
    fld dword ptr g_1019bcb4
    fdiv dword ptr [esp]
    fstp dword ptr [esp]
    fld dword ptr [eax + 4]
    fmul dword ptr [eax]
    fmul dword ptr [esp]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fld dword ptr [esp]
    fmul dword ptr [esp + 4]
    fsubr dword ptr g_1019bc78
    call sub_1010aaaa
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fmul dword ptr g_1019bdd8
    add esp, 0xc
    ret
    }
}
