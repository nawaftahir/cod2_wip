extern void sub_100857f7(void);
extern void sub_100a97cd(void);

__declspec(naked) void FUN_100a9827(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x410
    push ebx
    push esi
    push edi
    xor ebx, ebx
    mov edi, ecx
    xor edx, edx
    cmp dword ptr [ebp + 0xc], ebx
    mov dword ptr [ebp - 0x10], edi
    jbe L0
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + edx*4]
    cmp eax, ebx
    je L1
    xor ecx, ecx
    cmp dword ptr [eax + 0xc], ebx
    jbe L2
    mov esi, dword ptr [eax + 0x10]
    mov esi, dword ptr [esi + ecx*4]
    mov ebx, dword ptr [edi + 0x14]
    mov esi, dword ptr [ebx + esi*4]
    inc ecx
    mov dword ptr [esi + 0x48], edx
    cmp ecx, dword ptr [eax + 0xc]
    jb L3
    xor ebx, ebx
    mov dword ptr [eax + 0x1c], ebx
    mov dword ptr [eax + 0x14], ebx
    inc edx
    cmp edx, dword ptr [ebp + 0xc]
    jb L4
    xor esi, esi
    cmp dword ptr [edi + 8], ebx
    jbe L5
    mov eax, dword ptr [edi + 0x14]
    mov ecx, dword ptr [eax + esi*4]
    mov edx, dword ptr [ecx + 0x38]
    cmp edx, -1
    je L6
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + 0x48]
    mov dword ptr [ecx + 0x48], eax
    inc esi
    cmp esi, dword ptr [edi + 8]
    jb L7
    cmp dword ptr [ebp + 0xc], ebx
    mov dword ptr [ebp - 4], ebx
    jbe L8
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp - 4]
    mov ebx, dword ptr [eax + ecx*4]
    xor esi, esi
    cmp ebx, esi
    je L9
    cmp dword ptr [ebx + 4], esi
    mov dword ptr [ebp - 0xc], esi
    mov dword ptr [ebp - 8], esi
    jbe L10
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [ebx + 8]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [edi + 0x14]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 0x48]
    cmp eax, -1
    je L11
    xor ecx, ecx
    test esi, esi
    jbe L12
    cmp dword ptr [ebp + ecx*4 - 0x410], eax
    je L12
    inc ecx
    cmp ecx, esi
    jb L13
    cmp ecx, esi
    jne L14
    mov dword ptr [ebp + esi*4 - 0x410], eax
    inc esi
    mov dword ptr [ebp - 0xc], esi
    push dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp + 8]
    push dword ptr [ecx + eax*4]
    call sub_100a97cd
    test eax, eax
    jl L15
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebx + 4]
    jb L16
    push esi
    call sub_100857f7
    test eax, eax
    mov dword ptr [ebx + 0x18], eax
    je L17
    mov ecx, esi
    mov edi, eax
    mov eax, dword ptr [ebp - 0xc]
    lea esi, [ebp - 0x410]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov edi, dword ptr [ebp - 0x10]
    mov dword ptr [ebx + 0x14], eax
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp + 0xc]
    jb L18
    xor ebx, ebx
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
    mov eax, 0x8007000e
    jmp L15
    }
}
