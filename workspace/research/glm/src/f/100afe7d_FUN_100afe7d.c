
__declspec(naked) void FUN_100afe7d(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [edx + 0x6c]
    movzx edx, byte ptr [edx + 0x6d]
    and eax, 0xff
    cmp eax, 1
    jne L6
    cmp edx, dword ptr [ecx + 0x28]
    jae L6
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [eax], edx
    jmp L6
    cmp eax, 3
    jne L6
    cmp edx, dword ptr [ecx + 0x3c]
    jae L6
    add edx, 2
    jmp L6
    cmp eax, 5
    jne L6
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [eax], 0xc
    xor eax, eax
    jmp L6
    mov eax, 0x80004005
    pop ebp
    ret 8
    }
}
