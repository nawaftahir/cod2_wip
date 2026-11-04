
__declspec(naked) void FUN_10089d4b(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x14]
    mov edx, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [eax + edx*4]
    mov eax, dword ptr [esi + 0x48]
    cmp eax, -1
    je L6
    cmp eax, dword ptr [ebp + 0x10]
    jb L6
    cmp eax, dword ptr [ebp + 0x14]
    jae L6
    mov eax, dword ptr [ebp + 0xc]
    mov eax, dword ptr [eax + 0x10]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [eax + 0x18]
    mov eax, dword ptr [eax + 0x14]
    cmp eax, -1
    je L6
    push edi
    mov edi, dword ptr [esi + 0x14]
    cmp eax, edi
    je L6
    mov edx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [eax + 0x18]
    mov eax, dword ptr [eax + 0x14]
    cmp eax, -1
    jne L6
    pop edi
    cmp eax, dword ptr [esi + 0x14]
    jne L6
    cmp edx, dword ptr [esi + 0x18]
    jne L6
    xor eax, eax
    inc eax
    jmp L6
    xor eax, eax
    pop esi
    pop ebp
    ret 0x10
    }
}
