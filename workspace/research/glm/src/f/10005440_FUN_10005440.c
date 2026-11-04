extern void (__stdcall *fp_101d49dc)(void);

__declspec(naked) void FUN_10005440(void)
{
    __asm {
    mov ecx, dword ptr [ebx + 8]
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    mov esi, eax
    mov eax, dword ptr [ebx + 4]
    add eax, ebp
    cmp eax, ecx
    jg L2
    mov ecx, dword ptr [ebx + 0x10]
    mov eax, dword ptr [ebx + 0x14]
    inc ecx
    cmp ecx, eax
    jg L2
    mov ecx, dword ptr [ebx + 0xc]
    test ecx, ecx
    jne L2
    lea edx, [eax + eax*2]
    shl edx, 3
    push edx
    call fp_101d49dc
    mov dword ptr [ebx + 0xc], eax
    mov eax, dword ptr [ebx + 8]
    lea eax, [eax + eax*2]
    shl eax, 2
    push eax
    call fp_101d49dc
    add esp, 8
    mov dword ptr [ebx], eax
    mov eax, dword ptr [ebx + 0x10]
    mov edx, dword ptr [ebx + 0xc]
    lea ecx, [eax + eax*2]
    mov eax, dword ptr [ebx + 4]
    mov dword ptr [edx + ecx*8 + 0x10], eax
    mov eax, dword ptr [ebx + 0x10]
    mov edx, dword ptr [ebx + 0xc]
    lea ecx, [eax + eax*2]
    mov dword ptr [edx + ecx*8 + 0x14], ebp
    mov eax, dword ptr [ebx + 0x10]
    mov edx, dword ptr [esi]
    mov ecx, dword ptr [ebx + 0xc]
    lea eax, [eax + eax*2]
    lea eax, [ecx + eax*8]
    mov dword ptr [eax], edx
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [eax + 4], ecx
    mov edx, dword ptr [esi + 8]
    mov dword ptr [eax + 8], edx
    mov ecx, dword ptr [esi + 0xc]
    mov dword ptr [eax + 0xc], ecx
    mov eax, dword ptr [ebx + 4]
    mov esi, dword ptr [ebx + 0x10]
    lea edx, [eax + eax*2]
    mov eax, dword ptr [ebx]
    push edi
    inc esi
    lea ecx, [ebp + ebp*2]
    shl ecx, 2
    lea edi, [eax + edx*4]
    mov edx, ecx
    shr ecx, 2
    mov dword ptr [ebx + 0x10], esi
    mov esi, dword ptr [esp + 0x14]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    add dword ptr [ebx + 4], ebp
    pop edi
    pop esi
    pop ebp
    ret
    }
}
