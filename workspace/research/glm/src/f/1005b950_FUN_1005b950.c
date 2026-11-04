extern int g_1019bd9c;

__declspec(naked) void FUN_1005b950(void)
{
    __asm {
    sub esp, 8
    fld dword ptr [esp + 0xc]
    lea ecx, [eax + 0xc]
    fmul dword ptr g_1019bd9c
    mov dword ptr [eax], 0
    mov dword ptr [eax + 8], 0
    add eax, 4
    fstp dword ptr [esp + 0xc]
    mov dword ptr [esp + 4], ecx
    mov dword ptr [esp], eax
    push eax
    push ecx
    fld dword ptr [esp + 0x14]
    fsincos
    mov ecx, dword ptr [esp + 0xc]
    mov eax, dword ptr [esp + 8]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    add esp, 8
    ret
    }
}
