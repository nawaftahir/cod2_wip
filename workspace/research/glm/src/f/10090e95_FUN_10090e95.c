extern void sub_100853cf(void);
extern void sub_1008a979(void);

__declspec(naked) void FUN_10090e95(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x24
    and dword ptr [ebp - 0x20], 0
    and dword ptr [ebp - 4], 0
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 8]
    test eax, eax
    push edi
    jbe L0
    mov edi, dword ptr [esi + 0x88]
    mov edx, dword ptr [esi + 0x14]
    mov ecx, dword ptr [edx]
    cmp edi, dword ptr [ecx + 4]
    jne L1
    mov ecx, dword ptr [ecx + 0xc]
    cmp dword ptr [ebp - 4], ecx
    ja L1
    inc ecx
    mov dword ptr [ebp - 4], ecx
    add edx, 4
    dec eax
    jne L2
    mov ecx, esi
    call sub_1008a979
    and dword ptr [ebp - 0x14], 0
    cmp dword ptr [esi + 0xc], 0
    jbe L3
    mov ecx, dword ptr [ebp - 0x14]
    mov eax, dword ptr [esi + 0x18]
    mov ebx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebx]
    test ecx, 0xfff00000
    mov dword ptr [ebp - 0x1c], ebx
    je L4
    mov eax, dword ptr [ebx + 4]
    and ecx, 0xfffff
    xor edx, edx
    div ecx
    and dword ptr [ebx + 0x24], 0
    and dword ptr [ebp - 0x10], 0
    test eax, eax
    mov dword ptr [ebp - 0x24], eax
    jbe L4
    lea eax, [ebp - 0x18]
    push eax
    push dword ptr [ebp - 0x10]
    mov ecx, ebx
    call sub_100853cf
    mov ecx, dword ptr [esi + 0x14]
    mov edx, dword ptr [esi + 0x88]
    mov dword ptr [ebp - 0xc], eax
    mov eax, dword ptr [ebp - 0x18]
    mov eax, dword ptr [eax]
    mov edi, dword ptr [ecx + eax*4]
    cmp edx, dword ptr [edi + 4]
    jne L5
    cmp dword ptr [ebp - 0xc], 1
    mov dword ptr [ebp - 8], 1
    jbe L6
    mov eax, dword ptr [ebp - 0x18]
    mov ebx, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + ebx*4]
    mov eax, dword ptr [ecx + eax*4]
    cmp edx, dword ptr [eax + 4]
    jne L7
    mov eax, dword ptr [eax + 0x48]
    cmp eax, dword ptr [edi + 0x48]
    jne L8
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 0xc]
    jb L9
    mov ebx, dword ptr [ebp - 0x1c]
    mov eax, dword ptr [ebp - 0xc]
    cmp dword ptr [ebp - 8], eax
    je L5
    xor ecx, ecx
    test eax, eax
    jbe L5
    mov eax, dword ptr [ebp - 0x18]
    mov edx, dword ptr [esi + 0x14]
    mov eax, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [esi + 0x88]
    cmp edx, dword ptr [eax + 4]
    jne L10
    mov eax, dword ptr [eax + 0x48]
    mov edx, dword ptr [esi + 0x18]
    mov eax, dword ptr [edx + eax*4]
    mov dword ptr [eax + 0x24], 1
    inc ecx
    cmp ecx, dword ptr [ebp - 0xc]
    jb L11
    inc dword ptr [ebp - 0x10]
    mov eax, dword ptr [ebp - 0x10]
    cmp eax, dword ptr [ebp - 0x24]
    jb L12
    inc dword ptr [ebp - 0x14]
    mov eax, dword ptr [ebp - 0x14]
    cmp eax, dword ptr [esi + 0xc]
    jb L13
    and dword ptr [ebp - 0x10], 0
    cmp dword ptr [esi + 0xc], 0
    jbe L14
    mov eax, dword ptr [esi + 0x18]
    mov ecx, dword ptr [ebp - 0x10]
    mov eax, dword ptr [eax + ecx*4]
    test word ptr [eax + 2], 0xfff0
    je L15
    cmp dword ptr [eax + 0x24], 0
    jne L15
    mov ebx, dword ptr [eax + 0x10]
    mov edi, dword ptr [esi + 0x14]
    mov ecx, dword ptr [ebx]
    mov ecx, dword ptr [edi + ecx*4]
    mov edx, dword ptr [esi + 0x88]
    cmp edx, dword ptr [ecx + 4]
    jne L15
    mov edx, dword ptr [eax + 0xc]
    xor ecx, ecx
    cmp dword ptr [ebp + 8], ecx
    je L16
    test edx, edx
    jbe L17
    mov dword ptr [ebp - 0x18], ebx
    mov ebx, dword ptr [ebp - 0x18]
    mov ebx, dword ptr [ebx]
    mov ebx, dword ptr [edi + ebx*4]
    cmp ecx, dword ptr [ebx + 0x10]
    jne L17
    add dword ptr [ebp - 0x18], 4
    inc ecx
    cmp ecx, edx
    jb L18
    cmp ecx, edx
    je L15
    xor ecx, ecx
    test edx, edx
    jbe L19
    mov edx, dword ptr [eax + 0x10]
    mov edx, dword ptr [edx + ecx*4]
    mov edi, dword ptr [esi + 0x14]
    mov edx, dword ptr [edi + edx*4]
    mov edi, dword ptr [ebp - 4]
    mov dword ptr [edx + 0xc], edi
    mov edx, dword ptr [eax + 0x10]
    mov edx, dword ptr [edx + ecx*4]
    mov edi, dword ptr [esi + 0x14]
    mov edx, dword ptr [edi + edx*4]
    mov dword ptr [edx + 0x10], ecx
    inc ecx
    cmp ecx, dword ptr [eax + 0xc]
    jb L20
    jmp L19
    cmp edx, ecx
    mov dword ptr [ebp - 0x14], ecx
    jbe L21
    mov ecx, dword ptr [ebx]
    mov ecx, dword ptr [edi + ecx*4]
    cmp dword ptr [ecx + 0x10], 0
    je L21
    inc dword ptr [ebp - 0x14]
    add ebx, 4
    cmp dword ptr [ebp - 0x14], edx
    jb L22
    cmp dword ptr [ebp - 0x14], edx
    jb L15
    xor ecx, ecx
    test edx, edx
    jbe L19
    mov edx, dword ptr [eax + 0x10]
    mov edx, dword ptr [edx + ecx*4]
    mov edi, dword ptr [esi + 0x14]
    mov edx, dword ptr [edi + edx*4]
    mov edi, dword ptr [ebp - 4]
    inc ecx
    mov dword ptr [edx + 0xc], edi
    cmp ecx, dword ptr [eax + 0xc]
    jb L23
    inc dword ptr [ebp - 4]
    mov dword ptr [ebp - 0x20], 1
    inc dword ptr [ebp - 0x10]
    mov eax, dword ptr [ebp - 0x10]
    cmp eax, dword ptr [esi + 0xc]
    jb L24
    xor eax, eax
    cmp dword ptr [ebp - 0x20], eax
    pop edi
    pop esi
    sete al
    pop ebx
    leave
    ret 4
    }
}
