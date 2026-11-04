extern int g_101ce7d8;
extern int g_101d7e10;
extern void (__stdcall *fp_1010c0e4)(void);
extern void (__stdcall *fp_101d4b7c)(void);
extern void (__stdcall *fp_101d4ba8)(void);
extern void (__stdcall *fp_101d4bd0)(void);
extern void (__stdcall *fp_101d4bd4)(void);
extern void (__stdcall *fp_101d4be4)(void);
extern void (__stdcall *fp_101d4bf4)(void);
extern void sub_1001d660(void);
extern void sub_1001d9f0(void);
extern void sub_1001da80(void);
extern void sub_1001de60(void);
extern void sub_1001fda0(void);
extern void sub_1001fdd0(void);
extern void sub_1005c8c0(void);

__declspec(naked) void FUN_1001ffc0(void)
{
    __asm {
    sub esp, 0x360
    push ebp
    mov ebp, dword ptr [esp + 0x368]
    push esi
    push edi
    lea edi, [ebp + 0xc]
    mov esi, eax
    cmp dword ptr [edi], 2
    mov dword ptr [esp + 0x14], edi
    jge L0
    push 0
    push 1
    push edi
    call fp_1010c0e4
    test eax, eax
    je L1
    cmp dword ptr [edi], 2
    jl L2
    pop edi
    pop esi
    pop ebp
    add esp, 0x360
    ret
    cmp dword ptr [esi], 0
    push ebx
    jne L3
    mov ebx, dword ptr [ebp + 4]
    jmp L4
    mov eax, dword ptr [ebp + 4]
    mov ebx, dword ptr g_101d7e10
    push eax
    push ebx
    call fp_101d4be4
    add esp, 8
    push ebx
    call fp_101d4b7c
    add esp, 4
    test eax, eax
    je L5
    mov ecx, dword ptr g_101ce7d8
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L6
    push ebp
    mov eax, ebx
    call sub_1001da80
    push ebp
    mov eax, ebx
    call sub_1001de60
    add esp, 8
    mov edx, dword ptr [esi + 0x3c]
    mov dword ptr [ebp + 0x14], edx
    mov eax, dword ptr [esi + 0x40]
    mov dword ptr [ebp + 0x18], eax
    mov ecx, dword ptr [esi + 0x44]
    mov dword ptr [ebp + 0x1c], ecx
    mov edx, dword ptr [esi + 0x3c]
    mov dword ptr [ebp + 0x20], edx
    mov eax, dword ptr [esi + 0x40]
    mov dword ptr [ebp + 0x24], eax
    mov ecx, dword ptr [esi + 0x44]
    pop ebx
    mov dword ptr [ebp + 0x28], ecx
    mov dword ptr [edi], 2
    pop edi
    pop esi
    pop ebp
    add esp, 0x360
    ret
    lea edx, [esp + 0x44]
    push edx
    lea eax, [esp + 0x38]
    push eax
    lea ecx, [esp + 0x78]
    push ecx
    mov eax, esi
    call sub_1001d9f0
    add esp, 0xc
    test eax, eax
    je L6
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L7
    lea edx, [esp + 0x34]
    push edx
    push ebx
    push eax
    call fp_101d4bf4
    add esp, 0xc
    push ebx
    call fp_101d4ba8
    add esp, 4
    test eax, eax
    mov dword ptr [esp + 0x10], eax
    jne L8
    lea eax, [esi + 0x3c]
    mov ecx, ebp
    call sub_1001fda0
    pop ebx
    mov dword ptr [edi], 2
    pop edi
    pop esi
    pop ebp
    add esp, 0x360
    ret
    mov eax, 0x48000000
    mov dword ptr [esp + 0x1c], eax
    mov dword ptr [esp + 0x20], eax
    mov dword ptr [esp + 0x24], eax
    mov eax, 0xc8000000
    mov dword ptr [esp + 0x28], eax
    mov dword ptr [esp + 0x2c], eax
    mov dword ptr [esp + 0x30], eax
    lea eax, [esp + 0x170]
    push eax
    push ebx
    call fp_101d4bd4
    push ebx
    call fp_101d4bd0
    add esp, 0xc
    xor ebx, ebx
    test eax, eax
    mov dword ptr [esp + 0x14], eax
    jle L9
    mov edi, dword ptr [esp + 0x10]
    mov dword ptr [esp + 0x10], edi
    mov ecx, ebx
    and ecx, 0x1f
    mov edx, 1
    shl edx, cl
    mov ecx, ebx
    sar ecx, 5
    test dword ptr [esp + ecx*4 + 0x34], edx
    je L10
    lea ecx, [esp + 0x4c]
    mov eax, edi
    call sub_1001d660
    mov edx, dword ptr [esp + ebx*4 + 0x170]
    lea eax, [edi + 0x10]
    lea edi, [esp + 0x1c]
    lea ecx, [esp + 0x4c]
    call sub_1001fdd0
    mov edi, dword ptr [esp + 0x10]
    mov eax, dword ptr [esp + 0x14]
    inc ebx
    add edi, 0x20
    cmp ebx, eax
    mov dword ptr [esp + 0x10], edi
    jl L11
    mov edi, dword ptr [esp + 0x18]
    lea ecx, [esi + 0x14]
    lea edx, [esi + 0x3c]
    lea eax, [ebp + 0x14]
    lea esi, [esp + 0x1c]
    call sub_1005c8c0
    mov dword ptr [edi], 2
    pop ebx
    pop edi
    pop esi
    pop ebp
    add esp, 0x360
    ret
    }
}
