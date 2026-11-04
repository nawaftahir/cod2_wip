extern int g_1019bc84;

__declspec(naked) void FUN_1005a270(void)
{
    __asm {
    sub esp, 8
    fld dword ptr [edx]
    mov dword ptr [esp + 4], 0
    fsub dword ptr [ecx]
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 0x41
    je L0
    fld dword ptr [ecx]
    fsub dword ptr [esi]
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 0x41
    jne L1
    fld dword ptr [esp]
    fmul dword ptr [esp]
    fadd dword ptr g_1019bc84
    fstp dword ptr [esp + 4]
    fld dword ptr [edx + 4]
    fsub dword ptr [ecx + 4]
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 0x41
    je L2
    fld dword ptr [ecx + 4]
    fsub dword ptr [esi + 4]
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 0x41
    jne L3
    fld dword ptr [esp]
    fmul dword ptr [esp]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [edx + 8]
    fsub dword ptr [ecx + 8]
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 0x41
    je L4
    fld dword ptr [ecx + 8]
    fsub dword ptr [esi + 8]
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 0x41
    jne L5
    fld dword ptr [esp]
    fmul dword ptr [esp]
    fadd dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    add esp, 8
    ret
    }
}
