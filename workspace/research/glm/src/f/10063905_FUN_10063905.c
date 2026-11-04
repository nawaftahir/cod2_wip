extern void sub_100638c3(void);
extern void sub_10082214(void);
extern void sub_10082303(void);
extern void sub_100f7893(void);

__declspec(naked) void FUN_10063905(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 8], 0
    jne L10
    mov eax, 0x8876086c
    jmp L10
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    test ebx, ebx
    jne L10
    mov eax, 0x8876086c
    jmp L10
    push esi
    push 0x14
    call sub_100f7893
    test eax, eax
    pop ecx
    je L10
    mov ecx, eax
    call sub_10082303
    mov esi, eax
    jmp L10
    xor esi, esi
    test esi, esi
    jne L10
    mov eax, 0x8007000e
    jmp L10
    push edi
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_10082214
    mov edi, eax
    test edi, edi
    jge L10
    push 1
    mov ecx, esi
    call sub_100638c3
    mov eax, edi
    jmp L10
    mov dword ptr [ebx], esi
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
    }
}
