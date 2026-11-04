extern int g_1010c084;
extern void (__stdcall *fp_1010c088)(void);

__declspec(naked) void FUN_100825f5(void)
{
    __asm {
    mov edi, edi
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 8]
    test eax, eax
    push edi
    je L3
    push eax
    call fp_1010c088
    and dword ptr [esi + 8], 0
    and dword ptr [esi + 0xc], 0
    mov eax, dword ptr [esi + 4]
    cmp eax, -1
    mov edi, dword ptr g_1010c084
    je L3
    push eax
    call edi
    or dword ptr [esi + 4], 0xffffffff
    mov eax, dword ptr [esi]
    cmp eax, -1
    je L3
    push eax
    call edi
    or dword ptr [esi], 0xffffffff
    pop edi
    xor eax, eax
    pop esi
    ret
    }
}
