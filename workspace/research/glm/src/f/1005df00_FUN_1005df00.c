extern int g_1019bc78;
extern int g_1019bc84;

__declspec(naked) void FUN_1005df00(void)
{
    __asm {
    sub esp, 8
    mov eax, dword ptr [ecx]
    fld dword ptr [ecx + 4]
    mov dword ptr [esp], eax
    fcomp dword ptr [esp]
    fnstsw ax
    test ah, 0x41
    jne L3
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [esp], eax
    fld dword ptr [ecx + 8]
    fcomp dword ptr [esp]
    fnstsw ax
    test ah, 0x41
    jne L3
    mov eax, dword ptr [ecx + 8]
    mov dword ptr [esp], eax
    fld dword ptr g_1019bc84
    fld dword ptr [esp]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L3
    fld dword ptr g_1019bc84
    mov eax, 0x3f800000
    mov dword ptr [edx + 8], eax
    mov dword ptr [edx + 4], eax
    mov dword ptr [edx], eax
    add esp, 8
    ret
    fld dword ptr g_1019bc78
    fdiv dword ptr [esp]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx]
    fstp dword ptr [edx]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 4]
    fstp dword ptr [edx + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 8]
    fstp dword ptr [edx + 8]
    fld dword ptr [esp]
    add esp, 8
    ret
    }
}
