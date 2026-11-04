extern int g_101ce6d4;
extern int g_10764578;
extern int g_1076457c;
extern void (__stdcall *fp_101d49dc)(void);
extern void (__stdcall *fp_101d4afc)(void);
extern void (__stdcall *fp_101d4b00)(void);
extern void sub_100376bf(void);

__declspec(naked) void FUN_100376c0(void)
{
    __asm {
    mov eax, dword ptr g_101ce6d4
    sub esp, 0x44
    push esi
    xor esi, esi
    mov dword ptr g_10764578, esi
    mov dword ptr g_1076457c, esi
    cmp dword ptr [eax + 8], esi
    je L4
    push 0x1800000
    call fp_101d49dc
    mov ecx, dword ptr g_101ce6d4
    mov dword ptr g_10764578, eax
    mov eax, dword ptr [ecx + 8]
    add esp, 4
    cmp eax, 2
    jne L4
    mov ecx, dword ptr [esp + 0x4c]
    push ebx
    lea eax, [esp + 0xc]
    call sub_100376bf
    lea edx, [esp + 8]
    push edx
    lea eax, [esp + 0x10]
    push eax
    call fp_101d4afc
    mov ebx, eax
    add esp, 8
    cmp ebx, esi
    jl L4
    xor edx, edx
    mov ecx, 6
    div ecx
    test edx, edx
    jne L4
    cmp ebx, 0x1800000
    jbe L4
    mov ebx, 0x1800000
    mov esi, dword ptr [esp + 8]
    push edi
    mov edi, dword ptr g_10764578
    mov ecx, ebx
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    mov eax, 0xaaaaaaab
    mul ebx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    shr edx, 2
    mov dword ptr g_1076457c, edx
    pop edi
    mov eax, dword ptr [esp + 8]
    push eax
    call fp_101d4b00
    add esp, 4
    pop ebx
    pop esi
    add esp, 0x44
    ret
    }
}
