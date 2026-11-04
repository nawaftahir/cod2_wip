
__declspec(naked) void FUN_100ab063(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 0x1c]
    and dword ptr [ebp - 4], 0
    and dword ptr [eax], 0
    mov dword ptr [ebp - 8], ecx
    mov ecx, dword ptr [ebp + 0xc]
    cmp ecx, dword ptr [ebp + 0x10]
    jae L6
    push ebx
    push esi
    push edi
    mov edx, dword ptr [ebp + 8]
    mov edi, dword ptr [edx + ecx*4]
    xor ebx, ebx
    cmp edi, ebx
    je L6
    cmp dword ptr [edi + 4], ebx
    jbe L6
    mov edx, dword ptr [edi + 8]
    mov esi, dword ptr [edx + ebx*4]
    cmp esi, dword ptr [ebp + 0x14]
    mov edx, dword ptr [ebp - 8]
    mov edx, dword ptr [edx + 0x14]
    mov edx, dword ptr [edx + esi*4]
    je L6
    mov esi, dword ptr [ebp + 0x14]
    cmp dword ptr [edx + 0x38], esi
    jne L6
    mov esi, dword ptr [ebp + 0x18]
    mov esi, dword ptr [esi + 0xc]
    mov dword ptr [edx + 0xc], esi
    mov esi, dword ptr [ebp + 0x18]
    mov esi, dword ptr [esi + 0x10]
    mov dword ptr [edx + 0x10], esi
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [eax], 1
    inc ebx
    cmp ebx, dword ptr [edi + 4]
    jb L6
    inc ecx
    cmp ecx, dword ptr [ebp + 0x10]
    jb L6
    pop edi
    pop esi
    pop ebx
    mov eax, dword ptr [ebp - 4]
    leave
    ret 0x18
    }
}
