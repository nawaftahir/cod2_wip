extern int g_1076a830;
extern void (__stdcall *fp_101d4b3c)(void);
extern void (__stdcall *fp_101d4b48)(void);

__declspec(naked) void FUN_1002dcf0(void)
{
    __asm {
    sub esp, 0x10
    mov eax, dword ptr [esp + 0x14]
    push ebx
    push esi
    push eax
    call fp_101d4b48
    xor ebx, ebx
    xor esi, esi
    add esp, 4
    cmp eax, ebx
    mov dword ptr [esp + 0x10], eax
    mov dword ptr [esp + 8], esi
    jle L8
    push ebp
    push edi
    mov eax, dword ptr [esp + 0x24]
    lea ecx, [esp + 0x1c]
    push ecx
    push esi
    lea edx, [esp + 0x1c]
    push edx
    push eax
    call fp_101d4b3c
    mov ebp, eax
    add esp, 0x10
    xor edi, edi
    cmp ebp, ebx
    jle L8
    mov ecx, dword ptr [esp + 0x14]
    mov esi, dword ptr [ecx + edi*4]
    mov eax, dword ptr [esi + 0x14]
    cmp eax, ebx
    je L8
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    mov ecx, dword ptr g_1076a830
    xor eax, eax
    cmp ecx, ebx
    jne L8
    mov dword ptr [esi + 0x14], ebx
    cmp dword ptr [esi + 0x10], ebx
    je L8
    mov edi, edi
    mov eax, dword ptr [esi + 0x10]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    cmp dword ptr g_1076a830, ebx
    mov dword ptr [esi + 0x10], ebx
    jne L8
    inc edi
    cmp edi, ebp
    jl L8
    mov esi, dword ptr [esp + 0x10]
    mov eax, dword ptr [esp + 0x18]
    inc esi
    cmp esi, eax
    mov dword ptr [esp + 0x10], esi
    jl L8
    pop edi
    pop ebp
    pop esi
    pop ebx
    add esp, 0x10
    ret
    }
}
