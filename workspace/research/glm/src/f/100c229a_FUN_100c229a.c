
__declspec(naked) void FUN_100c229a(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    mov edx, dword ptr [ecx + 0x18]
    push ebx
    push esi
    push edi
    mov edi, dword ptr [edx + eax*4]
    mov edx, dword ptr [ebp + 8]
    cmp eax, edx
    mov esi, eax
    jae L4
    mov eax, dword ptr [ecx + 0x18]
    lea eax, [eax + esi*4]
    mov ebx, dword ptr [eax + 4]
    inc esi
    cmp esi, edx
    mov dword ptr [eax], ebx
    jb L4
    jmp L4
    jbe L4
    mov eax, dword ptr [ecx + 0x18]
    lea eax, [eax + esi*4]
    mov ebx, dword ptr [eax - 4]
    dec esi
    cmp esi, edx
    mov dword ptr [eax], ebx
    ja L4
    mov eax, dword ptr [ecx + 0x18]
    mov dword ptr [eax + edx*4], edi
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    pop ebp
    ret 8
    }
}
