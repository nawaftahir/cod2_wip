extern int g_1019bcb0;

__declspec(naked) void FUN_1005c470(void)
{
    __asm {
    sub esp, 0x10
    fld dword ptr [ecx]
    fsub dword ptr [edx]
    fstp dword ptr [esp + 4]
    fld dword ptr [ecx + 4]
    fsub dword ptr [edx + 4]
    fstp dword ptr [esp + 8]
    fld dword ptr [ecx + 8]
    fsub dword ptr [edx + 8]
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 4]
    fcomp dword ptr [esp + 0xc]
    fnstsw ax
    test ah, 0x41
    jne L2
    fld dword ptr [esp + 4]
    fsub dword ptr [esp + 0xc]
    fmul dword ptr g_1019bcb0
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fadd dword ptr [edx]
    fstp dword ptr [edx]
    fld dword ptr [ecx]
    fsub dword ptr [esp]
    fstp dword ptr [ecx]
    fld dword ptr [esp + 8]
    fcomp dword ptr [esp + 0xc]
    fnstsw ax
    test ah, 0x41
    jne L2
    fld dword ptr [esp + 8]
    fsub dword ptr [esp + 0xc]
    fmul dword ptr g_1019bcb0
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fadd dword ptr [edx + 4]
    fstp dword ptr [edx + 4]
    fld dword ptr [ecx + 4]
    fsub dword ptr [esp]
    fstp dword ptr [ecx + 4]
    add esp, 0x10
    ret
    }
}
