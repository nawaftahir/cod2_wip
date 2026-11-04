
__declspec(naked) void FUN_100cbb65(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 0x10]
    mov eax, dword ptr [edx + 0x3c]
    mov ecx, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebp + 0xc]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [edx + 0x2c]
    push edi
    mov edi, dword ptr [ecx + esi*4]
    cmp edi, dword ptr [ecx + eax*4]
    jbe L4
    or eax, 0xffffffff
    jmp L4
    mov edx, dword ptr [edx + 0x2c]
    mov ecx, dword ptr [edx + esi*4]
    cmp ecx, dword ptr [edx + eax*4]
    jae L4
    xor eax, eax
    inc eax
    jmp L4
    cmp eax, esi
    ja L4
    sbb eax, eax
    neg eax
    pop edi
    pop esi
    pop ebp
    ret 0xc
    }
}
