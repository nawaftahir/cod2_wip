extern int g_1019bc84;
extern int g_101ce6e8;
extern int g_101ce6ec;
extern int g_101ce740;
extern int g_101ce744;
extern int g_101ce7ac;
extern int g_101ce7b0;
extern int g_101d1b9c;

__declspec(naked) void FUN_100305d0(void)
{
    __asm {
    mov dword ptr [ecx], 0
    mov eax, dword ptr g_101ce6e8
    fld dword ptr [eax + 8]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 0x41
    je L0
    mov edx, dword ptr g_101d1b9c
    mov eax, dword ptr [edx + 0x20]
    test eax, eax
    je L1
    mov eax, dword ptr g_101ce740
    fld dword ptr [eax + 8]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 0x41
    jne L1
    mov edx, dword ptr g_101ce7ac
    mov eax, dword ptr [edx + 8]
    mov dword ptr [ecx], eax
    mov dword ptr [ecx + 4], 0
    mov edx, dword ptr g_101ce6ec
    fld dword ptr [edx + 8]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 0x41
    je L2
    mov eax, dword ptr g_101d1b9c
    mov edx, dword ptr [eax + 0x20]
    test edx, edx
    je L3
    mov edx, dword ptr g_101ce744
    fld dword ptr [edx + 8]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 0x41
    jne L3
    mov eax, dword ptr g_101ce7b0
    mov edx, dword ptr [eax + 8]
    mov dword ptr [ecx + 4], edx
    fld dword ptr g_1019bc84
    fld dword ptr [ecx + 4]
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L4
    fld dword ptr g_1019bc84
    fld dword ptr [ecx]
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L5
    fld dword ptr [ecx]
    fcomp dword ptr [ecx + 4]
    fnstsw ax
    test ah, 0x41
    je L5
    xor eax, eax
    ret
    mov eax, dword ptr [ecx + 4]
    fld dword ptr [ecx]
    mov dword ptr [ecx], eax
    fstp dword ptr [ecx + 4]
    mov eax, 1
    ret
    }
}
