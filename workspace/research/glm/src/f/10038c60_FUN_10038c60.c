
__declspec(naked) void FUN_10038c60(void)
{
    __asm {
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx]
    fstp dword ptr [eax]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 4]
    fstp dword ptr [eax + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 8]
    fstp dword ptr [eax + 8]
    mov edx, dword ptr [ecx + 0xc]
    fld dword ptr [esp + 4]
    mov dword ptr [eax + 0xc], edx
    fmul dword ptr [ecx + 0x10]
    fstp dword ptr [eax + 0x10]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 0x14]
    fstp dword ptr [eax + 0x14]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 0x18]
    fstp dword ptr [eax + 0x18]
    mov edx, dword ptr [ecx + 0x1c]
    fld dword ptr [esp + 4]
    mov dword ptr [eax + 0x1c], edx
    fmul dword ptr [ecx + 0x20]
    fstp dword ptr [eax + 0x20]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 0x24]
    fstp dword ptr [eax + 0x24]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 0x28]
    fstp dword ptr [eax + 0x28]
    mov edx, dword ptr [ecx + 0x2c]
    mov dword ptr [eax + 0x2c], edx
    mov edx, dword ptr [ecx + 0x30]
    mov dword ptr [eax + 0x30], edx
    mov edx, dword ptr [ecx + 0x34]
    mov dword ptr [eax + 0x34], edx
    mov edx, dword ptr [ecx + 0x38]
    mov dword ptr [eax + 0x38], edx
    mov ecx, dword ptr [ecx + 0x3c]
    mov dword ptr [eax + 0x3c], ecx
    ret
    }
}
