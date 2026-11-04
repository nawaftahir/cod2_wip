extern void sub_100fd1df(void);
extern void sub_100fd543(void);

__declspec(naked) void ___tolower_mt(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    push esi
    mov esi, dword ptr [ebp + 8]
    cmp dword ptr [esi + 0x14], 0
    push edi
    je L10
    cmp dword ptr [esi + 0x24], 0
    je L10
    cmp ebx, 0x7f
    jbe L10
    xor edi, edi
    inc edi
    cmp ebx, 0x100
    jae L10
    cmp dword ptr [esi + 0x28], edi
    jle L10
    push edi
    push ebx
    push esi
    call sub_100fd543
    add esp, 0xc
    jmp L10
    mov eax, dword ptr [esi + 0x48]
    movzx eax, byte ptr [eax + ebx*2]
    and eax, edi
    test eax, eax
    je L10
    mov edx, dword ptr [esi + 0x48]
    mov eax, ebx
    sar eax, 8
    movzx ecx, al
    test byte ptr [edx + ecx*2 + 1], 0x80
    je L10
    push 2
    mov byte ptr [ebp + 8], al
    mov byte ptr [ebp + 9], bl
    mov byte ptr [ebp + 0xa], 0
    pop eax
    jmp L10
    mov byte ptr [ebp + 8], bl
    mov byte ptr [ebp + 9], 0
    mov eax, edi
    push edi
    push dword ptr [esi + 4]
    lea ecx, [ebp - 4]
    push 3
    push ecx
    push eax
    lea eax, [ebp + 8]
    push eax
    push 0x100
    push dword ptr [esi + 0x14]
    call sub_100fd1df
    add esp, 0x20
    test eax, eax
    je L10
    cmp eax, edi
    jne L10
    movzx eax, byte ptr [ebp - 4]
    jmp L10
    movzx ecx, byte ptr [ebp - 3]
    xor eax, eax
    mov ah, byte ptr [ebp - 4]
    or eax, ecx
    jmp L10
    cmp ebx, 0x41
    jl L10
    cmp ebx, 0x5a
    lea eax, [ebx + 0x20]
    jle L10
    mov eax, ebx
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}
