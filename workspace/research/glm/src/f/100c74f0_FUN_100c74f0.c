extern int g_1019bda0;
extern int g_1019bdec;
extern void sub_100c37fb(void);
extern void sub_100c5bcc(void);

__declspec(naked) void FUN_100c74f0(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x10
    push ebx
    push esi
    push edi
    mov edi, ecx
    and dword ptr [edi + 0x15c], 0
    mov eax, dword ptr [edi + 0x100]
    mov ecx, dword ptr [eax]
    mov edx, ecx
    and edx, 0xfff00000
    cmp edx, 0x20400000
    jne L0
    and ecx, 0xfffff
    mov dword ptr [ebp - 4], 1
    jbe L1
    mov edx, dword ptr [eax + 8]
    lea esi, [edx + ecx*4]
    mov dword ptr [ebp - 8], ecx
    mov ebx, dword ptr [edx]
    cmp ebx, dword ptr [esi]
    je L2
    and dword ptr [ebp - 4], 0
    add esi, 4
    add edx, 4
    dec dword ptr [ebp - 8]
    jne L3
    cmp dword ptr [ebp - 4], 0
    je L4
    push 1
    push 2
    push 0
    or ecx, 0x20400000
    push eax
    push ecx
    mov ecx, edi
    call sub_100c37fb
    fld dword ptr g_1019bda0
    test eax, eax
    je L5
    mov dword ptr [ebp - 0x10], eax
    jmp L6
    fld dword ptr g_1019bdec
    mov esi, dword ptr [eax]
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [edi + 0x14]
    mov ecx, dword ptr [edi + 0x10]
    and esi, 0xfffff
    lea ebx, [eax + esi*4]
    mov dword ptr [ebp - 8], ebx
    mov ebx, dword ptr [ebx]
    mov ebx, dword ptr [edx + ebx*4]
    mov ebx, dword ptr [ebx + 4]
    mov ebx, dword ptr [ecx + ebx*4]
    test byte ptr [ebx + 5], 1
    je L7
    mov dword ptr [ebp - 0xc], eax
    mov eax, dword ptr [ebp - 8]
    jmp L8
    mov ebx, dword ptr [eax]
    mov ebx, dword ptr [edx + ebx*4]
    mov ebx, dword ptr [ebx + 4]
    mov ecx, dword ptr [ecx + ebx*4]
    test byte ptr [ecx + 5], 1
    je L5
    mov ecx, dword ptr [ebp - 8]
    mov dword ptr [ebp - 0xc], ecx
    xor ebx, ebx
    xor ecx, ecx
    cmp esi, ebx
    mov dword ptr [ebp - 8], eax
    jbe L9
    mov eax, dword ptr [ebp - 8]
    fld st(0)
    mov eax, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edx + eax*4]
    fld qword ptr [eax + 0x20]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L5
    inc ecx
    cmp ecx, esi
    jb L10
    cmp dword ptr [ebp - 4], ebx
    fstp st(0)
    jne L11
    mov eax, dword ptr [edi + 0x100]
    push 2
    push 2
    push ebx
    push eax
    mov eax, dword ptr [eax]
    and eax, 0xfffff
    or eax, 0x20400000
    push eax
    mov ecx, edi
    call sub_100c37fb
    cmp eax, ebx
    je L0
    cmp esi, ebx
    mov dword ptr [ebp - 4], 1
    jbe L12
    mov ecx, dword ptr [eax + 8]
    lea edx, [ecx + esi*4]
    mov dword ptr [ebp - 8], esi
    mov esi, dword ptr [ecx]
    cmp esi, dword ptr [edx]
    je L13
    mov dword ptr [ebp - 4], ebx
    add edx, 4
    add ecx, 4
    dec dword ptr [ebp - 8]
    jne L14
    cmp dword ptr [ebp - 4], ebx
    je L0
    push ebx
    push eax
    mov esi, eax
    mov eax, 0x60000
    push eax
    push dword ptr [ebp - 0xc]
    jmp L15
    mov esi, dword ptr [ebp - 0x10]
    mov ecx, dword ptr [edi + 0x100]
    push ebx
    push esi
    mov eax, 0x60000
    push eax
    push dword ptr [ecx + 8]
    push ebx
    mov ecx, edi
    push eax
    call sub_100c5bcc
    cmp eax, ebx
    jne L16
    mov dword ptr [esi], ebx
    jmp L16
    fstp st(0)
    xor eax, eax
    inc eax
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}
