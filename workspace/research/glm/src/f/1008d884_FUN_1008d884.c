extern void sub_10085565(void);
extern void sub_100857b7(void);
extern void sub_1008736b(void);

__declspec(naked) void FUN_1008d884(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    cmp dword ptr [edi + 0x48], -1
    mov esi, ecx
    je L3
    mov eax, dword ptr [ebx + 0x14]
    cmp eax, -1
    je L3
    mov ecx, dword ptr [esi + 0x14]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 0x48]
    and dword ptr [ebp + 8], 0
    cmp eax, -1
    je L3
    mov ecx, dword ptr [esi + 0x18]
    mov ecx, dword ptr [ecx + eax*4]
    call sub_10085565
    mov dword ptr [ebp + 8], eax
    mov eax, dword ptr [edi + 0x48]
    mov ecx, dword ptr [esi + 0x18]
    mov ecx, dword ptr [ecx + eax*4]
    call sub_100857b7
    test eax, eax
    je L3
    cmp dword ptr [ebp + 8], 0
    jne L3
    or dword ptr [edi + 0x14], 0xffffffff
    mov dword ptr [edi + 0x18], 1
    xor eax, eax
    jmp L3
    push dword ptr [ebx + 0x18]
    lea eax, [edi + 0x18]
    push dword ptr [ebx + 0x14]
    add edi, 0x14
    push eax
    push edi
    mov ecx, esi
    call sub_1008736b
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
    }
}
