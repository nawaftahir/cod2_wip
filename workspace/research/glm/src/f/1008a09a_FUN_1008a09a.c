
__declspec(naked) void FUN_1008a09a(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 8]
    push esi
    mov edx, ecx
    xor esi, esi
    cmp eax, -1
    push edi
    mov dword ptr [ebp - 8], edx
    mov dword ptr [ebp - 4], esi
    mov ecx, eax
    je L11
    mov edi, dword ptr [edx + 0x14]
    mov ecx, dword ptr [edi + ecx*4]
    mov ecx, dword ptr [ecx + 0x14]
    inc dword ptr [ebp - 4]
    cmp ecx, -1
    jne L11
    mov ecx, dword ptr [ebp + 0x10]
    cmp ecx, -1
    push ebx
    mov edi, ecx
    je L11
    mov ebx, dword ptr [edx + 0x14]
    mov edi, dword ptr [ebx + edi*4]
    mov edi, dword ptr [edi + 0x14]
    inc esi
    cmp edi, -1
    jne L11
    cmp esi, dword ptr [ebp - 4]
    jae L11
    mov edi, dword ptr [edx + 0x14]
    mov edx, dword ptr [ebp - 4]
    sub edx, esi
    mov eax, dword ptr [edi + eax*4]
    mov ebx, dword ptr [eax + 0x18]
    dec dword ptr [ebp - 4]
    dec edx
    mov eax, dword ptr [eax + 0x14]
    mov dword ptr [ebp + 0xc], ebx
    jne L11
    mov edx, dword ptr [ebp - 8]
    cmp esi, dword ptr [ebp - 4]
    jbe L11
    mov ebx, dword ptr [edx + 0x14]
    sub esi, dword ptr [ebp - 4]
    dec esi
    mov ecx, dword ptr [ebx + ecx*4]
    mov edi, dword ptr [ecx + 0x18]
    mov ecx, dword ptr [ecx + 0x14]
    jne L11
    jmp L11
    mov edi, dword ptr [ebp + 0x14]
    cmp eax, ecx
    pop ebx
    je L11
    mov edx, dword ptr [edx + 0x14]
    mov eax, dword ptr [edx + eax*4]
    mov ecx, dword ptr [edx + ecx*4]
    mov esi, dword ptr [eax + 0x18]
    mov edi, dword ptr [ecx + 0x18]
    mov eax, dword ptr [eax + 0x14]
    mov ecx, dword ptr [ecx + 0x14]
    cmp eax, ecx
    mov dword ptr [ebp + 0xc], esi
    jne L11
    xor eax, eax
    cmp dword ptr [ebp + 0xc], edi
    pop edi
    setne al
    pop esi
    leave
    ret 0x10
    }
}
