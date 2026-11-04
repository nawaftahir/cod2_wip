extern void sub_1007d77c(void);

__declspec(naked) void FUN_1007d869(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 0xc]
    push edi
    mov edx, ecx
    push 5
    pop ecx
    mov dword ptr [edx], eax
    lea edi, [edx + 4]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov esi, dword ptr [ebp + 0x10]
    mov ecx, dword ptr [ebp + 0x14]
    lea ebx, [edx + 0x34]
    push ebx
    lea edi, [edx + 0x2c]
    push edi
    push 1
    mov dword ptr [edx + 0x1c], ecx
    mov ecx, dword ptr [ebp + 0x18]
    push esi
    push dword ptr [ebp + 0xc]
    mov dword ptr [edx + 0x20], ecx
    xor ecx, ecx
    push eax
    mov dword ptr [edx + 0x18], esi
    mov dword ptr [edx + 0x24], ecx
    mov dword ptr [edi], ecx
    mov dword ptr [ebx], ecx
    call sub_1007d77c
    movzx eax, word ptr [esi + 8]
    imul eax, dword ptr [edi]
    mov dword ptr [edx + 0x28], eax
    movzx eax, word ptr [esi + 8]
    imul eax, dword ptr [ebx]
    mov dword ptr [edx + 0x30], eax
    xor eax, eax
    pop edi
    pop esi
    mov dword ptr [edx + 0x38], eax
    mov dword ptr [edx + 0x3c], eax
    mov dword ptr [edx + 0x40], eax
    mov eax, edx
    pop ebx
    pop ebp
    ret 0x14
    }
}
