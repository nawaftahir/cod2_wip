extern void sub_1005df90(void);

__declspec(naked) void FUN_1005e0b0(void)
{
    __asm {
    sub esp, 0x18
    fld dword ptr [eax]
    fsub dword ptr [esi]
    fstp dword ptr [esp]
    fld dword ptr [eax + 4]
    fsub dword ptr [esi + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [eax + 8]
    lea eax, [esp + 0xc]
    fsub dword ptr [esi + 8]
    push eax
    lea eax, [esp + 4]
    fstp dword ptr [esp + 0xc]
    call sub_1005df90
    fld dword ptr [esp + 0x10]
    fadd dword ptr [esi]
    fstp dword ptr [edi]
    fld dword ptr [esp + 0x14]
    fadd dword ptr [esi + 4]
    fstp dword ptr [edi + 4]
    fld dword ptr [esp + 0x18]
    fadd dword ptr [esi + 8]
    fstp dword ptr [edi + 8]
    add esp, 0x1c
    ret
    }
}
