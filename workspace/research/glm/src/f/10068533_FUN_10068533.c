extern void sub_100682b8(void);

__declspec(naked) void FUN_10068533(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov ebx, ecx
    cmp edi, dword ptr [ebx + 4]
    jae L2
    cmp byte ptr [edi], 0x27
    jne L2
    push dword ptr [ebp + 0xc]
    lea esi, [edi + 1]
    push esi
    call sub_100682b8
    test eax, eax
    je L2
    add esi, eax
    cmp esi, dword ptr [ebx + 4]
    jae L2
    cmp byte ptr [esi], 0x27
    jne L2
    mov eax, esi
    sub eax, edi
    inc eax
    jmp L2
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
    }
}
