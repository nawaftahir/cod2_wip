extern void sub_10085d66(void);

__declspec(naked) void FUN_100be137(void)
{
    __asm {
    mov edi, edi
    push ebx
    push edi
    mov edi, ecx
    xor ebx, ebx
    cmp dword ptr [edi + 8], ebx
    jbe L5
    push esi
    mov eax, dword ptr [edi + 0x14]
    mov ecx, dword ptr [eax + ebx*4]
    mov esi, dword ptr [ecx + 0x38]
    cmp esi, -1
    je L5
    mov eax, dword ptr [eax + esi*4]
    mov edx, esi
    jmp L5
    mov edx, dword ptr [eax + 0x3c]
    or dword ptr [ecx + 0x3c], edx
    mov edx, dword ptr [eax + 0x38]
    mov eax, dword ptr [edi + 0x14]
    mov eax, dword ptr [eax + edx*4]
    cmp dword ptr [eax + 0x38], -1
    jne L5
    cmp esi, edx
    je L5
    push eax
    mov dword ptr [ecx + 0x38], edx
    call sub_10085d66
    inc ebx
    cmp ebx, dword ptr [edi + 8]
    jb L5
    pop esi
    pop edi
    xor eax, eax
    pop ebx
    ret
    }
}
