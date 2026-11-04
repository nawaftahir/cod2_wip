extern int c_10000000;
extern void sub_100853b0(void);
extern void sub_10085d21(void);
extern void sub_100860e0(void);
extern void sub_10086139(void);
extern void sub_10086199(void);

__declspec(naked) void FUN_100c2000(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x14
    push ebx
    mov ebx, dword ptr [ebp + 0x10]
    cmp dword ptr [ebx + 0x30], -1
    push esi
    push edi
    mov esi, ecx
    jne L0
    mov eax, dword ptr [ebx + 4]
    mov ecx, dword ptr [esi + 0x10]
    mov edi, dword ptr [ecx + eax*4]
    mov eax, dword ptr [edi + 4]
    test ah, 8
    je L1
    mov ecx, dword ptr [edi]
    jmp L2
    mov ecx, dword ptr [ebp + 8]
    or eax, dword ptr [ebp + 0xc]
    push 4
    push -1
    or eax, 0x40
    push eax
    push ecx
    mov ecx, esi
    call sub_100860e0
    cmp eax, -1
    mov dword ptr [ebp - 0xc], eax
    je L3
    test byte ptr [edi + 5], 1
    je L4
    fld qword ptr [ebx + 0x20]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0
    push dword ptr [ebx + 0x64]
    mov ecx, esi
    push eax
    call sub_10086139
    cmp eax, -1
    mov dword ptr [ebx + 0x30], eax
    je L3
    mov ecx, dword ptr [ebp + 0x14]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebx + 0x30]
    mov ecx, dword ptr [esi + 0x14]
    mov ecx, dword ptr [ecx + eax*4]
    push ebx
    call sub_10085d21
    jmp L5
    mov eax, dword ptr [esi + 8]
    and dword ptr [ebp - 8], 0
    and dword ptr [ebp + 8], 0
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jbe L6
    mov eax, dword ptr [esi + 0x14]
    mov ecx, dword ptr [ebp + 8]
    mov edi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi + 4]
    cmp eax, dword ptr [ebx + 4]
    jne L7
    mov eax, dword ptr [edi + 0x60]
    cmp eax, dword ptr [ebx + 0x60]
    jne L7
    test eax, eax
    je L7
    cmp dword ptr [edi + 8], -1
    je L8
    cmp ebx, edi
    jne L9
    fld qword ptr [edi + 0x20]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0
    push dword ptr [edi + 0x64]
    mov ecx, esi
    push dword ptr [ebp - 0xc]
    call sub_10086139
    cmp eax, -1
    mov dword ptr [edi + 0x30], eax
    je L3
    mov ecx, dword ptr [esi + 0x14]
    mov eax, dword ptr [ecx + eax*4]
    push edi
    mov ecx, eax
    mov dword ptr [ebp - 0x10], eax
    call sub_10085d21
    mov eax, dword ptr [ebp - 0x10]
    mov ecx, dword ptr [eax + 0x64]
    shl ecx, 2
    mov dword ptr [eax + 0x70], ecx
    cmp dword ptr [edi + 0x44], -1
    je L9
    mov dword ptr [ebp - 8], 1
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [ebp - 4]
    jb L10
    mov eax, dword ptr [esi + 0xe0]
    test eax, eax
    je L0
    cmp dword ptr [ebp - 8], 0
    je L0
    test byte ptr [ebp + 0xd], 0x20
    je L11
    mov eax, dword ptr [eax + 0xb4]
    jmp L12
    mov eax, dword ptr [eax + 0xb8]
    cmp eax, -1
    mov dword ptr [ebp + 8], eax
    je L3
    xor eax, eax
    cmp dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 8], eax
    jbe L0
    mov ecx, dword ptr [esi + 0x14]
    mov edi, dword ptr [ecx + eax*4]
    mov eax, dword ptr [edi + 4]
    cmp eax, dword ptr [ebx + 4]
    jne L13
    mov eax, dword ptr [edi + 0x60]
    cmp eax, dword ptr [ebx + 0x60]
    jne L13
    test eax, eax
    je L13
    cmp dword ptr [edi + 8], -1
    je L14
    cmp ebx, edi
    jne L15
    fld qword ptr [edi + 0x20]
    push ecx
    push ecx
    mov ecx, dword ptr [esi + 0xe0]
    fstp qword ptr [esp]
    push 0
    push dword ptr [edi + 0x64]
    push dword ptr [ebp + 8]
    call sub_10086139
    cmp eax, -1
    mov dword ptr [ebp - 0x14], eax
    je L3
    mov eax, dword ptr [edi + 0x44]
    cmp eax, -1
    je L15
    mov ecx, dword ptr [esi + 0xe0]
    mov edx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 0x48]
    cmp eax, -1
    je L15
    mov edx, dword ptr [ecx + 0x18]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [eax]
    and edx, 0xfff00000
    cmp edx, c_10000000
    mov dword ptr [ebp - 0xc], eax
    jne L15
    and dword ptr [ebp + 0xc], 0
    cmp dword ptr [eax + 0xc], 0
    jbe L16
    mov edx, dword ptr [eax + 0x10]
    jmp L17
    mov edx, dword ptr [ebp - 0x10]
    mov ebx, dword ptr [edi + 0x44]
    cmp dword ptr [edx], ebx
    je L16
    inc dword ptr [ebp + 0xc]
    add edx, 4
    mov dword ptr [ebp - 0x10], edx
    mov edx, dword ptr [ebp + 0xc]
    cmp edx, dword ptr [eax + 0xc]
    jb L18
    mov edx, dword ptr [ebp + 0xc]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax + edx*4]
    push 1
    push 1
    push 0x10000001
    mov dword ptr [ebp + 0xc], eax
    call sub_10086199
    cmp eax, -1
    je L3
    mov ecx, dword ptr [esi + 0xe0]
    mov ecx, dword ptr [ecx + 0x18]
    mov ebx, dword ptr [ecx + eax*4]
    push dword ptr [ebp - 0xc]
    mov ecx, ebx
    call sub_100853b0
    mov ecx, dword ptr [ebx + 0x10]
    mov eax, dword ptr [ebp - 0x14]
    mov edx, dword ptr [ebp + 0xc]
    mov dword ptr [ecx], eax
    mov ecx, dword ptr [ebx + 8]
    mov ebx, dword ptr [ebp + 0x10]
    mov dword ptr [ecx], edx
    mov ecx, dword ptr [edi + 0x30]
    mov edx, dword ptr [esi + 0x14]
    mov ecx, dword ptr [edx + ecx*4]
    mov dword ptr [ecx + 0x44], eax
    mov eax, dword ptr [ebp - 8]
    inc eax
    cmp eax, dword ptr [ebp - 4]
    mov dword ptr [ebp - 8], eax
    jb L19
    mov eax, dword ptr [ebx + 0x30]
    mov ecx, dword ptr [ebp + 0x14]
    mov dword ptr [ecx], eax
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 0x10
    mov eax, 0x8007000e
    jmp L20
    }
}
