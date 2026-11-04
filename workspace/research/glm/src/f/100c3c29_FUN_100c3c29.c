extern void sub_1006c418(void);
extern void sub_10085379(void);
extern void sub_100853b0(void);
extern void sub_10085814(void);
extern void sub_1008585f(void);
extern void sub_10086026(void);

__declspec(naked) void FUN_100c3c29(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x10
    push ebx
    push esi
    push edi
    push 0x74
    mov esi, ecx
    call sub_10085814
    xor ebx, ebx
    cmp eax, ebx
    je L0
    mov ecx, eax
    call sub_10085379
    mov dword ptr [ebp - 4], eax
    jmp L1
    mov dword ptr [ebp - 4], ebx
    cmp dword ptr [ebp - 4], ebx
    jne L2
    mov edi, 0x8007000e
    jmp L3
    mov edx, dword ptr [ebp + 0x10]
    cmp edx, ebx
    mov dword ptr [ebp - 8], ebx
    jbe L4
    mov eax, dword ptr [esi + 0x100]
    mov ecx, dword ptr [esi + 0x14]
    mov eax, dword ptr [eax + 0x10]
    mov edi, dword ptr [eax]
    mov edi, dword ptr [ecx + edi*4]
    mov edi, dword ptr [edi + 0x10]
    mov ebx, dword ptr [ebp + 8]
    cmp dword ptr [ebx + edi*4], -1
    je L5
    inc dword ptr [ebp - 8]
    add eax, 4
    dec edx
    jne L6
    xor ebx, ebx
    mov eax, dword ptr [ebp - 8]
    imul eax, dword ptr [ebp + 0xc]
    mov ecx, dword ptr [ebp - 4]
    push ebx
    push dword ptr [ebp - 8]
    push eax
    mov eax, dword ptr [esi + 0x100]
    mov eax, dword ptr [eax]
    and eax, 0xfff00000
    or eax, dword ptr [ebp - 8]
    push eax
    call sub_1008585f
    mov edi, eax
    cmp edi, ebx
    jl L7
    push dword ptr [esi + 0x100]
    mov ecx, dword ptr [ebp - 4]
    call sub_100853b0
    mov edi, eax
    cmp edi, ebx
    jl L7
    cmp dword ptr [ebp + 0xc], ebx
    mov dword ptr [ebp - 0xc], ebx
    jbe L8
    xor ecx, ecx
    cmp dword ptr [ebp + 0x10], ebx
    mov dword ptr [ebp - 0x10], ebx
    jbe L9
    mov eax, dword ptr [esi + 0x100]
    mov edx, dword ptr [eax + 0x10]
    mov edx, dword ptr [edx + ecx*4]
    mov edi, dword ptr [esi + 0x14]
    mov edx, dword ptr [edi + edx*4]
    mov edx, dword ptr [edx + 0x10]
    mov edi, dword ptr [ebp + 8]
    cmp dword ptr [edi + edx*4], -1
    je L10
    mov edx, dword ptr [ebp - 0xc]
    imul edx, dword ptr [ebp + 0x10]
    mov edi, dword ptr [ebp - 0xc]
    imul edi, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + 8]
    add edi, dword ptr [ebp - 0x10]
    mov ebx, dword ptr [ebp - 4]
    mov ebx, dword ptr [ebx + 8]
    add edx, ecx
    mov eax, dword ptr [eax + edx*4]
    mov dword ptr [ebx + edi*4], eax
    xor ebx, ebx
    cmp dword ptr [ebp - 0xc], ebx
    jne L11
    mov eax, dword ptr [esi + 0x100]
    mov eax, dword ptr [eax + 0x10]
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [edx + 0x10]
    mov eax, dword ptr [eax + ecx*4]
    mov edi, dword ptr [ebp - 0x10]
    mov dword ptr [edx + edi*4], eax
    inc dword ptr [ebp - 0x10]
    inc ecx
    cmp ecx, dword ptr [ebp + 0x10]
    jb L12
    inc dword ptr [ebp - 0xc]
    mov eax, dword ptr [ebp - 0xc]
    cmp eax, dword ptr [ebp + 0xc]
    jb L13
    push dword ptr [ebp - 4]
    mov ecx, esi
    call sub_10086026
    mov edi, eax
    cmp edi, ebx
    jl L7
    mov dword ptr [ebp - 4], ebx
    xor edi, edi
    cmp dword ptr [ebp - 4], ebx
    je L3
    mov ecx, dword ptr [ebp - 4]
    push 1
    call sub_1006c418
    mov eax, edi
    pop edi
    pop esi
    pop ebx
    leave
    ret 0xc
    }
}
