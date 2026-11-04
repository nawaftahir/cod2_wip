
__declspec(naked) void ___sbh_resize_block(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0xc
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + 0x10]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 0x10]
    push edi
    mov edi, dword ptr [ebp + 0xc]
    mov edx, edi
    sub edx, dword ptr [ecx + 0xc]
    add esi, 0x17
    shr edx, 0xf
    mov ecx, edx
    imul ecx, ecx, 0x204
    lea ecx, [ecx + eax + 0x144]
    mov dword ptr [ebp - 0xc], ecx
    mov ecx, dword ptr [edi - 4]
    and esi, 0xfffffff0
    dec ecx
    cmp esi, ecx
    lea edi, [ecx + edi - 4]
    mov ebx, dword ptr [edi]
    mov dword ptr [ebp + 0x10], ecx
    mov dword ptr [ebp - 4], ebx
    jle L0
    test bl, 1
    jne L1
    add ebx, ecx
    cmp esi, ebx
    jg L1
    mov ecx, dword ptr [ebp - 4]
    sar ecx, 4
    dec ecx
    cmp ecx, 0x3f
    mov dword ptr [ebp - 8], ecx
    jbe L2
    push 0x3f
    pop ecx
    mov dword ptr [ebp - 8], ecx
    mov ebx, dword ptr [edi + 4]
    cmp ebx, dword ptr [edi + 8]
    jne L3
    cmp ecx, 0x20
    mov ebx, 0x80000000
    jae L4
    shr ebx, cl
    mov ecx, dword ptr [ebp - 8]
    lea ecx, [ecx + eax + 4]
    not ebx
    and dword ptr [eax + edx*4 + 0x44], ebx
    dec byte ptr [ecx]
    jne L3
    mov ecx, dword ptr [ebp + 8]
    and dword ptr [ecx], ebx
    jmp L3
    add ecx, -0x20
    shr ebx, cl
    mov ecx, dword ptr [ebp - 8]
    lea ecx, [ecx + eax + 4]
    not ebx
    and dword ptr [eax + edx*4 + 0xc4], ebx
    dec byte ptr [ecx]
    jne L3
    mov ecx, dword ptr [ebp + 8]
    and dword ptr [ecx + 4], ebx
    mov ecx, dword ptr [edi + 8]
    mov ebx, dword ptr [edi + 4]
    mov dword ptr [ecx + 4], ebx
    mov ecx, dword ptr [edi + 4]
    mov edi, dword ptr [edi + 8]
    mov dword ptr [ecx + 8], edi
    mov ecx, dword ptr [ebp + 0x10]
    sub ecx, esi
    add dword ptr [ebp - 4], ecx
    cmp dword ptr [ebp - 4], 0
    jle L5
    mov edi, dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp + 0xc]
    sar edi, 4
    dec edi
    cmp edi, 0x3f
    lea ecx, [ecx + esi - 4]
    jbe L6
    push 0x3f
    pop edi
    mov ebx, dword ptr [ebp - 0xc]
    lea ebx, [ebx + edi*8]
    mov dword ptr [ebp + 0x10], ebx
    mov ebx, dword ptr [ebx + 4]
    mov dword ptr [ecx + 4], ebx
    mov ebx, dword ptr [ebp + 0x10]
    mov dword ptr [ecx + 8], ebx
    mov dword ptr [ebx + 4], ecx
    mov ebx, dword ptr [ecx + 4]
    mov dword ptr [ebx + 8], ecx
    mov ebx, dword ptr [ecx + 4]
    cmp ebx, dword ptr [ecx + 8]
    jne L7
    mov cl, byte ptr [edi + eax + 4]
    mov byte ptr [ebp + 0x13], cl
    inc cl
    cmp edi, 0x20
    mov byte ptr [edi + eax + 4], cl
    jae L8
    cmp byte ptr [ebp + 0x13], 0
    jne L9
    mov ecx, edi
    mov ebx, 0x80000000
    shr ebx, cl
    mov ecx, dword ptr [ebp + 8]
    or dword ptr [ecx], ebx
    lea eax, [eax + edx*4 + 0x44]
    mov ecx, edi
    jmp L10
    cmp byte ptr [ebp + 0x13], 0
    jne L11
    lea ecx, [edi - 0x20]
    mov ebx, 0x80000000
    shr ebx, cl
    mov ecx, dword ptr [ebp + 8]
    or dword ptr [ecx + 4], ebx
    lea eax, [eax + edx*4 + 0xc4]
    lea ecx, [edi - 0x20]
    mov edx, 0x80000000
    shr edx, cl
    or dword ptr [eax], edx
    mov edx, dword ptr [ebp + 0xc]
    mov ecx, dword ptr [ebp - 4]
    lea eax, [edx + esi - 4]
    mov dword ptr [eax], ecx
    mov dword ptr [ecx + eax - 4], ecx
    jmp L12
    mov edx, dword ptr [ebp + 0xc]
    lea eax, [esi + 1]
    mov dword ptr [edx - 4], eax
    mov dword ptr [edx + esi - 8], eax
    jmp L13
    xor eax, eax
    jmp L14
    jge L13
    mov ebx, dword ptr [ebp + 0xc]
    sub dword ptr [ebp + 0x10], esi
    lea ecx, [esi + 1]
    mov dword ptr [ebx - 4], ecx
    lea ebx, [ebx + esi - 4]
    mov esi, dword ptr [ebp + 0x10]
    sar esi, 4
    dec esi
    cmp esi, 0x3f
    mov dword ptr [ebp + 0xc], ebx
    mov dword ptr [ebx - 4], ecx
    jbe L15
    push 0x3f
    pop esi
    test byte ptr [ebp - 4], 1
    jne L16
    mov esi, dword ptr [ebp - 4]
    sar esi, 4
    dec esi
    cmp esi, 0x3f
    jbe L17
    push 0x3f
    pop esi
    mov ecx, dword ptr [edi + 4]
    cmp ecx, dword ptr [edi + 8]
    jne L18
    cmp esi, 0x20
    mov ebx, 0x80000000
    jae L19
    mov ecx, esi
    shr ebx, cl
    lea esi, [esi + eax + 4]
    not ebx
    and dword ptr [eax + edx*4 + 0x44], ebx
    dec byte ptr [esi]
    jne L20
    mov ecx, dword ptr [ebp + 8]
    and dword ptr [ecx], ebx
    jmp L20
    lea ecx, [esi - 0x20]
    shr ebx, cl
    lea ecx, [esi + eax + 4]
    not ebx
    and dword ptr [eax + edx*4 + 0xc4], ebx
    dec byte ptr [ecx]
    jne L20
    mov ecx, dword ptr [ebp + 8]
    and dword ptr [ecx + 4], ebx
    mov ebx, dword ptr [ebp + 0xc]
    mov ecx, dword ptr [edi + 8]
    mov esi, dword ptr [edi + 4]
    mov dword ptr [ecx + 4], esi
    mov esi, dword ptr [edi + 8]
    mov ecx, dword ptr [edi + 4]
    mov dword ptr [ecx + 8], esi
    mov esi, dword ptr [ebp + 0x10]
    add esi, dword ptr [ebp - 4]
    mov dword ptr [ebp + 0x10], esi
    sar esi, 4
    dec esi
    cmp esi, 0x3f
    jbe L16
    push 0x3f
    pop esi
    mov ecx, dword ptr [ebp - 0xc]
    lea ecx, [ecx + esi*8]
    mov edi, dword ptr [ecx + 4]
    mov dword ptr [ebx + 8], ecx
    mov dword ptr [ebx + 4], edi
    mov dword ptr [ecx + 4], ebx
    mov ecx, dword ptr [ebx + 4]
    mov dword ptr [ecx + 8], ebx
    mov ecx, dword ptr [ebx + 4]
    cmp ecx, dword ptr [ebx + 8]
    jne L21
    mov cl, byte ptr [esi + eax + 4]
    mov byte ptr [ebp + 0xf], cl
    inc cl
    cmp esi, 0x20
    mov byte ptr [esi + eax + 4], cl
    jae L22
    cmp byte ptr [ebp + 0xf], 0
    jne L23
    mov ecx, esi
    mov edi, 0x80000000
    shr edi, cl
    mov ecx, dword ptr [ebp + 8]
    or dword ptr [ecx], edi
    lea eax, [eax + edx*4 + 0x44]
    mov ecx, esi
    jmp L24
    cmp byte ptr [ebp + 0xf], 0
    jne L25
    lea ecx, [esi - 0x20]
    mov edi, 0x80000000
    shr edi, cl
    mov ecx, dword ptr [ebp + 8]
    or dword ptr [ecx + 4], edi
    lea eax, [eax + edx*4 + 0xc4]
    lea ecx, [esi - 0x20]
    mov edx, 0x80000000
    shr edx, cl
    or dword ptr [eax], edx
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [ebx], eax
    mov dword ptr [eax + ebx - 4], eax
    xor eax, eax
    inc eax
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}
