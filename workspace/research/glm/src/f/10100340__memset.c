
__declspec(naked) void _memset(void)
{
    __asm {
    mov edx, dword ptr [esp + 0xc]
    mov ecx, dword ptr [esp + 4]
    test edx, edx
    je L5
    xor eax, eax
    mov al, byte ptr [esp + 8]
    push edi
    mov edi, ecx
    cmp edx, 4
    jb L5
    neg ecx
    and ecx, 3
    je L5
    sub edx, ecx
    mov byte ptr [edi], al
    add edi, 1
    sub ecx, 1
    jne L5
    mov ecx, eax
    shl eax, 8
    add eax, ecx
    mov ecx, eax
    shl eax, 0x10
    add eax, ecx
    mov ecx, edx
    and edx, 3
    shr ecx, 2
    je L5
    rep stosd dword ptr es:[edi], eax
    test edx, edx
    je L5
    mov byte ptr [edi], al
    add edi, 1
    sub edx, 1
    jne L5
    mov eax, dword ptr [esp + 8]
    pop edi
    ret
    mov eax, dword ptr [esp + 4]
    ret
    }
}
