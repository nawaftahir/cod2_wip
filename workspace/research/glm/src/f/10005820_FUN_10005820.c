extern void (__stdcall *fp_101d49e0)(void);

__declspec(naked) void FUN_10005820(void)
{
    __asm {
    mov eax, dword ptr [esi + 0xc]
    push edi
    xor edi, edi
    cmp eax, edi
    je L7
    push eax
    call fp_101d49e0
    add esp, 4
    mov dword ptr [esi + 0xc], edi
    mov eax, dword ptr [esi]
    cmp eax, edi
    je L7
    push eax
    call fp_101d49e0
    add esp, 4
    mov dword ptr [esi], edi
    mov eax, dword ptr [esi + 0x18]
    cmp eax, edi
    je L7
    push eax
    call fp_101d49e0
    add esp, 4
    mov dword ptr [esi + 0x18], edi
    mov eax, dword ptr [esi + 0x24]
    cmp eax, edi
    je L7
    push eax
    call fp_101d49e0
    add esp, 4
    mov dword ptr [esi + 0x24], edi
    mov eax, dword ptr [esi + 0x30]
    cmp eax, edi
    je L7
    push eax
    call fp_101d49e0
    add esp, 4
    mov dword ptr [esi + 0x30], edi
    mov eax, dword ptr [esi + 0x3c]
    cmp eax, edi
    je L7
    push eax
    call fp_101d49e0
    add esp, 4
    mov dword ptr [esi + 0x3c], edi
    mov eax, dword ptr [esi + 0x48]
    cmp eax, edi
    je L7
    push eax
    call fp_101d49e0
    add esp, 4
    mov dword ptr [esi + 0x48], edi
    pop edi
    ret
    }
}
