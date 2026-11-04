extern int g_101ae164;
extern int g_101ae168;
extern int g_1076ac84;
extern int g_1076ac88;
extern int g_1076ac90;
extern void sub_100f84d0(void);
extern void sub_100ff919(void);
extern void sub_100ffb3b(void);
extern void sub_100ffd9a(void);

__declspec(naked) void ___freetlocinfo(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    mov eax, dword ptr [esi + 0x3c]
    push edi
    xor edi, edi
    cmp eax, dword ptr g_101ae168
    je L0
    cmp eax, edi
    je L0
    mov eax, dword ptr [esi + 0x2c]
    cmp dword ptr [eax], edi
    jne L0
    mov eax, dword ptr [esi + 0x34]
    cmp eax, edi
    je L1
    cmp dword ptr [eax], edi
    jne L1
    cmp eax, dword ptr g_1076ac88
    je L1
    push eax
    call sub_100f84d0
    push dword ptr [esi + 0x3c]
    call sub_100ffd9a
    pop ecx
    pop ecx
    mov eax, dword ptr [esi + 0x30]
    cmp eax, edi
    je L2
    cmp dword ptr [eax], edi
    jne L2
    cmp eax, dword ptr g_1076ac90
    je L2
    push eax
    call sub_100f84d0
    push dword ptr [esi + 0x3c]
    call sub_100ffb3b
    pop ecx
    pop ecx
    push dword ptr [esi + 0x2c]
    call sub_100f84d0
    push dword ptr [esi + 0x3c]
    call sub_100f84d0
    pop ecx
    pop ecx
    mov eax, dword ptr [esi + 0x40]
    cmp eax, dword ptr g_1076ac84
    je L3
    cmp eax, edi
    je L3
    cmp dword ptr [eax], edi
    jne L3
    push eax
    call sub_100f84d0
    mov eax, dword ptr [esi + 0x44]
    sub eax, 0xfe
    push eax
    call sub_100f84d0
    pop ecx
    pop ecx
    mov eax, dword ptr [esi + 0x50]
    cmp eax, dword ptr g_101ae164
    je L4
    cmp eax, edi
    je L4
    cmp dword ptr [eax + 0xb4], edi
    jne L4
    push eax
    call sub_100ff919
    push dword ptr [esi + 0x50]
    call sub_100f84d0
    pop ecx
    pop ecx
    push esi
    call sub_100f84d0
    pop ecx
    pop edi
    pop esi
    ret
    }
}
