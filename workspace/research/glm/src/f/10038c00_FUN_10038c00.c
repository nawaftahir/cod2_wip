extern int g_1072d9bc;
extern void sub_10038963(void);
extern void sub_10038976(void);

__declspec(naked) void FUN_10038c00(void)
{
    __asm {
    push ebp
    push esi
    push edi
    mov edi, dword ptr g_1072d9bc
    movzx ecx, word ptr [edi + 0x34]
    mov esi, eax
    xor eax, eax
    test ecx, ecx
    jle L4
    mov edi, dword ptr [edi + 0x3c]
    cmp ebx, dword ptr [edi]
    je L4
    inc eax
    add edi, 0xc
    cmp eax, ecx
    jl L4
    pop edi
    pop esi
    pop ebp
    ret
    cmp byte ptr [edi + 5], 5
    jne L4
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [eax + 0x1c]
    mov eax, dword ptr [ecx + 0x40]
    mov dword ptr [edx], eax
    mov al, byte ptr [edi + 4]
    mov byte ptr [esi], al
    call sub_10038963
    pop edi
    pop esi
    pop ebp
    ret
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [edx], ecx
    mov al, byte ptr [edi + 4]
    mov byte ptr [esi], al
    call sub_10038976
    pop edi
    pop esi
    pop ebp
    ret
    }
}
