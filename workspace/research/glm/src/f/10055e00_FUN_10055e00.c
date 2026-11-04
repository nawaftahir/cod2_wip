extern void sub_10055dbe(void);

__declspec(naked) void FUN_10055e00(void)
{
    __asm {
    mov eax, dword ptr [ebx + 0x6c]
    push ebp
    mov ebp, dword ptr [ebx + 0x1b0]
    push esi
    xor esi, esi
    test eax, eax
    jle L6
    push edi
    lea edi, [ebp + 0x34]
    mov ecx, dword ptr [edi - 0x14]
    xor eax, eax
    test esi, esi
    jle L6
    lea edx, [ebp + 0x20]
    cmp ecx, dword ptr [edx]
    je L6
    inc eax
    add edx, 4
    cmp eax, esi
    jl L6
    jmp L6
    mov eax, dword ptr [ebp + eax*4 + 0x34]
    test eax, eax
    jne L6
    mov eax, ebx
    call sub_10055dbe
    mov dword ptr [edi], eax
    mov eax, dword ptr [ebx + 0x6c]
    inc esi
    add edi, 4
    cmp esi, eax
    jl L6
    pop edi
    pop esi
    pop ebp
    ret
    }
}
