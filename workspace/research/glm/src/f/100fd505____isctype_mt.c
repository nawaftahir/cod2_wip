extern void sub_10100e7d(void);

__declspec(naked) void ___isctype_mt(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    mov eax, dword ptr [ebp + 0xc]
    lea ecx, [eax + 1]
    cmp ecx, 0x100
    mov ecx, dword ptr [ebp + 8]
    ja L5
    mov ecx, dword ptr [ecx + 0x48]
    movzx eax, word ptr [ecx + eax*2]
    jmp L5
    push esi
    mov edx, eax
    sar edx, 8
    push edi
    mov edi, dword ptr [ecx + 0x48]
    movzx esi, dl
    test byte ptr [edi + esi*2 + 1], 0x80
    pop edi
    pop esi
    je L5
    push 2
    mov byte ptr [ebp - 3], al
    mov byte ptr [ebp - 4], dl
    mov byte ptr [ebp - 2], 0
    pop eax
    jmp L5
    mov byte ptr [ebp - 4], al
    xor eax, eax
    mov byte ptr [ebp - 3], 0
    inc eax
    push 1
    push dword ptr [ecx + 0x14]
    push dword ptr [ecx + 4]
    lea ecx, [ebp + 0xe]
    push ecx
    push eax
    lea eax, [ebp - 4]
    push eax
    push 1
    call sub_10100e7d
    add esp, 0x1c
    test eax, eax
    jne L5
    leave
    ret
    movzx eax, word ptr [ebp + 0xe]
    and eax, dword ptr [ebp + 0x10]
    leave
    ret
    }
}
