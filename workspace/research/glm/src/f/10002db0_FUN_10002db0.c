extern int g_101ae3bc;
extern int g_101ae3c0;
extern void (__stdcall *fp_101d49d4)(void);
extern void sub_10001959(void);

__declspec(naked) void FUN_10002db0(void)
{
    __asm {
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    push edi
    mov ebx, 0x30
    mov edx, 0x23
    mov eax, ebp
    call sub_10001959
    mov edi, eax
    mov eax, dword ptr [ebp]
    mov esi, dword ptr [eax + 0x124]
    mov eax, dword ptr [ebp + 4]
    mov ecx, edi
    shl ecx, 5
    push ecx
    add esi, eax
    call fp_101d49d4
    add esp, 4
    test edi, edi
    mov dword ptr g_101ae3c0, eax
    mov dword ptr g_101ae3bc, edi
    jle L4
    mov edx, dword ptr [esi]
    mov dword ptr [eax], edx
    mov ecx, dword ptr [esi + 0xc]
    mov dword ptr [eax + 0xc], ecx
    mov edx, dword ptr [esi + 4]
    mov dword ptr [eax + 4], edx
    mov ecx, dword ptr [esi + 0x10]
    mov dword ptr [eax + 0x10], ecx
    mov edx, dword ptr [esi + 8]
    mov dword ptr [eax + 8], edx
    mov ecx, dword ptr [esi + 0x14]
    mov dword ptr [eax + 0x14], ecx
    mov ecx, dword ptr [esi + 0x1c]
    test ecx, ecx
    mov dword ptr [eax + 0x18], ecx
    je L4
    mov ecx, dword ptr [esi + 0x18]
    jmp L4
    or ecx, 0xffffffff
    mov dword ptr [eax + 0x1c], ecx
    add esi, 0x30
    add eax, 0x20
    dec edi
    jne L4
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
    }
}
