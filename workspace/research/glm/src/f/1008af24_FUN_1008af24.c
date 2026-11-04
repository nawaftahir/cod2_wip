
__declspec(naked) void FUN_1008af24(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    push edi
    xor edi, edi
    or ebx, 0xffffffff
    cmp dword ptr [ecx + 8], edi
    jbe L0
    mov edx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [edx + edi*4]
    mov esi, dword ptr [eax + 8]
    cmp esi, ebx
    je L1
    mov edx, dword ptr [edx + esi*4]
    mov edx, dword ptr [edx + 0x30]
    jmp L2
    mov edx, ebx
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [eax + 0x14]
    cmp edx, ebx
    je L3
    mov esi, dword ptr [ecx + 0x14]
    mov edx, dword ptr [esi + edx*4]
    mov edx, dword ptr [edx + 0x30]
    jmp L4
    mov edx, ebx
    mov dword ptr [eax + 0x14], edx
    mov edx, dword ptr [eax + 0x38]
    cmp edx, ebx
    je L5
    mov esi, dword ptr [ecx + 0x14]
    mov edx, dword ptr [esi + edx*4]
    mov edx, dword ptr [edx + 0x30]
    jmp L6
    mov edx, ebx
    inc edi
    mov dword ptr [eax + 0x38], edx
    cmp edi, dword ptr [ecx + 8]
    jb L7
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ecx + 0xc], 0
    jbe L8
    mov eax, dword ptr [ecx + 0x18]
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + edx*4]
    xor esi, esi
    cmp dword ptr [eax], esi
    je L9
    cmp dword ptr [eax + 4], esi
    jbe L10
    mov edx, dword ptr [eax + 8]
    lea edx, [edx + esi*4]
    mov edi, dword ptr [edx]
    cmp edi, ebx
    je L11
    mov ebx, dword ptr [ecx + 0x14]
    mov edi, dword ptr [ebx + edi*4]
    mov edi, dword ptr [edi + 0x30]
    or ebx, 0xffffffff
    jmp L12
    mov edi, ebx
    inc esi
    mov dword ptr [edx], edi
    cmp esi, dword ptr [eax + 4]
    jb L13
    xor esi, esi
    cmp dword ptr [eax + 0xc], esi
    jbe L9
    mov edx, dword ptr [eax + 0x10]
    lea edx, [edx + esi*4]
    mov edi, dword ptr [edx]
    cmp edi, ebx
    je L14
    mov ebx, dword ptr [ecx + 0x14]
    mov edi, dword ptr [ebx + edi*4]
    mov edi, dword ptr [edi + 0x30]
    or ebx, 0xffffffff
    jmp L15
    mov edi, ebx
    inc esi
    mov dword ptr [edx], edi
    cmp esi, dword ptr [eax + 0xc]
    jb L16
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ecx + 0xc]
    jb L17
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    leave
    ret
    }
}
