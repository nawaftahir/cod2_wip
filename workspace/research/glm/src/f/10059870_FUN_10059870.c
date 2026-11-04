extern int g_1019bc84;
extern int g_1019bc98;
extern int g_1019bc9c;
extern int g_1019bd98;
extern void sub_1010aaf6(void);

__declspec(naked) void FUN_10059870(void)
{
    __asm {
    fld dword ptr g_1019bc84
    sub esp, 8
    fld dword ptr [ecx + 4]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L2
    fld dword ptr g_1019bc84
    fld dword ptr [ecx]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L2
    mov dword ptr [esp], 0
    fld dword ptr [esp]
    add esp, 8
    ret
    mov eax, dword ptr [ecx]
    mov ecx, dword ptr [ecx + 4]
    mov dword ptr [esp], ecx
    fld dword ptr [esp]
    mov dword ptr [esp + 4], eax
    fld dword ptr [esp + 4]
    call sub_1010aaf6
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr g_1019bc98
    fdiv dword ptr g_1019bd98
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 5
    jp L2
    fld dword ptr [esp]
    fadd dword ptr g_1019bc9c
    fstp dword ptr [esp]
    fld dword ptr [esp]
    add esp, 8
    ret
    }
}
