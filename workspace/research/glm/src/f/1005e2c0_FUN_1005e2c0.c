extern int g_1019bc78;
extern int g_1019bc84;
extern void sub_1010a920(void);

__declspec(naked) void FUN_1005e2c0(void)
{
    __asm {
    sub esp, 0x5c
    fld dword ptr [eax + 0x14]
    push esi
    fsub dword ptr [eax + 0x1c]
    or esi, 0xffffffff
    mov dword ptr [esp + 8], 0
    fstp dword ptr [esp + 0x20]
    mov ecx, dword ptr [esp + 0x20]
    fld dword ptr [eax + 0x18]
    mov dword ptr [esp + 0x3c], ecx
    fsub dword ptr [eax + 8]
    fstp dword ptr [esp + 0x24]
    mov ecx, dword ptr [esp + 0x24]
    fld dword ptr [eax + 4]
    mov dword ptr [esp + 0x4c], ecx
    fsub dword ptr [eax + 0xc]
    fstp dword ptr [esp + 0x28]
    fld dword ptr [eax + 0x20]
    fadd dword ptr [eax]
    fadd dword ptr [eax + 0x10]
    fadd dword ptr g_1019bc78
    fstp dword ptr [esp + 0x2c]
    fld dword ptr [eax]
    fsub dword ptr [eax + 0x10]
    fsub dword ptr [eax + 0x20]
    fadd dword ptr g_1019bc78
    fstp dword ptr [esp + 0x30]
    fld dword ptr [eax + 4]
    fadd dword ptr [eax + 0xc]
    fstp dword ptr [esp + 0x34]
    mov edx, dword ptr [esp + 0x34]
    fld dword ptr [eax + 0x18]
    mov dword ptr [esp + 0x40], edx
    fadd dword ptr [eax + 8]
    fstp dword ptr [esp + 0x38]
    mov edx, dword ptr [esp + 0x38]
    fld dword ptr [eax + 0x10]
    mov dword ptr [esp + 0x50], edx
    fsub dword ptr [eax]
    mov edx, dword ptr [esp + 0x28]
    mov dword ptr [esp + 0x5c], edx
    fsub dword ptr [eax + 0x20]
    fadd dword ptr g_1019bc78
    fstp dword ptr [esp + 0x44]
    fld dword ptr [eax + 0x1c]
    fadd dword ptr [eax + 0x14]
    fstp dword ptr [esp + 0x48]
    mov ecx, dword ptr [esp + 0x48]
    fld dword ptr [eax + 0x20]
    mov dword ptr [esp + 0x54], ecx
    fsub dword ptr [eax + 0x10]
    fsub dword ptr [eax]
    fadd dword ptr g_1019bc78
    fstp dword ptr [esp + 0x58]
    fld dword ptr [esp + 0x28]
    fmul dword ptr [esp + 0x28]
    fstp dword ptr [esp + 0x1c]
    fld dword ptr [esp + 0x24]
    fmul dword ptr [esp + 0x24]
    fstp dword ptr [esp + 0x14]
    fld dword ptr [esp + 0x20]
    fmul dword ptr [esp + 0x20]
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 0x2c]
    fmul dword ptr [esp + 0x2c]
    fadd dword ptr [esp + 0xc]
    fadd dword ptr [esp + 0x14]
    fadd dword ptr [esp + 0x1c]
    fstp dword ptr [esp + 4]
    fld dword ptr g_1019bc84
    fcomp dword ptr [esp + 4]
    fnstsw ax
    test ah, 1
    je L0
    mov eax, dword ptr [esp + 4]
    mov dword ptr [esp + 8], eax
    xor esi, esi
    fld dword ptr [esp + 0x38]
    fmul dword ptr [esp + 0x38]
    fstp dword ptr [esp + 0x18]
    fld dword ptr [esp + 0x34]
    fmul dword ptr [esp + 0x34]
    fstp dword ptr [esp + 0x10]
    fld dword ptr [esp + 0x30]
    fmul dword ptr [esp + 0x30]
    fadd dword ptr [esp + 0x10]
    fadd dword ptr [esp + 0x18]
    fadd dword ptr [esp + 0xc]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 8]
    fcomp dword ptr [esp + 4]
    fnstsw ax
    test ah, 1
    je L1
    mov ecx, dword ptr [esp + 4]
    mov dword ptr [esp + 8], ecx
    mov esi, 1
    fld dword ptr [esp + 0x48]
    fmul dword ptr [esp + 0x48]
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 0x44]
    fmul dword ptr [esp + 0x44]
    fadd dword ptr [esp + 0xc]
    fadd dword ptr [esp + 0x10]
    fadd dword ptr [esp + 0x14]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 8]
    fcomp dword ptr [esp + 4]
    fnstsw ax
    test ah, 1
    je L2
    mov edx, dword ptr [esp + 4]
    mov dword ptr [esp + 8], edx
    mov esi, 2
    fld dword ptr [esp + 0x58]
    fmul dword ptr [esp + 0x58]
    fadd dword ptr [esp + 0xc]
    fadd dword ptr [esp + 0x18]
    fadd dword ptr [esp + 0x1c]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 8]
    fcomp dword ptr [esp + 4]
    fnstsw ax
    test ah, 1
    je L3
    mov eax, dword ptr [esp + 4]
    mov dword ptr [esp + 8], eax
    mov esi, 3
    fld dword ptr [esp + 8]
    call sub_1010a920
    fstp dword ptr [esp + 0x1c]
    fld dword ptr [esp + 0x1c]
    shl esi, 4
    fdivr dword ptr g_1019bc78
    lea eax, [esp + esi + 0x20]
    pop esi
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [eax]
    fstp dword ptr [edi]
    fld dword ptr [esp + 4]
    fmul dword ptr [eax + 4]
    fstp dword ptr [edi + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [eax + 8]
    fstp dword ptr [edi + 8]
    fld dword ptr [esp + 4]
    fmul dword ptr [eax + 0xc]
    fstp dword ptr [edi + 0xc]
    add esp, 0x5c
    ret
    }
}
