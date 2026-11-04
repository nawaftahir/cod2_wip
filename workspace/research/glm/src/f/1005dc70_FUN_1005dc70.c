extern int g_1019bca4;
extern int g_1019bca8;
extern void sub_10059140(void);
extern void sub_10059870(void);
extern void sub_1010a8a8(void);

__declspec(naked) void FUN_1005dc70(void)
{
    __asm {
    sub esp, 0x10
    fld dword ptr [ebx]
    push esi
    fsub dword ptr [edi]
    lea esi, [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [ebx + 4]
    fsub dword ptr [edi + 4]
    fstp dword ptr [esp + 0xc]
    fld dword ptr [ebx + 8]
    fsub dword ptr [edi + 8]
    fstp dword ptr [esp + 0x10]
    call sub_10059140
    fstp dword ptr [esp + 4]
    pop esi
    fld dword ptr [esp]
    fsub dword ptr [esp + 0x14]
    fstp dword ptr [esp + 0x14]
    fld dword ptr [esp + 0x14]
    fmul dword ptr [esp + 0x14]
    fld dword ptr [esp + 0x18]
    fmul dword ptr [esp + 0x18]
    fcompp
    fnstsw ax
    test ah, 5
    jnp L0
    fld dword ptr [edi + 8]
    fsub dword ptr [esp + 0x24]
    fcomp dword ptr [ebx + 8]
    fnstsw ax
    test ah, 0x41
    je L0
    fld dword ptr [esp + 0x24]
    fadd dword ptr [edi + 8]
    fcomp dword ptr [ebx + 8]
    fnstsw ax
    test ah, 5
    jnp L0
    lea ecx, [esp + 4]
    call sub_10059870
    fstp dword ptr [esp + 0x18]
    fld dword ptr [esp + 0x18]
    fmul dword ptr g_1019bca8
    call sub_1010a8a8
    and eax, 0xffff
    mov dword ptr [esp + 0x18], eax
    fild dword ptr [esp + 0x18]
    fstp dword ptr [esp + 0x18]
    fld dword ptr [esp + 0x18]
    fmul dword ptr g_1019bca4
    fstp dword ptr [esp + 0x18]
    fld dword ptr [esp + 0x1c]
    fcomp dword ptr [esp + 0x20]
    fld dword ptr [esp + 0x18]
    fnstsw ax
    fcomp dword ptr [esp + 0x20]
    test ah, 5
    fnstsw ax
    jp L1
    test ah, 5
    jnp L2
    xor eax, eax
    add esp, 0x10
    ret
    test ah, 5
    jnp L3
    fld dword ptr [esp + 0x18]
    fcomp dword ptr [esp + 0x1c]
    fnstsw ax
    test ah, 0x41
    jne L0
    mov eax, 1
    add esp, 0x10
    ret
    }
}
