extern int g_106d3194;
extern void sub_10005590(void);

__declspec(naked) void FUN_10035a50(void)
{
    __asm {
    sub esp, 0x18
    fld dword ptr [eax]
    push esi
    fsub dword ptr [esp + 0x20]
    mov esi, dword ptr g_106d3194
    add esi, 0x249d18
    lea edx, [esp + 4]
    fstp dword ptr [esp + 0x10]
    fld dword ptr [eax + 4]
    fsub dword ptr [esp + 0x20]
    fstp dword ptr [esp + 0x14]
    fld dword ptr [eax + 8]
    fsub dword ptr [esp + 0x20]
    fstp dword ptr [esp + 0x18]
    fld dword ptr [esp + 0x20]
    fadd dword ptr [eax]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 0x20]
    fadd dword ptr [eax + 4]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 0x20]
    fadd dword ptr [eax + 8]
    mov eax, dword ptr [esp + 0x24]
    push eax
    lea eax, [esp + 0x14]
    fstp dword ptr [esp + 0x10]
    call sub_10005590
    add esp, 4
    pop esi
    add esp, 0x18
    ret
    }
}
