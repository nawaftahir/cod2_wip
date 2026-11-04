extern int g_1019bda8;
extern void sub_1010a920(void);

__declspec(naked) void FUN_100584a0(void)
{
    __asm {
    sub esp, 0x10
    fld dword ptr [esp + 0x14]
    call sub_1010a920
    fstp dword ptr [esp + 0x14]
    fld dword ptr [esp + 0x14]
    lea eax, [esp + 0x14]
    fstp dword ptr [esp]
    fld dword ptr [esp + 0x18]
    lea ecx, [esp + 0x18]
    fmul dword ptr g_1019bda8
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
    fmul dword ptr [esp]
    fstp dword ptr [esi]
    fld dword ptr [esp + 0x18]
    fmul dword ptr [esp]
    fstp dword ptr [esi + 4]
    add esp, 0x10
    ret
    }
}
