
__declspec(naked) void FUN_10058f40(void)
{
    __asm {
    sub esp, 0x10
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [esp], ecx
    fld dword ptr [esp]
    fmul dword ptr [esp]
    mov dword ptr [esp], edx
    fstp dword ptr [esp + 4]
    fld dword ptr [esp]
    fmul dword ptr [esp]
    mov dword ptr [esp], eax
    fstp dword ptr [esp + 8]
    fld dword ptr [esp]
    fmul dword ptr [esp]
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 8]
    fcomp dword ptr [esp + 4]
    fnstsw ax
    test ah, 0x41
    jne L3
    mov ecx, 1
    jmp L3
    xor ecx, ecx
    fld dword ptr [esp + 0xc]
    fcomp dword ptr [esp + ecx*4 + 4]
    fnstsw ax
    test ah, 0x41
    mov eax, 2
    je L3
    mov eax, ecx
    add esp, 0x10
    ret
    }
}
