
__declspec(naked) void FUN_10039610(void)
{
    __asm {
    push ebp
    push esi
    mov esi, dword ptr [eax]
    xor edx, edx
    test esi, esi
    push edi
    jle L4
    mov edi, dword ptr [ebx]
    add eax, 8
    mov ebp, edi
    and ebp, dword ptr [eax - 4]
    cmp ebp, dword ptr [eax + 4]
    jne L4
    mov ebp, dword ptr [ebx + 4]
    and ebp, dword ptr [eax]
    cmp ebp, dword ptr [eax + 8]
    je L4
    inc edx
    add eax, 0x20
    cmp edx, esi
    jl L4
    pop edi
    pop esi
    xor al, al
    pop ebp
    ret
    mov edx, dword ptr [eax + 0x14]
    mov ebp, dword ptr [ecx]
    mov edi, dword ptr [ecx + 4]
    and ebp, edx
    mov dword ptr [ecx], ebp
    mov esi, dword ptr [eax + 0xc]
    mov edx, ebp
    or esi, edx
    mov dword ptr [ecx], esi
    mov edx, dword ptr [eax + 0x18]
    and edi, edx
    mov dword ptr [ecx + 4], edi
    mov eax, dword ptr [eax + 0x10]
    mov edx, edi
    pop edi
    or eax, edx
    pop esi
    mov dword ptr [ecx + 4], eax
    mov al, 1
    pop ebp
    ret
    }
}
