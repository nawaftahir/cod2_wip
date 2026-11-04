extern void sub_10070fa6(void);
extern void sub_10086139(void);

__declspec(naked) void FUN_1007107a(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 0x10]
    test eax, eax
    push ebx
    push esi
    push edi
    mov edi, ecx
    mov dword ptr [ebp - 8], 1
    jbe L0
    mov edx, dword ptr [ebp + 0xc]
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [edx]
    mov eax, dword ptr [eax + 0x14]
    mov eax, dword ptr [eax + ecx*4]
    or esi, 0xffffffff
    cmp dword ptr [eax + 0x34], esi
    je L1
    cmp dword ptr [eax + 8], esi
    jne L1
    mov ebx, dword ptr [edi + 8]
    mov ecx, dword ptr [eax + 0x34]
    mov ebx, dword ptr [ebx + 0x14]
    mov ecx, dword ptr [ebx + ecx*4]
    cmp dword ptr [ecx + 0x60], 0
    jne L2
    mov ebx, dword ptr [eax + 0x60]
    mov dword ptr [ecx + 0x60], ebx
    mov ebx, dword ptr [eax + 0x64]
    mov dword ptr [ecx + 0x64], ebx
    mov eax, dword ptr [eax + 0x34]
    mov dword ptr [edx], eax
    cmp dword ptr [ecx + 0x34], esi
    mov eax, ecx
    jne L3
    mov ebx, dword ptr [edi + 8]
    mov ecx, dword ptr [eax + 4]
    mov ebx, dword ptr [ebx + 0x10]
    mov ecx, dword ptr [ebx + ecx*4]
    test byte ptr [ecx + 5], 1
    je L4
    cmp dword ptr [eax + 8], esi
    je L5
    and dword ptr [ebp - 8], 0
    add edx, 4
    dec dword ptr [ebp - 4]
    jne L6
    xor ebx, ebx
    cmp dword ptr [ebp + 8], ebx
    je L7
    cmp dword ptr [ebp - 8], ebx
    je L7
    cmp dword ptr [ebp + 0x10], ebx
    jbe L8
    mov ecx, dword ptr [edi + 8]
    mov eax, dword ptr [ebp + 0xc]
    mov eax, dword ptr [eax + ebx*4]
    mov edx, dword ptr [ecx + 0x14]
    mov esi, dword ptr [edx + eax*4]
    fld qword ptr [esi + 0x20]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push dword ptr [ecx + 0x78]
    call sub_10086139
    cmp eax, -1
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [ecx + ebx*4], eax
    je L9
    mov ecx, dword ptr [edi + 8]
    mov ecx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [esi + 0x60]
    mov dword ptr [eax + 0x60], ecx
    mov ecx, dword ptr [esi + 0x64]
    inc ebx
    cmp ebx, dword ptr [ebp + 0x10]
    mov dword ptr [eax + 0x64], ecx
    jb L10
    mov eax, dword ptr [edi + 8]
    push 0
    push 0
    push 1
    push 1
    push dword ptr [eax + 0x78]
    mov ecx, edi
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_10070fa6
    test eax, eax
    jl L11
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 0xc
    mov eax, 0x8007000e
    jmp L11
    }
}
