extern int g_1019bc78;
extern int g_1019bda8;
extern void sub_1010a920(void);

__declspec(naked) void FUN_10058510(void)
{
    __asm {
    sub esp, 0x14
    fld dword ptr [esp + 0x18]
    fadd st(0), st(0)
    fsub dword ptr g_1019bc78
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fmul dword ptr [esp]
    fsubr dword ptr g_1019bc78
    call sub_1010a920
    fstp dword ptr [esp + 0x18]
    fld dword ptr [esp + 0x18]
    lea eax, [esp + 0x18]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 0x1c]
    lea ecx, [esp + 0x1c]
    fmul dword ptr g_1019bda8
    mov dword ptr [esp + 0xc], eax
    mov dword ptr [esp + 8], ecx
    fstp dword ptr [esp + 0x10]
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
    mov edx, dword ptr [esp]
    fmul dword ptr [esp + 4]
    mov dword ptr [esi + 8], edx
    fstp dword ptr [esi]
    fld dword ptr [esp + 0x1c]
    fmul dword ptr [esp + 4]
    fstp dword ptr [esi + 4]
    add esp, 0x14
    ret
    }
}
