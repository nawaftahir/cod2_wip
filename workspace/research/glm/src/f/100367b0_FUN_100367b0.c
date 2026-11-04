extern int g_1019bdac;

__declspec(naked) void FUN_100367b0(void)
{
    __asm {
    xor edx, edx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], edx
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [ecx]
    mov dword ptr [eax], edx
    mov edx, dword ptr [ecx + 0x20]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [ecx + 0x40]
    mov dword ptr [eax + 8], edx
    fld dword ptr [ecx + 4]
    fadd dword ptr [eax]
    fstp dword ptr [eax]
    fld dword ptr [ecx + 0x24]
    fadd dword ptr [eax + 4]
    fstp dword ptr [eax + 4]
    fld dword ptr [ecx + 0x44]
    fadd dword ptr [eax + 8]
    fstp dword ptr [eax + 8]
    fld dword ptr [ecx + 8]
    fadd dword ptr [eax]
    fstp dword ptr [eax]
    fld dword ptr [ecx + 0x28]
    fadd dword ptr [eax + 4]
    fstp dword ptr [eax + 4]
    fld dword ptr [ecx + 0x48]
    fadd dword ptr [eax + 8]
    fstp dword ptr [eax + 8]
    fld dword ptr [ecx + 0xc]
    fadd dword ptr [eax]
    fstp dword ptr [eax]
    fld dword ptr [ecx + 0x2c]
    fadd dword ptr [eax + 4]
    fstp dword ptr [eax + 4]
    fld dword ptr [ecx + 0x4c]
    fadd dword ptr [eax + 8]
    fstp dword ptr [eax + 8]
    fld dword ptr [ecx + 0x10]
    fadd dword ptr [eax]
    fstp dword ptr [eax]
    fld dword ptr [ecx + 0x30]
    fadd dword ptr [eax + 4]
    fstp dword ptr [eax + 4]
    fld dword ptr [ecx + 0x50]
    fadd dword ptr [eax + 8]
    fstp dword ptr [eax + 8]
    fld dword ptr [ecx + 0x14]
    fadd dword ptr [eax]
    fstp dword ptr [eax]
    fld dword ptr [ecx + 0x34]
    fadd dword ptr [eax + 4]
    fstp dword ptr [eax + 4]
    fld dword ptr [ecx + 0x54]
    fadd dword ptr [eax + 8]
    fstp dword ptr [eax + 8]
    fld dword ptr [ecx + 0x18]
    fadd dword ptr [eax]
    fstp dword ptr [eax]
    fld dword ptr [ecx + 0x38]
    fadd dword ptr [eax + 4]
    fstp dword ptr [eax + 4]
    fld dword ptr [ecx + 0x58]
    fadd dword ptr [eax + 8]
    fstp dword ptr [eax + 8]
    fld dword ptr [ecx + 0x1c]
    fadd dword ptr [eax]
    fstp dword ptr [eax]
    fld dword ptr [ecx + 0x3c]
    fadd dword ptr [eax + 4]
    fstp dword ptr [eax + 4]
    fld dword ptr [ecx + 0x5c]
    fadd dword ptr [eax + 8]
    fstp dword ptr [eax + 8]
    fld dword ptr [eax]
    fmul dword ptr g_1019bdac
    fstp dword ptr [eax]
    fld dword ptr [eax + 4]
    fmul dword ptr g_1019bdac
    fstp dword ptr [eax + 4]
    fld dword ptr [eax + 8]
    fmul dword ptr g_1019bdac
    fstp dword ptr [eax + 8]
    ret
    }
}
