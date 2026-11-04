extern int g_1019bd8c;

__declspec(naked) void FUN_1005bb70(void)
{
    __asm {
    sub esp, 0x10
    fld dword ptr [esp + 0x14]
    lea eax, [esp]
    fmul dword ptr g_1019bd8c
    lea ecx, [esp + 0x14]
    push esi
    mov dword ptr [esp + 0xc], eax
    fstp dword ptr [esp + 0x10]
    mov dword ptr [esp + 8], ecx
    push eax
    push ecx
    fld dword ptr [esp + 0x18]
    fsincos
    mov ecx, dword ptr [esp + 0x14]
    mov eax, dword ptr [esp + 0x10]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [esp + 0x18]
    mov esi, dword ptr [esp + 0x18]
    fchs
    mov eax, dword ptr [esp + 4]
    fstp dword ptr [edx + 4]
    xor ecx, ecx
    mov dword ptr [edx + 0xc], esi
    mov dword ptr [edx], eax
    mov dword ptr [edx + 8], ecx
    mov dword ptr [edx + 0x10], eax
    mov dword ptr [edx + 0x14], ecx
    mov dword ptr [edx + 0x18], ecx
    mov dword ptr [edx + 0x1c], ecx
    mov dword ptr [edx + 0x20], 0x3f800000
    pop esi
    add esp, 0x10
    ret
    }
}
