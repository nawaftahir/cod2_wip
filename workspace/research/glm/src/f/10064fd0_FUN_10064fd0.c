extern void sub_10064cb7(void);
extern void sub_10064f47(void);

__declspec(naked) void FUN_10064fd0(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push dword ptr [ebp + 8]
    mov esi, ecx
    call sub_10064f47
    test eax, eax
    je L13
    xor eax, eax
    jmp L13
    push edi
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_10064cb7
    mov esi, dword ptr [esi + eax*4 + 0x6c]
    jmp L13
    mov ecx, dword ptr [esi]
    mov edi, dword ptr [ebp + 8]
    mov dl, byte ptr [edi]
    mov al, dl
    cmp dl, byte ptr [ecx]
    jne L13
    test al, al
    je L13
    mov dl, byte ptr [edi + 1]
    mov al, dl
    cmp dl, byte ptr [ecx + 1]
    jne L13
    inc edi
    inc edi
    inc ecx
    inc ecx
    test al, al
    jne L13
    xor eax, eax
    jmp L13
    sbb eax, eax
    sbb eax, -1
    test eax, eax
    jl L13
    je L13
    mov esi, dword ptr [esi + 0xc]
    test esi, esi
    jne L13
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 0xc
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    je L13
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ebp + 0x10]
    test eax, eax
    je L13
    mov ecx, dword ptr [esi + 8]
    mov dword ptr [eax], ecx
    xor eax, eax
    inc eax
    jmp L13
    }
}
