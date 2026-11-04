extern void sub_1007da47(void);
extern void sub_100811e4(void);

__declspec(naked) void FUN_100813db(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 0x10]
    test ebx, ebx
    push edi
    mov edi, dword ptr [ebp + 0x14]
    jne L13
    test edi, edi
    jne L13
    mov eax, 0x8876086c
    jmp L13
    mov ecx, dword ptr [ebp + 0xc]
    test ecx, ecx
    jge L13
    neg ecx
    jmp L13
    lea eax, [ebp + 0x10]
    push eax
    push ecx
    mov ecx, dword ptr [ebp + 8]
    call sub_100811e4
    test eax, eax
    jl L13
    mov ecx, dword ptr [ebp + 0x10]
    push esi
    xor esi, esi
    xor edx, edx
    inc esi
    test ecx, ecx
    mov eax, ecx
    je L13
    mov eax, dword ptr [eax + 0x24]
    inc edx
    test eax, eax
    jne L13
    test edi, edi
    je L13
    mov eax, dword ptr [edi]
    test eax, eax
    je L13
    mov esi, eax
    cmp esi, edx
    jbe L13
    mov esi, edx
    mov dword ptr [edi], edx
    test ebx, ebx
    je L13
    jmp L13
    test esi, esi
    je L13
    push ebx
    call sub_1007da47
    test eax, eax
    jl L13
    mov ecx, dword ptr [ecx + 0x24]
    add ebx, 0x30
    dec esi
    test ecx, ecx
    jne L13
    xor eax, eax
    pop esi
    pop edi
    pop ebx
    pop ebp
    ret 0x10
    }
}
