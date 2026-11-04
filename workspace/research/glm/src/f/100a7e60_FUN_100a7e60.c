
__declspec(naked) void FUN_100a7e60(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    xor edx, edx
    cmp dword ptr [eax], edx
    push esi
    jne L8
    cmp dword ptr [eax + 4], edx
    jne L8
    cmp dword ptr [eax + 8], edx
    jne L8
    mov ecx, dword ptr [eax + 0xc]
    cmp ecx, -1
    je L8
    cmp ecx, edx
    je L8
    mov ecx, dword ptr [ebp + 0xc]
    and ecx, 0xffff
    cmp ecx, 0x104
    jne L8
    cmp dword ptr [eax + edx*4], -1
    jne L8
    inc edx
    cmp edx, 4
    jb L8
    cmp edx, 4
    mov esi, edx
    jae L8
    mov ecx, dword ptr [eax + esi*4]
    cmp ecx, -1
    je L8
    cmp dword ptr [eax + edx*4], ecx
    ja L8
    inc esi
    cmp esi, 4
    jb L8
    xor eax, eax
    inc eax
    jmp L8
    xor eax, eax
    pop esi
    pop ebp
    ret 8
    }
}
