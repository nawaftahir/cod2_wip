extern int g_1019bd8c;

__declspec(naked) void FUN_1005ba90(void)
{
    __asm {
    sub esp, 0x10
    fld dword ptr [esp + 0x14]
    lea eax, [esp]
    fmul dword ptr g_1019bd8c
    lea ecx, [esp + 0x14]
    mov dword ptr [esp + 8], eax
    mov dword ptr [esp + 4], ecx
    fstp dword ptr [esp + 0xc]
    push eax
    push ecx
    fld dword ptr [esp + 0x14]
    fsincos
    mov ecx, dword ptr [esp + 0x10]
    mov eax, dword ptr [esp + 0xc]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [esp + 0x14]
    mov eax, dword ptr [esp]
    fchs
    xor ecx, ecx
    fstp dword ptr [edx + 0x14]
    mov dword ptr [edx + 4], ecx
    mov dword ptr [edx + 8], ecx
    mov dword ptr [edx + 0xc], ecx
    mov dword ptr [edx + 0x18], ecx
    mov ecx, dword ptr [esp + 0x14]
    mov dword ptr [edx], 0x3f800000
    mov dword ptr [edx + 0x10], eax
    mov dword ptr [edx + 0x1c], ecx
    mov dword ptr [edx + 0x20], eax
    add esp, 0x10
    ret
    }
}
