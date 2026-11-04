extern void sub_10085435(void);
extern void sub_100854e1(void);
extern void sub_1008563c(void);
extern void sub_100bb141(void);

__declspec(naked) void FUN_100bb114(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push esi
    push edi
    mov edi, ecx
    mov eax, dword ptr [edi + 0x100]
    mov esi, dword ptr [eax]
    and esi, 0xfffff
    cmp esi, dword ptr [eax + 0xc]
    jne L8
    mov ecx, eax
    call sub_10085435
    test eax, eax
    jne L8
    mov ecx, dword ptr [edi + 0x100]
    call sub_1008563c
    test eax, eax
    je L8
    mov ecx, dword ptr [edi + 0x100]
    call sub_100854e1
    test eax, eax
    je L8
    cmp esi, 4
    ja L8
    test esi, esi
    je L8
    and dword ptr [ebp - 4], 0
    test esi, esi
    jbe L8
    push ebx
    mov eax, esi
    sub eax, dword ptr [ebp - 4]
    xor ebx, ebx
    dec eax
    mov dword ptr [ebp - 8], eax
    je L8
    mov eax, dword ptr [edi + 0x100]
    mov eax, dword ptr [eax + 0x10]
    mov ecx, dword ptr [edi + 0x14]
    lea eax, [eax + ebx*4]
    mov edx, dword ptr [eax + 4]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [ecx + eax*4]
    mov edx, dword ptr [ecx + edx*4]
    mov eax, dword ptr [eax + 0x10]
    cmp eax, dword ptr [edx + 0x10]
    jbe L8
    push ebx
    push dword ptr [edi + 0x100]
    call sub_100bb141
    inc ebx
    cmp ebx, dword ptr [ebp - 8]
    jb L8
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], esi
    jb L8
    pop ebx
    xor eax, eax
    jmp L8
    xor eax, eax
    inc eax
    pop edi
    pop esi
    leave
    ret
    }
}
