extern int g_1076ac64;
extern int g_1076ac68;
extern int g_1076ac6c;
extern int g_1076ac74;
extern int g_1076ac7c;
extern void sub_101014ee(void);
extern void sub_101015a5(void);

__declspec(naked) void ___sbh_alloc_block(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x14
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr g_1076ac68
    mov edx, dword ptr g_1076ac6c
    add ecx, 0x17
    and ecx, 0xfffffff0
    push ebx
    mov dword ptr [ebp - 0x10], ecx
    sar ecx, 4
    push esi
    lea eax, [eax + eax*4]
    push edi
    dec ecx
    cmp ecx, 0x20
    lea edi, [edx + eax*4]
    mov dword ptr [ebp - 4], edi
    jge L0
    or esi, 0xffffffff
    shr esi, cl
    or dword ptr [ebp - 8], 0xffffffff
    jmp L1
    add ecx, -0x20
    or eax, 0xffffffff
    xor esi, esi
    shr eax, cl
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr g_1076ac74
    mov ebx, eax
    mov dword ptr [ebp - 0xc], esi
    cmp ebx, edi
    jmp L2
    mov ecx, dword ptr [ebx + 4]
    mov edi, dword ptr [ebx]
    and ecx, dword ptr [ebp - 8]
    and edi, esi
    or ecx, edi
    jne L3
    add ebx, 0x14
    cmp ebx, dword ptr [ebp - 4]
    mov dword ptr [ebp + 8], ebx
    jb L4
    cmp ebx, dword ptr [ebp - 4]
    jne L5
    mov ebx, edx
    jmp L6
    mov ecx, dword ptr [ebx + 4]
    mov edi, dword ptr [ebx]
    and ecx, dword ptr [ebp - 8]
    and edi, esi
    or ecx, edi
    jne L7
    add ebx, 0x14
    cmp ebx, eax
    mov dword ptr [ebp + 8], ebx
    jb L8
    cmp ebx, eax
    je L9
    mov dword ptr g_1076ac74, ebx
    mov eax, dword ptr [ebx + 0x10]
    mov edx, dword ptr [eax]
    cmp edx, -1
    mov dword ptr [ebp - 4], edx
    je L10
    mov ecx, dword ptr [eax + edx*4 + 0xc4]
    mov edi, dword ptr [eax + edx*4 + 0x44]
    and ecx, dword ptr [ebp - 8]
    and edi, esi
    or ecx, edi
    jne L11
    mov edx, dword ptr [eax + 0xc4]
    and edx, dword ptr [ebp - 8]
    and dword ptr [ebp - 4], 0
    lea ecx, [eax + 0x44]
    mov esi, dword ptr [ecx]
    and esi, dword ptr [ebp - 0xc]
    or edx, esi
    mov esi, dword ptr [ebp - 0xc]
    jne L12
    mov edx, dword ptr [ecx + 0x84]
    and edx, dword ptr [ebp - 8]
    inc dword ptr [ebp - 4]
    add ecx, 4
    mov edi, dword ptr [ecx]
    and edi, esi
    or edx, edi
    je L13
    mov edx, dword ptr [ebp - 4]
    mov ecx, edx
    imul ecx, ecx, 0x204
    lea ecx, [ecx + eax + 0x144]
    mov dword ptr [ebp - 0xc], ecx
    mov ecx, dword ptr [eax + edx*4 + 0x44]
    xor edi, edi
    and ecx, esi
    jne L14
    mov ecx, dword ptr [eax + edx*4 + 0xc4]
    and ecx, dword ptr [ebp - 8]
    push 0x20
    pop edi
    jmp L14
    cmp dword ptr [ebx + 8], 0
    jne L15
    add ebx, 0x14
    mov dword ptr [ebp + 8], ebx
    cmp ebx, dword ptr [ebp - 4]
    jb L16
    cmp ebx, dword ptr [ebp - 4]
    jne L17
    mov ebx, edx
    jmp L18
    cmp dword ptr [ebx + 8], 0
    jne L19
    add ebx, 0x14
    cmp ebx, eax
    mov dword ptr [ebp + 8], ebx
    jb L20
    cmp ebx, eax
    jne L17
    call sub_101014ee
    mov ebx, eax
    test ebx, ebx
    mov dword ptr [ebp + 8], ebx
    je L21
    push ebx
    call sub_101015a5
    pop ecx
    mov ecx, dword ptr [ebx + 0x10]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebx + 0x10]
    cmp dword ptr [eax], -1
    jne L5
    xor eax, eax
    jmp L22
    shl ecx, 1
    inc edi
    test ecx, ecx
    jge L23
    mov ecx, dword ptr [ebp - 0xc]
    mov edx, dword ptr [ecx + edi*8 + 4]
    mov ecx, dword ptr [edx]
    sub ecx, dword ptr [ebp - 0x10]
    mov esi, ecx
    sar esi, 4
    dec esi
    cmp esi, 0x3f
    mov dword ptr [ebp - 8], ecx
    jle L24
    push 0x3f
    pop esi
    cmp esi, edi
    je L25
    mov ecx, dword ptr [edx + 4]
    cmp ecx, dword ptr [edx + 8]
    jne L26
    cmp edi, 0x20
    mov ebx, 0x80000000
    jge L27
    mov ecx, edi
    shr ebx, cl
    mov ecx, dword ptr [ebp - 4]
    lea edi, [eax + edi + 4]
    not ebx
    mov dword ptr [ebp - 0x14], ebx
    and ebx, dword ptr [eax + ecx*4 + 0x44]
    mov dword ptr [eax + ecx*4 + 0x44], ebx
    dec byte ptr [edi]
    jne L28
    mov ecx, dword ptr [ebp - 0x14]
    mov ebx, dword ptr [ebp + 8]
    and dword ptr [ebx], ecx
    jmp L26
    lea ecx, [edi - 0x20]
    shr ebx, cl
    mov ecx, dword ptr [ebp - 4]
    lea ecx, [eax + ecx*4 + 0xc4]
    lea edi, [eax + edi + 4]
    not ebx
    and dword ptr [ecx], ebx
    dec byte ptr [edi]
    mov dword ptr [ebp - 0x14], ebx
    jne L28
    mov ebx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp - 0x14]
    and dword ptr [ebx + 4], ecx
    jmp L26
    mov ebx, dword ptr [ebp + 8]
    cmp dword ptr [ebp - 8], 0
    mov ecx, dword ptr [edx + 8]
    mov edi, dword ptr [edx + 4]
    mov dword ptr [ecx + 4], edi
    mov ecx, dword ptr [edx + 4]
    mov edi, dword ptr [edx + 8]
    mov dword ptr [ecx + 8], edi
    je L29
    mov ecx, dword ptr [ebp - 0xc]
    lea ecx, [ecx + esi*8]
    mov edi, dword ptr [ecx + 4]
    mov dword ptr [edx + 8], ecx
    mov dword ptr [edx + 4], edi
    mov dword ptr [ecx + 4], edx
    mov ecx, dword ptr [edx + 4]
    mov dword ptr [ecx + 8], edx
    mov ecx, dword ptr [edx + 4]
    cmp ecx, dword ptr [edx + 8]
    jne L30
    mov cl, byte ptr [esi + eax + 4]
    mov byte ptr [ebp + 0xb], cl
    inc cl
    cmp esi, 0x20
    mov byte ptr [esi + eax + 4], cl
    jge L31
    cmp byte ptr [ebp + 0xb], 0
    jne L32
    mov edi, 0x80000000
    mov ecx, esi
    shr edi, cl
    or dword ptr [ebx], edi
    mov ecx, esi
    mov edi, 0x80000000
    shr edi, cl
    mov ecx, dword ptr [ebp - 4]
    or dword ptr [eax + ecx*4 + 0x44], edi
    jmp L30
    cmp byte ptr [ebp + 0xb], 0
    jne L33
    lea ecx, [esi - 0x20]
    mov edi, 0x80000000
    shr edi, cl
    or dword ptr [ebx + 4], edi
    mov ecx, dword ptr [ebp - 4]
    lea edi, [eax + ecx*4 + 0xc4]
    lea ecx, [esi - 0x20]
    mov esi, 0x80000000
    shr esi, cl
    or dword ptr [edi], esi
    mov ecx, dword ptr [ebp - 8]
    test ecx, ecx
    je L34
    mov dword ptr [edx], ecx
    mov dword ptr [ecx + edx - 4], ecx
    jmp L34
    mov ecx, dword ptr [ebp - 8]
    mov esi, dword ptr [ebp - 0x10]
    add edx, ecx
    lea ecx, [esi + 1]
    mov dword ptr [edx], ecx
    mov dword ptr [edx + esi - 4], ecx
    mov esi, dword ptr [ebp - 0xc]
    mov ecx, dword ptr [esi]
    test ecx, ecx
    lea edi, [ecx + 1]
    mov dword ptr [esi], edi
    jne L35
    cmp ebx, dword ptr g_1076ac64
    jne L35
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, dword ptr g_1076ac7c
    jne L35
    and dword ptr g_1076ac64, 0
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [eax], ecx
    lea eax, [edx + 4]
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}
