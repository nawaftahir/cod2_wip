
__declspec(naked) void FUN_1006771f(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 0x18], 0
    push ebx
    push esi
    je L6
    mov ebx, dword ptr [ebp + 0x1c]
    test ebx, ebx
    je L6
    mov eax, dword ptr [ebp + 0xc]
    cmp eax, -1
    mov esi, dword ptr [ebp + 8]
    jne L6
    test esi, esi
    je L6
    mov eax, esi
    push edi
    lea edi, [eax + 1]
    mov dl, byte ptr [eax]
    inc eax
    test dl, dl
    jne L6
    sub eax, edi
    pop edi
    jmp L6
    xor eax, eax
    test esi, esi
    jne L6
    test eax, eax
    jne L6
    mov dword ptr [ecx], esi
    add esi, eax
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [ecx + 0x18], eax
    mov eax, dword ptr [ebp + 0x14]
    mov dword ptr [ecx + 0x1c], eax
    mov eax, dword ptr [ebp + 0x18]
    mov dword ptr [ecx + 0x2c], eax
    mov dword ptr [ecx + 4], esi
    mov dword ptr [ecx + 0x30], ebx
    xor eax, eax
    jmp L6
    mov eax, 0x80004005
    pop esi
    pop ebx
    pop ebp
    ret 0x18
    }
}
