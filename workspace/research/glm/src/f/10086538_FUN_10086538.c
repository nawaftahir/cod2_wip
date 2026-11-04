
__declspec(naked) void FUN_10086538(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    mov ecx, dword ptr [eax + 0x14]
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [ebp + 0xc]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [eax + 0x38]
    push esi
    mov esi, dword ptr [ecx + 0x38]
    cmp edx, esi
    jae L5
    or eax, 0xffffffff
    jmp L5
    jbe L5
    xor eax, eax
    inc eax
    jmp L5
    mov edx, dword ptr [eax + 0x3c]
    mov esi, dword ptr [ecx + 0x3c]
    cmp edx, esi
    jb L5
    ja L5
    mov edx, dword ptr [eax + 4]
    mov esi, dword ptr [ecx + 4]
    cmp edx, esi
    jb L5
    ja L5
    mov edx, dword ptr [eax + 0xc]
    mov esi, dword ptr [ecx + 0xc]
    cmp edx, esi
    jb L5
    ja L5
    mov edx, dword ptr [eax + 8]
    mov esi, dword ptr [ecx + 8]
    cmp edx, esi
    jb L5
    ja L5
    mov edx, dword ptr [eax + 0x10]
    mov esi, dword ptr [ecx + 0x10]
    cmp edx, esi
    jb L5
    ja L5
    mov edx, dword ptr [eax + 0x14]
    mov esi, dword ptr [ecx + 0x14]
    cmp edx, esi
    jb L5
    ja L5
    mov eax, dword ptr [eax + 0x18]
    mov ecx, dword ptr [ecx + 0x18]
    cmp eax, ecx
    jl L5
    xor edx, edx
    cmp eax, ecx
    setg dl
    mov eax, edx
    pop esi
    pop ebp
    ret 0xc
    }
}
