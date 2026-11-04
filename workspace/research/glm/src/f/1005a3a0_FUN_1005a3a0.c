
__declspec(naked) void FUN_1005a3a0(void)
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
    mov dword ptr [eax + 0xc], 0
    fstp dword ptr [eax + 8]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 0xc]
    fstp dword ptr [eax + 0x10]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 0x10]
    fstp dword ptr [eax + 0x14]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 0x14]
    mov dword ptr [eax + 0x1c], 0
    fstp dword ptr [eax + 0x18]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 0x18]
    fstp dword ptr [eax + 0x20]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 0x1c]
    fstp dword ptr [eax + 0x24]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 0x20]
    mov dword ptr [eax + 0x2c], 0
    fstp dword ptr [eax + 0x28]
    mov ecx, dword ptr [edx]
    mov dword ptr [eax + 0x30], ecx
    mov ecx, dword ptr [edx + 4]
    mov dword ptr [eax + 0x34], ecx
    mov edx, dword ptr [edx + 8]
    mov dword ptr [eax + 0x38], edx
    mov dword ptr [eax + 0x3c], 0x3f800000
    ret
    }
}
