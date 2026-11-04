
__declspec(naked) void FUN_100abfd6(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    xor eax, eax
    cmp dword ptr [edi + 0x1c], eax
    mov ebx, ecx
    mov dword ptr [ebp - 4], eax
    jbe L5
    mov esi, dword ptr [ebp + 0x10]
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [edi + 0x20]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebx + 0x18]
    mov eax, dword ptr [ecx + eax*4]
    cmp dword ptr [eax + 0x28], 1
    je L5
    mov ecx, dword ptr [esi]
    cmp ecx, 0x10
    jae L5
    mov edx, dword ptr [ebp + 0xc]
    mov dword ptr [edx + ecx*4], eax
    inc dword ptr [esi]
    push esi
    push dword ptr [ebp + 0xc]
    mov ecx, ebx
    push eax
    call L5
    test eax, eax
    jl L5
    inc dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, dword ptr [edi + 0x1c]
    jb L5
    jmp L5
    mov eax, 0x80004005
    pop edi
    pop esi
    pop ebx
    leave
    ret 0xc
    }
}
