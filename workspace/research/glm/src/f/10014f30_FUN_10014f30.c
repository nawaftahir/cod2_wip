extern void sub_10014e6f(void);
extern void sub_10014e82(void);

__declspec(naked) void FUN_10014f30(void)
{
    __asm {
    push ebx
    push ebp
    push esi
    push edi
    mov edi, eax
    mov ebx, dword ptr [esp + 0x14]
    mov ebp, dword ptr [edi]
    xor esi, esi
    mov edi, edi
    inc esi
    cmp esi, ebx
    jge L7
    mov ecx, dword ptr [edi + esi*4]
    mov eax, ebp
    call sub_10014e6f
    test al, al
    jne L7
    dec ebx
    cmp ebx, esi
    jl L7
    mov eax, dword ptr [edi + ebx*4]
    mov ecx, ebp
    call sub_10014e82
    test al, al
    jne L7
    cmp esi, ebx
    jg L7
    mov ecx, dword ptr [edi + ebx*4]
    mov eax, dword ptr [edi + esi*4]
    mov dword ptr [edi + esi*4], ecx
    mov dword ptr [edi + ebx*4], eax
    jmp L7
    cmp esi, dword ptr [esp + 0x14]
    jne L7
    mov edx, dword ptr [edi + ebx*4]
    mov eax, dword ptr [edi]
    mov dword ptr [edi], edx
    mov dword ptr [edi + ebx*4], eax
    dec esi
    mov eax, dword ptr [esp + 0x18]
    cmp esi, eax
    je L7
    jge L7
    mov edx, dword ptr [esp + 0x14]
    sub edx, esi
    sub eax, esi
    lea edi, [edi + esi*4]
    mov dword ptr [esp + 0x14], edx
    mov dword ptr [esp + 0x18], eax
    jmp L7
    mov dword ptr [esp + 0x14], esi
    jmp L7
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
    }
}
