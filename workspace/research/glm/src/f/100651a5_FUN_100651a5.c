extern void sub_10064ca4(void);
extern void sub_100651b1(void);

__declspec(naked) void FUN_100651a5(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push dword ptr [ebp + 8]
    mov esi, ecx
    call sub_10064ca4
    lea eax, [esi + eax*4 + 0x6c]
    cmp dword ptr [eax], 0
    je L8
    push ebx
    push edi
    mov ecx, dword ptr [eax]
    mov esi, dword ptr [ecx]
    mov edi, dword ptr [ebp + 8]
    mov bl, byte ptr [edi]
    mov dl, bl
    cmp bl, byte ptr [esi]
    jne L8
    test dl, dl
    je L8
    mov bl, byte ptr [edi + 1]
    mov dl, bl
    cmp bl, byte ptr [esi + 1]
    jne L8
    inc edi
    inc edi
    inc esi
    inc esi
    test dl, dl
    jne L8
    xor edx, edx
    jmp L8
    sbb edx, edx
    sbb edx, -1
    test edx, edx
    jl L8
    je L8
    lea eax, [ecx + 0xc]
    cmp dword ptr [eax], 0
    jne L8
    jmp L8
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [ecx + 0xc]
    mov dword ptr [eax], edx
    and dword ptr [ecx + 0xc], 0
    push 1
    call sub_100651b1
    pop edi
    pop ebx
    xor eax, eax
    pop esi
    pop ebp
    ret 4
    }
}
