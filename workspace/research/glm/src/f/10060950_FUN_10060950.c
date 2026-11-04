
__declspec(naked) void FUN_10060950(void)
{
    __asm {
    push ebx
    push esi
    push edi
    mov edi, eax
    mov esi, ecx
    movsx eax, byte ptr [edx]
    movsx ecx, byte ptr [esi]
    inc edx
    inc esi
    mov ebx, edi
    dec edi
    test ebx, ebx
    je L6
    cmp eax, ecx
    je L6
    cmp eax, 0x61
    jl L6
    cmp eax, 0x7a
    jg L6
    sub eax, 0x20
    cmp ecx, 0x61
    jl L6
    cmp ecx, 0x7a
    jg L6
    sub ecx, 0x20
    cmp eax, ecx
    jne L6
    test eax, eax
    jne L6
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    ret
    xor edx, edx
    cmp eax, ecx
    setge dl
    pop edi
    pop esi
    pop ebx
    lea edx, [edx + edx - 1]
    mov eax, edx
    ret
    }
}
