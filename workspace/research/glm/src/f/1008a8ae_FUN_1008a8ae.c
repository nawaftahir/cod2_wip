
__declspec(naked) void FUN_1008a8ae(void)
{
    __asm {
    mov edi, edi
    push ebx
    push edi
    xor ebx, ebx
    xor edi, edi
    cmp dword ptr [ecx + 8], ebx
    jbe L0
    push esi
    mov edx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [edx + ebx*4]
    mov esi, dword ptr [eax + 0x38]
    cmp esi, -1
    je L1
    mov edx, dword ptr [edx + esi*4]
    mov esi, dword ptr [edx + 4]
    mov dword ptr [eax + 4], esi
    mov esi, dword ptr [edx + 8]
    mov dword ptr [eax + 8], esi
    mov esi, dword ptr [edx + 0xc]
    mov dword ptr [eax + 0xc], esi
    mov esi, dword ptr [edx + 0x10]
    mov dword ptr [eax + 0x10], esi
    mov esi, dword ptr [edx + 0x48]
    mov dword ptr [eax + 0x48], esi
    mov esi, dword ptr [edx + 0x4c]
    mov dword ptr [eax + 0x4c], esi
    mov esi, dword ptr [edx + 0x50]
    mov dword ptr [eax + 0x50], esi
    mov esi, dword ptr [edx + 0x54]
    cmp esi, -1
    jne L2
    mov esi, dword ptr [eax + 0x54]
    mov dword ptr [edx + 0x54], esi
    mov esi, dword ptr [eax + 0x58]
    mov dword ptr [edx + 0x58], esi
    mov eax, dword ptr [eax + 0x5c]
    mov dword ptr [edx + 0x5c], eax
    jmp L3
    mov edi, dword ptr [eax + 0x54]
    cmp esi, edi
    jb L4
    mov esi, edi
    mov dword ptr [eax + 0x54], esi
    mov dword ptr [edx + 0x54], esi
    mov esi, dword ptr [edx + 0x58]
    mov edi, dword ptr [eax + 0x58]
    cmp esi, edi
    ja L5
    mov esi, edi
    mov dword ptr [eax + 0x58], esi
    mov dword ptr [edx + 0x58], esi
    mov eax, dword ptr [eax + 0x5c]
    add dword ptr [edx + 0x5c], eax
    xor edi, edi
    inc edi
    inc ebx
    cmp ebx, dword ptr [ecx + 8]
    jb L6
    test edi, edi
    je L7
    xor edi, edi
    cmp dword ptr [ecx + 8], edi
    jbe L7
    mov eax, dword ptr [ecx + 0x14]
    mov edx, dword ptr [eax + edi*4]
    mov esi, dword ptr [edx + 0x38]
    cmp esi, -1
    je L8
    mov eax, dword ptr [eax + esi*4]
    mov eax, dword ptr [eax + 0x54]
    mov dword ptr [edx + 0x54], eax
    inc edi
    cmp edi, dword ptr [ecx + 8]
    jb L9
    pop esi
    pop edi
    xor eax, eax
    pop ebx
    ret
    }
}
