
__declspec(naked) void FUN_1001d2f0(void)
{
    __asm {
    push ebx
    push ebp
    push esi
    push edi
    mov edi, ecx
    mov edx, dword ptr [edi]
    mov esi, dword ptr [edi + 4]
    mov edi, dword ptr [edi + 8]
    mov ebx, eax
    mov ebp, dword ptr [ebx]
    mov dword ptr [ecx], ebp
    mov ebp, dword ptr [ebx + 4]
    mov dword ptr [ecx + 4], ebp
    mov ebx, dword ptr [ebx + 8]
    mov dword ptr [ecx + 8], ebx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], esi
    mov dword ptr [eax + 8], edi
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
    }
}
