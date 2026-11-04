extern int g_1019bcb0;
extern void sub_100363a0(void);

__declspec(naked) void FUN_1002a6d0(void)
{
    __asm {
    sub esp, 0xc
    fld dword ptr [eax + 0x20]
    lea ecx, [esp]
    fadd dword ptr [eax + 0x14]
    add edx, 0x11c
    fmul dword ptr g_1019bcb0
    fstp dword ptr [esp]
    fld dword ptr [eax + 0x18]
    fadd dword ptr [eax + 0x24]
    fmul dword ptr g_1019bcb0
    fstp dword ptr [esp + 4]
    fld dword ptr [eax + 0x1c]
    fadd dword ptr [eax + 0x28]
    mov eax, dword ptr [esp + 0x14]
    push eax
    push ecx
    fmul dword ptr g_1019bcb0
    push edx
    fstp dword ptr [esp + 0x14]
    call sub_100363a0
    mov eax, dword ptr [esp + 0x1c]
    fstp dword ptr [eax]
    add esp, 0x18
    ret
    }
}
