extern void sub_100f7901(void);

__declspec(naked) void _TranslateName(void)
{
    __asm {
    push ebp
    mov ebp, esp
    xor eax, eax
    push ebx
    xor ebx, ebx
    inc eax
    cmp dword ptr [ebp + 0xc], ebx
    jl L6
    push esi
    push edi
    test eax, eax
    je L6
    mov eax, dword ptr [ebp + 0xc]
    add eax, ebx
    cdq
    sub eax, edx
    mov esi, eax
    mov eax, dword ptr [ebp + 8]
    sar esi, 1
    lea edi, [eax + esi*8]
    push dword ptr [edi]
    mov eax, dword ptr [ebp + 0x10]
    push dword ptr [eax]
    call sub_100f7901
    test eax, eax
    pop ecx
    pop ecx
    jne L6
    mov ecx, dword ptr [ebp + 0x10]
    add edi, 4
    mov dword ptr [ecx], edi
    jmp L6
    jge L6
    dec esi
    mov dword ptr [ebp + 0xc], esi
    jmp L6
    lea ebx, [esi + 1]
    cmp ebx, dword ptr [ebp + 0xc]
    jle L6
    pop edi
    pop esi
    xor ecx, ecx
    test eax, eax
    sete cl
    pop ebx
    mov eax, ecx
    pop ebp
    ret
    }
}
