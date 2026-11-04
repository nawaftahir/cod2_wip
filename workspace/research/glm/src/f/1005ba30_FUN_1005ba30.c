extern int g_1019bd9c;

__declspec(naked) void FUN_1005ba30(void)
{
    __asm {
    sub esp, 0xc
    fld dword ptr [esp + 0x10]
    lea eax, [edx + 0xc]
    fmul dword ptr g_1019bd9c
    lea ecx, [esp]
    mov dword ptr [esp + 8], eax
    mov dword ptr [esp + 4], ecx
    fstp dword ptr [esp + 0x10]
    push eax
    push ecx
    fld dword ptr [esp + 0x18]
    fsincos
    mov ecx, dword ptr [esp + 0x10]
    mov eax, dword ptr [esp + 0xc]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [esp]
    fmul dword ptr [esi]
    fstp dword ptr [edx]
    fld dword ptr [esp]
    fmul dword ptr [esi + 4]
    fstp dword ptr [edx + 4]
    fld dword ptr [esp]
    fmul dword ptr [esi + 8]
    fstp dword ptr [edx + 8]
    add esp, 0xc
    ret
    }
}
