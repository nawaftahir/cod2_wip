extern void sub_1006372e(void);
extern void sub_10080e62(void);
extern void sub_10080e9a(void);
extern void sub_100f78aa(void);

__declspec(naked) void FUN_10063884(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    push esi
    xor esi, esi
    cmp ebx, esi
    push edi
    je L8
    mov dword ptr [ebx], esi
    mov edi, dword ptr [ebp + 8]
    cmp edi, esi
    je L8
    cmp ebx, esi
    jne L8
    mov eax, 0x8876086c
    jmp L8
    mov eax, dword ptr [edi]
    mov ecx, 0xffff0000
    and eax, ecx
    cmp eax, 0xfffe0000
    je L8
    cmp eax, ecx
    jne L8
    push 0x20
    call sub_100f78aa
    cmp eax, esi
    pop ecx
    je L8
    mov ecx, eax
    call sub_10080e62
    mov esi, eax
    test esi, esi
    jne L8
    mov eax, 0x8007000e
    jmp L8
    push 0
    push edi
    mov ecx, esi
    call sub_10080e9a
    mov edi, eax
    test edi, edi
    jge L8
    push 1
    mov ecx, esi
    call sub_1006372e
    mov eax, edi
    jmp L8
    mov dword ptr [ebx], esi
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
    }
}
