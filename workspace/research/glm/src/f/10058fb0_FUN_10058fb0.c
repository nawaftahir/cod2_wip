extern int g_1019bc84;

__declspec(naked) void FUN_10058fb0(void)
{
    __asm {
    sub esp, 0x10
    mov eax, dword ptr [ecx]
    mov dword ptr [esp], eax
    fld dword ptr [esp]
    mov eax, dword ptr [ecx + 4]
    fmul dword ptr [esp]
    mov dword ptr [esp], eax
    mov eax, dword ptr [ecx + 8]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp]
    fmul dword ptr [esp]
    mov dword ptr [esp], eax
    fstp dword ptr [esp + 8]
    fld dword ptr [esp]
    fmul dword ptr [esp]
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 0xc]
    fcomp dword ptr [esp + 4]
    fnstsw ax
    test ah, 1
    jne L0
    fld dword ptr [esp + 0xc]
    fcomp dword ptr [esp + 8]
    fnstsw ax
    test ah, 1
    jne L0
    fld dword ptr [ecx + 8]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 0x41
    jne L1
    mov dword ptr [esi], 0
    mov dword ptr [edx], 1
    add esp, 0x10
    ret
    mov dword ptr [esi], 1
    mov dword ptr [edx], 0
    add esp, 0x10
    ret
    fld dword ptr [esp + 8]
    fcomp dword ptr [esp + 4]
    fnstsw ax
    test ah, 1
    jne L2
    fld dword ptr [esp + 8]
    fcomp dword ptr [esp + 0xc]
    fnstsw ax
    test ah, 1
    jne L2
    fld dword ptr [ecx + 4]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 0x41
    jne L3
    mov dword ptr [esi], 2
    mov dword ptr [edx], 0
    add esp, 0x10
    ret
    mov dword ptr [esi], 0
    mov dword ptr [edx], 2
    add esp, 0x10
    ret
    fld dword ptr [ecx]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 0x41
    jne L4
    mov dword ptr [esi], 1
    mov dword ptr [edx], 2
    add esp, 0x10
    ret
    mov dword ptr [esi], 2
    mov dword ptr [edx], 1
    add esp, 0x10
    ret
    }
}
