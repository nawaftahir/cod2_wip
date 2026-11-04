
__declspec(naked) void FUN_10013fd0(void)
{
    __asm {
    sub esp, 0x10
    push ebx
    push ebp
    push esi
    mov ebx, ecx
    mov edx, dword ptr [ebx]
    mov esi, dword ptr [ebx + 4]
    push edi
    mov edi, dword ptr [ebx + 8]
    mov ebx, dword ptr [ebx + 0xc]
    mov dword ptr [esp + 0x1c], ebx
    mov ebx, eax
    mov ebp, dword ptr [ebx]
    mov dword ptr [ecx], ebp
    mov ebp, dword ptr [ebx + 4]
    mov dword ptr [ecx + 4], ebp
    mov ebp, dword ptr [ebx + 8]
    mov dword ptr [ecx + 8], ebp
    mov ebx, dword ptr [ebx + 0xc]
    mov dword ptr [ecx + 0xc], ebx
    mov ecx, dword ptr [esp + 0x1c]
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], esi
    mov dword ptr [eax + 8], edi
    pop edi
    pop esi
    pop ebp
    mov dword ptr [eax + 0xc], ecx
    pop ebx
    add esp, 0x10
    ret
    }
}
