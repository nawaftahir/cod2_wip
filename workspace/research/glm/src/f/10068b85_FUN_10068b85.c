extern void sub_100f731d(void);

__declspec(naked) void FUN_10068b85(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    xor edi, edi
    test esi, esi
    je L3
    mov al, byte ptr [esi]
    test al, al
    je L3
    movsx eax, al
    push eax
    call sub_100f731d
    imul edi, edi, 0x13
    add edi, eax
    inc esi
    mov al, byte ptr [esi]
    test al, al
    pop ecx
    jne L3
    push 7
    mov eax, edi
    xor edx, edx
    pop ecx
    div ecx
    mov eax, edx
    jmp L3
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 4
    }
}
