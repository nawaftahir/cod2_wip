extern void sub_100f680f(void);
extern void sub_100fa266(void);

__declspec(naked) void __fptostr(void)
{
    __asm {
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 0x10]
    mov ecx, dword ptr [edx + 0xc]
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    test ebx, ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    lea edi, [esi + 1]
    mov byte ptr [esi], 0x30
    mov eax, edi
    jle L9
    mov dword ptr [ebp + 8], ebx
    xor ebx, ebx
    mov dl, byte ptr [ecx]
    test dl, dl
    je L9
    movsx edx, dl
    inc ecx
    jmp L9
    push 0x30
    pop edx
    mov byte ptr [eax], dl
    inc eax
    dec dword ptr [ebp + 8]
    jne L9
    mov edx, dword ptr [ebp + 0x10]
    test ebx, ebx
    mov byte ptr [eax], 0
    jl L9
    cmp byte ptr [ecx], 0x35
    jl L9
    jmp L9
    mov byte ptr [eax], 0x30
    dec eax
    cmp byte ptr [eax], 0x39
    je L9
    inc byte ptr [eax]
    cmp byte ptr [esi], 0x31
    jne L9
    inc dword ptr [edx + 4]
    jmp L9
    push edi
    call sub_100fa266
    inc eax
    push eax
    push edi
    push esi
    call sub_100f680f
    add esp, 0x10
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret
    }
}
