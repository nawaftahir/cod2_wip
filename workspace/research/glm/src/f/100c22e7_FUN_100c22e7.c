extern void sub_10085604(void);
extern void sub_10093058(void);
extern void sub_100b9ffd(void);
extern void sub_100c229a(void);

__declspec(naked) void FUN_100c22e7(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x14
    push ebx
    xor eax, eax
    push edi
    mov edi, dword ptr [ebp + 0x14]
    inc eax
    test edi, edi
    mov ebx, ecx
    mov dword ptr [ebp - 0x10], eax
    je L0
    mov eax, dword ptr [ebx + 0x18]
    push esi
    mov esi, dword ptr [eax + edi*4 - 4]
    mov ecx, esi
    call sub_10085604
    test eax, eax
    jne L1
    mov eax, dword ptr [esi]
    mov ecx, eax
    and ecx, 0xf0000000
    cmp ecx, 0x60000000
    je L1
    mov edx, 0xfff00000
    and eax, edx
    cmp eax, 0x11000000
    je L1
    lea eax, [edi - 1]
    test eax, eax
    mov dword ptr [ebp - 0xc], eax
    jl L2
    jmp L3
    mov edx, 0xfff00000
    mov eax, dword ptr [ebx + 0x18]
    mov ecx, dword ptr [ebp - 0xc]
    mov esi, dword ptr [eax + ecx*4]
    cmp dword ptr [esi + 0x24], edi
    je L4
    mov eax, dword ptr [esi]
    mov ecx, eax
    and ecx, edx
    je L4
    and eax, 0xf0000000
    cmp eax, 0x60000000
    je L2
    cmp ecx, 0x11000000
    je L2
    push edi
    push esi
    push dword ptr [ebp + 0x10]
    mov ecx, ebx
    call sub_100b9ffd
    mov eax, dword ptr [esi]
    and dword ptr [ebp - 4], 0
    and dword ptr [ebp - 8], 0
    and eax, edx
    cmp eax, 0x50000000
    jne L5
    mov dword ptr [ebp - 4], 1
    mov ecx, dword ptr [esi + 0xc]
    test ecx, ecx
    jbe L6
    mov eax, dword ptr [ebx + 0x6c]
    mov edx, dword ptr [esi + 0x10]
    shl eax, 3
    sar eax, 0x1f
    mov dword ptr [ebp - 0x14], ecx
    test eax, eax
    mov edi, dword ptr [edx]
    mov ecx, dword ptr [ebx + 0x14]
    mov ecx, dword ptr [ecx + edi*4]
    jne L7
    mov edi, dword ptr [ecx + 0xc]
    mov ecx, dword ptr [ecx + 0x10]
    lea ecx, [ecx + edi*4]
    mov edi, dword ptr [ebp + 8]
    mov edi, dword ptr [edi + 0x14]
    mov ecx, dword ptr [edi + ecx*4]
    jmp L8
    mov ecx, dword ptr [ecx + 0x10]
    cmp ecx, 3
    jne L9
    mov dword ptr [ebp - 8], 1
    jmp L10
    mov dword ptr [ebp - 4], 1
    add edx, 4
    dec dword ptr [ebp - 0x14]
    jne L11
    mov edi, dword ptr [ebp + 0x14]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp + 0x18]
    je L4
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp + 0x1c]
    je L4
    push dword ptr [ebp - 0xc]
    dec edi
    push edi
    mov ecx, ebx
    call sub_100c229a
    test eax, eax
    mov dword ptr [ebp - 0x10], eax
    jl L12
    test byte ptr [ebx + 0x6f], 0x10
    jne L13
    mov edi, dword ptr [ebp + 8]
    push 0
    push edi
    call sub_10093058
    test eax, eax
    jl L14
    mov eax, dword ptr [esi + 0xc]
    test eax, eax
    jbe L15
    mov ecx, dword ptr [ebx + 0x14]
    mov edx, dword ptr [edi + 0x14]
    mov esi, dword ptr [esi + 0x10]
    mov dword ptr [ebp - 0x14], eax
    mov eax, dword ptr [esi]
    mov eax, dword ptr [ecx + eax*4]
    mov edi, dword ptr [eax + 0xc]
    mov eax, dword ptr [eax + 0x10]
    lea eax, [eax + edi*4]
    cmp dword ptr [edx + eax*4], 3
    jne L16
    mov dword ptr [ebp - 8], 1
    jmp L17
    mov dword ptr [ebp - 4], 1
    add esi, 4
    dec dword ptr [ebp - 0x14]
    jne L18
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp + 0x18]
    je L14
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp + 0x1c]
    jne L13
    mov ecx, dword ptr [ebx + 0xc]
    mov edi, dword ptr [ebx + 0x18]
    mov esi, dword ptr [ebp + 0xc]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebp + 0x14]
    dec dword ptr [ebp - 0xc]
    jns L19
    jmp L2
    and dword ptr [ebp - 0x10], 0
    mov eax, dword ptr [ebp - 0x10]
    jmp L12
    xor eax, eax
    inc eax
    pop esi
    pop edi
    pop ebx
    leave
    ret 0x18
    }
}
