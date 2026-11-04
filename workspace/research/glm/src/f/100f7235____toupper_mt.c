extern void sub_100fd149(void);
extern void sub_100fd505(void);

__declspec(naked) void ___toupper_mt(void)
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
    je L0
    cmp dword ptr [esi + 0x24], 0
    je L1
    cmp ebx, 0x7f
    jbe L0
    cmp ebx, 0x100
    jae L2
    cmp dword ptr [esi + 0x28], 1
    jle L3
    push 2
    push ebx
    push esi
    call sub_100fd505
    add esp, 0xc
    jmp L4
    mov eax, dword ptr [esi + 0x48]
    movzx eax, byte ptr [eax + ebx*2]
    and eax, 2
    test eax, eax
    je L5
    mov edx, dword ptr [esi + 0x48]
    mov eax, ebx
    sar eax, 8
    movzx ecx, al
    test byte ptr [edx + ecx*2 + 1], 0x80
    je L6
    push 2
    mov byte ptr [ebp + 8], al
    mov byte ptr [ebp + 9], bl
    mov byte ptr [ebp + 0xa], 0
    pop eax
    jmp L7
    xor eax, eax
    mov byte ptr [ebp + 8], bl
    mov byte ptr [ebp + 9], 0
    inc eax
    push 1
    push dword ptr [esi + 4]
    lea ecx, [ebp - 4]
    push 3
    push ecx
    push eax
    lea eax, [ebp + 8]
    push eax
    push 0x200
    push dword ptr [esi + 0x14]
    call sub_100fd149
    add esp, 0x20
    test eax, eax
    je L5
    cmp eax, 1
    jne L8
    movzx eax, byte ptr [ebp - 4]
    jmp L9
    movzx ecx, byte ptr [ebp - 3]
    xor eax, eax
    mov ah, byte ptr [ebp - 4]
    or eax, ecx
    jmp L9
    cmp ebx, 0x61
    jl L5
    cmp ebx, 0x7a
    lea eax, [ebx - 0x20]
    jle L9
    mov eax, ebx
    pop esi
    pop ebx
    leave
    ret
    }
}
