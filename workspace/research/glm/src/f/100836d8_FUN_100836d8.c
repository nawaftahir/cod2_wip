extern void sub_1006508e(void);
extern void sub_10082887(void);

__declspec(naked) void FUN_100836d8(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    and dword ptr [ebp - 4], 0
    push esi
    push edi
    mov esi, ecx
    lea edi, [ebp - 4]
    jmp L8
    cmp dword ptr [esi + 4], 1
    jne L8
    push 0x14
    call sub_1006508e
    test eax, eax
    je L8
    mov ecx, eax
    call sub_10082887
    jmp L8
    xor eax, eax
    test eax, eax
    mov dword ptr [edi], eax
    je L8
    mov ecx, dword ptr [esi + 0x10]
    mov dword ptr [eax + 0x10], ecx
    cmp dword ptr [esi + 8], 0
    je L8
    mov ecx, dword ptr [esi + 8]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 8], eax
    mov eax, dword ptr [edi]
    cmp dword ptr [eax + 8], 0
    je L8
    mov edi, dword ptr [edi]
    mov esi, dword ptr [esi + 0xc]
    add edi, 0xc
    test esi, esi
    jne L8
    jmp L8
    and dword ptr [edi], 0
    jmp L8
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 4]
    mov dword ptr [edi], eax
    mov eax, dword ptr [ebp - 4]
    pop edi
    pop esi
    leave
    ret
    }
}
