extern int g_101ae384;
extern int g_101ae388;
extern int g_101ae490;
extern int g_101ae494;
extern int g_101ae4a0;
extern void (__stdcall *fp_101d49d4)(void);
extern void sub_10001940(void);

__declspec(naked) void FUN_10003f90(void)
{
    __asm {
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    push edi
    mov ebx, 0x34
    mov edx, 0x17
    mov eax, ebp
    call sub_10001940
    mov esi, eax
    mov eax, dword ptr [ebp]
    mov edi, dword ptr [eax + 0xc4]
    mov eax, dword ptr [ebp + 4]
    mov ecx, esi
    imul ecx, ecx, 0x3c
    push ecx
    add edi, eax
    call fp_101d49d4
    add esp, 4
    test esi, esi
    mov dword ptr g_101ae388, eax
    mov dword ptr g_101ae384, esi
    jle L0
    lea ecx, [edi + 8]
    add eax, 8
    mov edx, dword ptr [ecx - 8]
    mov dword ptr [eax - 4], edx
    mov edx, dword ptr [ecx - 4]
    mov dword ptr [eax], edx
    mov edx, dword ptr [ecx]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [eax + 0xc], edx
    mov edx, dword ptr [ecx + 0xc]
    mov dword ptr [eax + 0x10], edx
    mov edx, dword ptr [ecx + 0x10]
    mov ebx, dword ptr g_101ae4a0
    lea edx, [edx + edx*2]
    shl edx, 4
    add edx, ebx
    mov dword ptr [eax + 0x14], edx
    mov edx, dword ptr [ecx + 0x14]
    imul edx, edx, 0x44
    mov dword ptr [eax + 0x1c], edx
    mov edx, dword ptr [ecx + 0x18]
    mov dword ptr [eax + 0x18], edx
    mov edx, dword ptr [ecx + 0x20]
    test edx, edx
    je L1
    mov edi, dword ptr [ecx + 0x1c]
    mov ebx, dword ptr g_101ae494
    lea edi, [ebx + edi*4]
    jmp L2
    xor edi, edi
    mov dword ptr [eax + 0x24], edi
    mov dword ptr [eax + 0x20], edx
    mov edx, dword ptr [ecx + 0x28]
    test edx, edx
    je L3
    mov edi, dword ptr [ecx + 0x24]
    mov ebx, dword ptr g_101ae490
    lea edi, [ebx + edi*4]
    jmp L4
    xor edi, edi
    mov dword ptr [eax + 0x2c], edi
    mov dword ptr [eax + 0x28], edx
    add ecx, 0x34
    add eax, 0x3c
    dec esi
    jne L5
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
    }
}
