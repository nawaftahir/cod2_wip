extern void sub_1006507e(void);
extern void sub_10083237(void);

__declspec(naked) void FUN_10083cb4(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push 0x50
    mov ebx, ecx
    call sub_1006507e
    test eax, eax
    je L8
    mov ecx, eax
    call sub_10083237
    mov dword ptr [ebp - 4], eax
    jmp L8
    and dword ptr [ebp - 4], 0
    mov eax, dword ptr [ebp - 4]
    test eax, eax
    je L8
    mov ecx, dword ptr [ebx + 0x14]
    mov dword ptr [eax + 0x14], ecx
    mov ecx, dword ptr [ebx + 0x18]
    push esi
    mov dword ptr [eax + 0x18], ecx
    mov ecx, dword ptr [ebx + 0x1c]
    push edi
    mov dword ptr [eax + 0x1c], ecx
    mov ecx, dword ptr [ebx + 0x28]
    mov dword ptr [eax + 0x28], ecx
    push 8
    lea esi, [ebx + 0x30]
    lea edi, [eax + 0x30]
    pop ecx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    xor esi, esi
    cmp dword ptr [ebx + 0x10], esi
    je L8
    mov ecx, dword ptr [ebx + 0x10]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    cmp eax, esi
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ecx + 0x10], eax
    je L8
    mov eax, ecx
    cmp dword ptr [ebx + 0x20], esi
    je L8
    mov ecx, dword ptr [ebx + 0x20]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    cmp eax, esi
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ecx + 0x20], eax
    je L8
    mov eax, ecx
    cmp dword ptr [ebx + 0x24], esi
    je L8
    mov ebx, dword ptr [ebx + 0x24]
    mov eax, dword ptr [ebx]
    mov ecx, ebx
    call dword ptr [eax + 4]
    cmp eax, esi
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ecx + 0x24], eax
    jne L8
    xor eax, eax
    jmp L8
    mov eax, dword ptr [ebp - 4]
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}
