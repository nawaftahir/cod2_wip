
__declspec(naked) void FUN_1008661b(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x18
    mov ecx, dword ptr [ebp + 8]
    mov edx, dword ptr [ebp + 0xc]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 0x10]
    mov eax, dword ptr [esi + 0x18]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [eax + 0x34]
    mov dword ptr [ebp - 0x10], ecx
    mov ecx, dword ptr [ecx + 0x34]
    push edi
    xor edi, edi
    cmp ecx, -1
    mov dword ptr [ebp - 0x14], eax
    mov dword ptr [ebp + 0x10], edi
    mov eax, ecx
    je L0
    mov ebx, dword ptr [esi + 0x14]
    mov eax, dword ptr [ebx + eax*4]
    mov eax, dword ptr [eax + 0x14]
    inc edi
    cmp eax, -1
    jne L1
    cmp edx, -1
    mov eax, edx
    je L2
    mov ebx, dword ptr [esi + 0x14]
    mov eax, dword ptr [ebx + eax*4]
    mov eax, dword ptr [eax + 0x14]
    inc dword ptr [ebp + 0x10]
    cmp eax, -1
    jne L3
    mov ebx, dword ptr [ebp + 0x10]
    cmp edi, ebx
    mov dword ptr [ebp - 8], edi
    mov dword ptr [ebp - 0x18], ebx
    jbe L4
    mov eax, edi
    sub eax, ebx
    mov ebx, dword ptr [esi + 0x14]
    mov ecx, dword ptr [ebx + ecx*4]
    mov ecx, dword ptr [ecx + 0x14]
    dec edi
    dec eax
    jne L5
    mov eax, dword ptr [ebp + 0x10]
    cmp eax, edi
    jbe L6
    sub eax, edi
    mov ebx, dword ptr [esi + 0x14]
    mov edx, dword ptr [ebx + edx*4]
    dec dword ptr [ebp + 0x10]
    dec eax
    mov edx, dword ptr [edx + 0x14]
    jne L7
    cmp ecx, edx
    je L8
    mov eax, dword ptr [esi + 0x14]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 0x14]
    mov edx, dword ptr [edx + 0x14]
    dec edi
    dec dword ptr [ebp + 0x10]
    cmp ecx, edx
    jne L9
    mov eax, dword ptr [ebp - 0x10]
    mov edx, dword ptr [eax + 0x34]
    mov eax, dword ptr [ebp - 0x14]
    mov ebx, dword ptr [eax + 0x34]
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 0xc], eax
    mov eax, dword ptr [ebp - 8]
    cmp edi, eax
    jae L10
    mov ecx, dword ptr [esi + 0x14]
    sub eax, edi
    mov dword ptr [ebp - 8], eax
    mov edx, dword ptr [ecx + edx*4]
    mov eax, dword ptr [edx + 0x48]
    cmp dword ptr [ebp - 4], eax
    jbe L11
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [edx + 0x58]
    cmp dword ptr [ebp - 0xc], eax
    jae L12
    mov dword ptr [ebp - 0xc], eax
    dec dword ptr [ebp - 8]
    mov edx, dword ptr [edx + 0x14]
    jne L13
    mov eax, dword ptr [ebp - 0x18]
    cmp dword ptr [ebp + 0x10], eax
    mov edi, dword ptr [ebp + 0xc]
    mov dword ptr [ebp - 8], edi
    jae L14
    sub eax, dword ptr [ebp + 0x10]
    mov edx, dword ptr [esi + 0x14]
    mov dword ptr [ebp + 0x10], eax
    mov ecx, dword ptr [edx + ebx*4]
    mov eax, dword ptr [ecx + 0x48]
    cmp edi, eax
    jbe L15
    mov edi, eax
    mov eax, dword ptr [ecx + 0x58]
    cmp dword ptr [ebp - 8], eax
    jae L16
    mov dword ptr [ebp - 8], eax
    dec dword ptr [ebp + 0x10]
    mov ebx, dword ptr [ecx + 0x14]
    jne L17
    mov eax, dword ptr [ebp + 8]
    cmp eax, edi
    jb L18
    cmp eax, dword ptr [ebp - 8]
    jbe L19
    mov eax, dword ptr [ebp + 0xc]
    cmp eax, dword ptr [ebp - 4]
    jb L20
    cmp eax, dword ptr [ebp - 0xc]
    ja L20
    cmp dword ptr [ebp - 4], edi
    jae L21
    xor eax, eax
    inc eax
    jmp L22
    jbe L20
    or eax, 0xffffffff
    jmp L22
    mov eax, dword ptr [ebp - 0x10]
    mov eax, dword ptr [eax + 0x10]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [esi + 0x14]
    mov edx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ebp - 0x14]
    mov eax, dword ptr [eax + 0x10]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ecx + 0x18]
    mov edi, dword ptr [edx + 0x18]
    mov edx, dword ptr [edx + 0x14]
    and dword ptr [ebp - 0xc], 0
    and dword ptr [ebp + 0x10], 0
    cmp edx, -1
    mov ecx, dword ptr [ecx + 0x14]
    mov dword ptr [ebp - 0x18], eax
    mov eax, edx
    je L23
    mov ebx, dword ptr [esi + 0x14]
    mov eax, dword ptr [ebx + eax*4]
    mov eax, dword ptr [eax + 0x14]
    inc dword ptr [ebp - 0xc]
    cmp eax, -1
    jne L24
    cmp ecx, -1
    mov eax, ecx
    je L25
    mov ebx, dword ptr [esi + 0x14]
    mov eax, dword ptr [ebx + eax*4]
    mov eax, dword ptr [eax + 0x14]
    inc dword ptr [ebp + 0x10]
    cmp eax, -1
    jne L26
    mov ebx, dword ptr [ebp - 0xc]
    cmp ebx, dword ptr [ebp + 0x10]
    jbe L27
    mov eax, ebx
    sub eax, dword ptr [ebp + 0x10]
    mov edi, dword ptr [esi + 0x14]
    mov edx, dword ptr [edi + edx*4]
    mov edi, dword ptr [edx + 0x18]
    mov edx, dword ptr [edx + 0x14]
    dec ebx
    dec eax
    jne L28
    mov eax, dword ptr [ebp + 0x10]
    cmp eax, ebx
    jbe L29
    sub eax, ebx
    mov ebx, eax
    dec ebx
    mov eax, dword ptr [esi + 0x14]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ecx + 0x18]
    mov ecx, dword ptr [ecx + 0x14]
    jne L30
    jmp L31
    mov eax, dword ptr [ebp - 0x18]
    cmp edx, ecx
    je L32
    mov esi, dword ptr [esi + 0x14]
    mov edx, dword ptr [esi + edx*4]
    mov ecx, dword ptr [esi + ecx*4]
    mov edi, dword ptr [edx + 0x18]
    mov eax, dword ptr [ecx + 0x18]
    mov edx, dword ptr [edx + 0x14]
    mov ecx, dword ptr [ecx + 0x14]
    cmp edx, ecx
    jne L33
    test edi, edi
    je L34
    test eax, eax
    jne L35
    jmp L36
    test eax, eax
    jne L37
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [ebp + 0xc], eax
    ja L36
    sbb eax, eax
    neg eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 0xc
    }
}
