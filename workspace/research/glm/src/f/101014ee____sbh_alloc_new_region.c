extern int g_1076ac68;
extern int g_1076ac6c;
extern int g_1076ac78;
extern int g_1076ac94;
extern void (__stdcall *fp_1010c094)(void);
extern void (__stdcall *fp_1010c104)(void);
extern void (__stdcall *fp_1010c130)(void);
extern void (__stdcall *fp_1010c1ac)(void);

__declspec(naked) void ___sbh_alloc_new_region(void)
{
    __asm {
    mov eax, dword ptr g_1076ac68
    mov ecx, dword ptr g_1076ac78
    push edi
    xor edi, edi
    cmp eax, ecx
    jne L6
    lea eax, [ecx + ecx*4 + 0x50]
    shl eax, 2
    push eax
    push dword ptr g_1076ac6c
    push edi
    push dword ptr g_1076ac94
    call fp_1010c1ac
    cmp eax, edi
    jne L6
    xor eax, eax
    pop edi
    ret
    add dword ptr g_1076ac78, 0x10
    mov dword ptr g_1076ac6c, eax
    mov eax, dword ptr g_1076ac68
    mov ecx, dword ptr g_1076ac6c
    push esi
    push 0x41c4
    push 8
    push dword ptr g_1076ac94
    lea eax, [eax + eax*4]
    lea esi, [ecx + eax*4]
    call fp_1010c130
    cmp eax, edi
    mov dword ptr [esi + 0x10], eax
    jne L6
    xor eax, eax
    jmp L6
    push 4
    push 0x2000
    push 0x100000
    push edi
    call fp_1010c094
    cmp eax, edi
    mov dword ptr [esi + 0xc], eax
    jne L6
    push dword ptr [esi + 0x10]
    push edi
    push dword ptr g_1076ac94
    call fp_1010c104
    jmp L6
    or dword ptr [esi + 8], 0xffffffff
    mov dword ptr [esi], edi
    mov dword ptr [esi + 4], edi
    inc dword ptr g_1076ac68
    mov eax, dword ptr [esi + 0x10]
    or dword ptr [eax], 0xffffffff
    mov eax, esi
    pop esi
    pop edi
    ret
    }
}
