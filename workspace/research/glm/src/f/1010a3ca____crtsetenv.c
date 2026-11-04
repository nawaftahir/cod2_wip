extern int g_101ae02c;
extern int g_101ae030;
extern int g_101ae034;
extern void (__stdcall *fp_1010c0f8)(void);
extern void sub_100f84d0(void);
extern void sub_100fa200(void);
extern void sub_100fc464(void);
extern void sub_100fe890(void);
extern void sub_1010953d(void);
extern void sub_101095cd(void);
extern void sub_1010a31c(void);
extern void sub_1010a369(void);
extern void sub_1010a59f(void);

__declspec(naked) void ___crtsetenv(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x10
    mov eax, dword ptr [ebp + 8]
    push ebx
    xor ebx, ebx
    cmp eax, ebx
    push edi
    mov dword ptr [ebp - 0x10], ebx
    jne L0
    or eax, 0xffffffff
    jmp L1
    push esi
    mov esi, dword ptr [eax]
    cmp esi, ebx
    mov dword ptr [ebp - 4], esi
    je L2
    push 0x3d
    push esi
    call sub_1010a59f
    cmp eax, ebx
    pop ecx
    pop ecx
    mov dword ptr [ebp - 0xc], eax
    je L2
    cmp esi, eax
    je L2
    xor ecx, ecx
    cmp byte ptr [eax + 1], bl
    mov eax, dword ptr g_101ae02c
    sete cl
    cmp eax, dword ptr g_101ae030
    mov dword ptr [ebp - 8], ecx
    jne L3
    mov edi, eax
    call sub_1010a369
    mov dword ptr g_101ae02c, eax
    cmp eax, ebx
    jne L4
    cmp dword ptr [ebp + 0xc], ebx
    je L5
    cmp dword ptr g_101ae034, ebx
    je L5
    call sub_1010953d
    test eax, eax
    je L4
    or eax, 0xffffffff
    pop esi
    pop edi
    pop ebx
    leave
    ret
    cmp dword ptr [ebp - 8], ebx
    je L6
    xor eax, eax
    jmp L7
    push 4
    call sub_100fc464
    cmp eax, ebx
    pop ecx
    mov dword ptr g_101ae02c, eax
    je L2
    mov dword ptr [eax], ebx
    cmp dword ptr g_101ae034, ebx
    jne L4
    push 4
    call sub_100fc464
    cmp eax, ebx
    pop ecx
    mov dword ptr g_101ae034, eax
    je L2
    mov dword ptr [eax], ebx
    mov edi, dword ptr [ebp - 0xc]
    sub edi, dword ptr [ebp - 4]
    push dword ptr [ebp - 4]
    mov esi, dword ptr g_101ae02c
    call sub_1010a31c
    mov edi, eax
    cmp edi, ebx
    pop ecx
    jl L8
    cmp dword ptr [esi], ebx
    je L8
    lea esi, [esi + edi*4]
    push dword ptr [esi]
    call sub_100f84d0
    cmp dword ptr [ebp - 8], ebx
    pop ecx
    jne L9
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [esi], eax
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [eax], ebx
    jmp L10
    mov eax, dword ptr [esi + 4]
    mov dword ptr [esi], eax
    inc edi
    add esi, 4
    cmp dword ptr [esi], ebx
    jne L11
    mov eax, edi
    shl eax, 2
    push eax
    push dword ptr g_101ae02c
    call sub_101095cd
    cmp eax, ebx
    pop ecx
    pop ecx
    je L10
    jmp L12
    cmp dword ptr [ebp - 8], ebx
    jne L13
    cmp edi, ebx
    jge L14
    neg edi
    lea eax, [edi*4 + 8]
    push eax
    push dword ptr g_101ae02c
    call sub_101095cd
    cmp eax, ebx
    pop ecx
    pop ecx
    je L2
    mov edx, dword ptr [ebp - 4]
    lea ecx, [eax + edi*4]
    mov dword ptr [ecx], edx
    mov dword ptr [ecx + 4], ebx
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [ecx], ebx
    mov dword ptr g_101ae02c, eax
    cmp dword ptr [ebp + 0xc], ebx
    je L15
    push dword ptr [ebp - 4]
    call sub_100fa200
    inc eax
    inc eax
    push eax
    call sub_100fc464
    mov esi, eax
    cmp esi, ebx
    pop ecx
    pop ecx
    je L15
    push dword ptr [ebp - 4]
    push esi
    call sub_100fe890
    mov eax, esi
    sub eax, dword ptr [ebp - 4]
    pop ecx
    add eax, dword ptr [ebp - 0xc]
    pop ecx
    mov ecx, dword ptr [ebp - 8]
    mov byte ptr [eax], bl
    inc eax
    neg ecx
    sbb ecx, ecx
    not ecx
    and ecx, eax
    push ecx
    push esi
    call fp_1010c0f8
    test eax, eax
    jne L16
    or dword ptr [ebp - 0x10], 0xffffffff
    push esi
    call sub_100f84d0
    pop ecx
    cmp dword ptr [ebp - 8], ebx
    je L17
    push dword ptr [ebp - 4]
    call sub_100f84d0
    pop ecx
    mov eax, dword ptr [ebp - 0x10]
    jmp L7
    push dword ptr [ebp - 4]
    call sub_100f84d0
    mov eax, dword ptr [ebp + 8]
    pop ecx
    mov dword ptr [eax], ebx
    jmp L18
    }
}
