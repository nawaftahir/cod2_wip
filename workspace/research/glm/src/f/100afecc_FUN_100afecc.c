
__declspec(naked) void FUN_100afecc(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [edx + 0x6c]
    movzx edx, byte ptr [edx + 0x6d]
    push esi
    mov esi, dword ptr [ebp + 0xc]
    mov dword ptr [esi], edx
    xor esi, esi
    and eax, 0xff
    inc esi
    cmp eax, esi
    jne L4
    cmp edx, dword ptr [ecx + 0x28]
    jmp L4
    push 3
    pop esi
    cmp eax, esi
    jne L4
    cmp edx, dword ptr [ecx + 0x3c]
    jae L4
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [eax], esi
    xor eax, eax
    jmp L4
    mov eax, 0x80004005
    pop esi
    pop ebp
    ret 0xc
    }
}
