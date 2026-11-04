
__declspec(naked) void FUN_10060350(void)
{
    __asm {
    push esi
    push edi
    mov edi, eax
    mov al, byte ptr [ecx]
    xor edx, edx
    test al, al
    mov esi, ecx
    je L8
    mov edi, edi
    cmp al, 0x2e
    jne L8
    mov edx, esi
    jmp L8
    cmp al, 0x2f
    je L8
    cmp al, 0x5c
    jne L8
    xor edx, edx
    mov al, byte ptr [esi + 1]
    inc esi
    test al, al
    jne L8
    test edx, edx
    jne L8
    mov edx, esi
    cmp ecx, edx
    je L8
    mov al, byte ptr [ecx]
    mov byte ptr [edi], al
    inc edi
    inc ecx
    cmp ecx, edx
    jne L8
    mov byte ptr [edi], 0
    pop edi
    pop esi
    ret
    }
}
