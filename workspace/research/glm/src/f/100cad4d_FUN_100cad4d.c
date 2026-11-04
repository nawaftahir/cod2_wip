extern void sub_100c9ad8(void);

__declspec(naked) void FUN_100cad4d(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    push edi
    mov edi, ecx
    mov eax, dword ptr [edi + 0x100]
    mov esi, dword ptr [eax]
    and esi, 0xfffff
    push 0
    pop ebx
    mov dword ptr [ebp - 4], ebx
    jbe L3
    mov eax, esi
    shl eax, 2
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [edi + 0x100]
    mov ecx, dword ptr [eax + 8]
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 0x10]
    push ebx
    push ebx
    push ebx
    push ebx
    push esi
    push ebx
    mov ebx, dword ptr [ebp - 8]
    add ebx, ecx
    shl edx, 2
    push ebx
    add ecx, edx
    push ecx
    push 1
    add eax, edx
    push eax
    push 0x20
    mov ecx, edi
    call sub_100c9ad8
    xor ebx, ebx
    cmp eax, ebx
    jl L3
    inc dword ptr [ebp - 4]
    add dword ptr [ebp - 8], 4
    cmp dword ptr [ebp - 4], esi
    jb L3
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}
