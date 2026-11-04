
__declspec(naked) void FUN_1005e100(void)
{
    __asm {
    sub esp, 0x18
    lea eax, [esp + 4]
    lea ecx, [esp + 8]
    mov dword ptr [esp + 0x14], eax
    mov dword ptr [esp + 0x10], ecx
    push eax
    push ecx
    fld dword ptr [esp + 0x28]
    fsincos
    mov ecx, dword ptr [esp + 0x1c]
    mov eax, dword ptr [esp + 0x18]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    lea eax, [esp]
    lea ecx, [esp + 0xc]
    mov dword ptr [esp + 0x10], eax
    mov dword ptr [esp + 0x14], ecx
    push eax
    push ecx
    fld dword ptr [esp + 0x28]
    fsincos
    mov ecx, dword ptr [esp + 0x18]
    mov eax, dword ptr [esp + 0x1c]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [esp]
    fmul dword ptr [esp + 4]
    fmul dword ptr [esp + 0x1c]
    fstp dword ptr [edx]
    fld dword ptr [esp]
    fmul dword ptr [esp + 8]
    fmul dword ptr [esp + 0x1c]
    fstp dword ptr [edx + 4]
    fld dword ptr [esp + 0xc]
    fmul dword ptr [esp + 0x1c]
    fstp dword ptr [edx + 8]
    add esp, 0x18
    ret
    }
}
