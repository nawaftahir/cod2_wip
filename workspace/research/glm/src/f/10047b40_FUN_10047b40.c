extern void sub_100479c2(void);

__declspec(naked) void FUN_10047b40(void)
{
    __asm {
    push ebx
    push esi
    mov esi, edx
    mov ebx, eax
    mov al, byte ptr [esi + 0xc]
    test al, al
    push edi
    mov edi, ecx
    jne L2
    test ebx, ebx
    jbe L2
    movsx eax, byte ptr [edi]
    push eax
    mov eax, 1
    call sub_100479c2
    add esp, 4
    inc edi
    dec ebx
    jne L2
    pop edi
    pop esi
    pop ebx
    ret
    }
}
