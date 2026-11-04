extern int g_101a509c;
extern int g_101a50a0;
extern int g_101a50a4;
extern int g_101a50cc;
extern void sub_100f84f3(void);
extern void sub_100f8510(void);
extern void sub_100f852c(void);

__declspec(naked) void ___free_lconv_num(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    test esi, esi
    je L3
    mov eax, dword ptr [esi]
    mov ecx, dword ptr g_101a50cc
    cmp eax, dword ptr [ecx]
    je L3
    cmp eax, dword ptr g_101a509c
    je L3
    push eax
    call sub_100f84f3
    pop ecx
    mov eax, dword ptr [esi + 4]
    mov ecx, dword ptr g_101a50cc
    cmp eax, dword ptr [ecx + 4]
    je L3
    cmp eax, dword ptr g_101a50a0
    je L3
    push eax
    call sub_100f8510
    pop ecx
    mov esi, dword ptr [esi + 8]
    mov eax, dword ptr g_101a50cc
    cmp esi, dword ptr [eax + 8]
    je L3
    cmp esi, dword ptr g_101a50a4
    je L3
    push esi
    call sub_100f852c
    pop ecx
    pop esi
    ret
    }
}
