extern int g_101a50a8;
extern int g_101a50ac;
extern int g_101a50b0;
extern int g_101a50b4;
extern int g_101a50b8;
extern int g_101a50bc;
extern int g_101a50c0;
extern int g_101a50cc;
extern void sub_100f84d0(void);

__declspec(naked) void ___free_lconv_mon(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    test esi, esi
    je L0
    mov eax, dword ptr [esi + 0xc]
    mov ecx, dword ptr g_101a50cc
    cmp eax, dword ptr [ecx + 0xc]
    je L1
    cmp eax, dword ptr g_101a50a8
    je L1
    push eax
    call sub_100f84d0
    pop ecx
    mov eax, dword ptr [esi + 0x10]
    mov ecx, dword ptr g_101a50cc
    cmp eax, dword ptr [ecx + 0x10]
    je L2
    cmp eax, dword ptr g_101a50ac
    je L2
    push eax
    call sub_100f84d0
    pop ecx
    mov eax, dword ptr [esi + 0x14]
    mov ecx, dword ptr g_101a50cc
    cmp eax, dword ptr [ecx + 0x14]
    je L3
    cmp eax, dword ptr g_101a50b0
    je L3
    push eax
    call sub_100f84d0
    pop ecx
    mov eax, dword ptr [esi + 0x18]
    mov ecx, dword ptr g_101a50cc
    cmp eax, dword ptr [ecx + 0x18]
    je L4
    cmp eax, dword ptr g_101a50b4
    je L4
    push eax
    call sub_100f84d0
    pop ecx
    mov eax, dword ptr [esi + 0x1c]
    mov ecx, dword ptr g_101a50cc
    cmp eax, dword ptr [ecx + 0x1c]
    je L5
    cmp eax, dword ptr g_101a50b8
    je L5
    push eax
    call sub_100f84d0
    pop ecx
    mov eax, dword ptr [esi + 0x20]
    mov ecx, dword ptr g_101a50cc
    cmp eax, dword ptr [ecx + 0x20]
    je L6
    cmp eax, dword ptr g_101a50bc
    je L6
    push eax
    call sub_100f84d0
    pop ecx
    mov esi, dword ptr [esi + 0x24]
    mov eax, dword ptr g_101a50cc
    cmp esi, dword ptr [eax + 0x24]
    je L0
    cmp esi, dword ptr g_101a50c0
    je L0
    push esi
    call sub_100f84d0
    pop ecx
    pop esi
    ret
    }
}
