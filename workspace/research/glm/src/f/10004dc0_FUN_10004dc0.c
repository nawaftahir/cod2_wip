extern int g_1019bc78;
extern int g_1019bc84;
extern int g_1019bd8c;
extern void sub_1005df00(void);

__declspec(naked) void FUN_10004dc0(void)
{
    __asm {
    sub esp, 0x3c
    push edi
    mov edi, eax
    fld dword ptr [edi + 0x78]
    lea eax, [esp + 8]
    fmul dword ptr g_1019bd8c
    lea ecx, [esp + 0xc]
    mov dword ptr [esp + 0x24], eax
    mov dword ptr [esp + 0x20], ecx
    fstp dword ptr [esp + 0x14]
    push eax
    push ecx
    fld dword ptr [esp + 0x1c]
    fsincos
    mov ecx, dword ptr [esp + 0x2c]
    mov eax, dword ptr [esp + 0x28]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [edi + 0x74]
    lea edx, [esp + 4]
    fmul dword ptr g_1019bd8c
    lea eax, [esp + 0x10]
    mov dword ptr [esp + 0x20], edx
    mov dword ptr [esp + 0x24], eax
    fstp dword ptr [esp + 0x14]
    push eax
    push ecx
    fld dword ptr [esp + 0x1c]
    fsincos
    mov ecx, dword ptr [esp + 0x28]
    mov eax, dword ptr [esp + 0x2c]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 8]
    fstp dword ptr [esp + 0x34]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 0xc]
    fstp dword ptr [esp + 0x38]
    fld dword ptr [esp + 0x10]
    fchs
    fstp dword ptr [esp + 0x3c]
    fld dword ptr g_1019bc84
    fld dword ptr [edi + 0x40]
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L0
    lea ecx, [edi + 0x44]
    mov edx, ecx
    call sub_1005df00
    fld dword ptr g_1019bc84
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L0
    mov edx, dword ptr [edi + 0x40]
    mov dword ptr [esp + 0x1c], edx
    fld dword ptr [esp + 0x1c]
    fmul dword ptr [ecx]
    fstp dword ptr [esp + 0x28]
    mov eax, dword ptr [esp + 0x28]
    fld dword ptr [esp + 0x1c]
    fmul dword ptr [ecx + 4]
    fstp dword ptr [esp + 0x2c]
    fld dword ptr [esp + 0x1c]
    fmul dword ptr [ecx + 8]
    mov ecx, dword ptr [esp + 0x2c]
    fstp dword ptr [esp + 0x30]
    mov edx, dword ptr [esp + 0x30]
    jmp L1
    xor eax, eax
    xor ecx, ecx
    xor edx, edx
    test esi, esi
    fld dword ptr [edi + 0x54]
    fsub dword ptr [edi + 0x40]
    fstp dword ptr [esp + 0x24]
    fld dword ptr g_1019bc78
    fsub dword ptr [edi + 0x50]
    fmul dword ptr [esp + 0x24]
    fstp dword ptr [esp + 0x1c]
    fld dword ptr [esp + 0x1c]
    fmul dword ptr [edi + 0x58]
    fstp dword ptr [esp + 0x28]
    fld dword ptr [esp + 0x1c]
    fmul dword ptr [edi + 0x5c]
    fstp dword ptr [esp + 0x2c]
    fld dword ptr [esp + 0x1c]
    fmul dword ptr [edi + 0x60]
    fstp dword ptr [esp + 0x30]
    je L2
    mov edi, dword ptr [esp + 0x34]
    mov dword ptr [esi + 4], edi
    mov edi, dword ptr [esp + 0x38]
    mov dword ptr [esi + 8], edi
    mov edi, dword ptr [esp + 0x3c]
    mov dword ptr [esi + 0xc], edi
    mov edi, dword ptr [esp + 0x28]
    mov dword ptr [esi + 0x10], 0
    mov dword ptr [esi + 0x14], edi
    mov edi, dword ptr [esp + 0x2c]
    mov dword ptr [esi + 0x18], edi
    mov edi, dword ptr [esp + 0x30]
    mov dword ptr [esi + 0x1c], edi
    mov dword ptr [esi + 0x20], eax
    mov dword ptr [esi + 0x24], ecx
    mov dword ptr [esi + 0x28], edx
    pop edi
    add esp, 0x3c
    ret
    }
}
