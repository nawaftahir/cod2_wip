extern int g_1019bd80;
extern int g_1019bda4;

__declspec(naked) void FUN_10059360(void)
{
    __asm {
    sub esp, 0x20
    fld dword ptr [eax]
    fmul dword ptr g_1019bda4
    fstp dword ptr [esp]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 0xc]
    fld dword ptr [esp]
    fadd qword ptr [esp + 0xc]
    fistp dword ptr [esp + 0x14]
    fld dword ptr [eax + 4]
    fmul dword ptr g_1019bda4
    fstp dword ptr [esp]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 4]
    fld dword ptr [esp]
    fadd qword ptr [esp + 4]
    fistp dword ptr [esp + 0xc]
    fld dword ptr [eax + 8]
    fmul dword ptr g_1019bda4
    fstp dword ptr [esp]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 0x18]
    fld dword ptr [esp]
    fadd qword ptr [esp + 0x18]
    fistp dword ptr [esp + 4]
    mov eax, dword ptr [esp + 4]
    mov ecx, dword ptr [esp + 0xc]
    mov edx, dword ptr [esp + 0x14]
    and eax, 0x3ff
    shl eax, 0xa
    and ecx, 0x3ff
    or eax, ecx
    shl eax, 0xa
    and edx, 0x3ff
    or eax, edx
    add esp, 0x20
    ret
    }
}
