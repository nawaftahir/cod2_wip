
__declspec(naked) void _strncmp(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push edi
    push esi
    push ebx
    mov ecx, dword ptr [ebp + 0x10]
    jecxz L2
    mov ebx, ecx
    mov edi, dword ptr [ebp + 8]
    mov esi, edi
    xor eax, eax
    repne scasb al, byte ptr es:[edi]
    neg ecx
    add ecx, ebx
    mov edi, esi
    mov esi, dword ptr [ebp + 0xc]
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    mov al, byte ptr [esi - 1]
    xor ecx, ecx
    cmp al, byte ptr [edi - 1]
    ja L2
    je L2
    sub ecx, 2
    not ecx
    mov eax, ecx
    pop ebx
    pop esi
    pop edi
    leave
    ret
    }
}
