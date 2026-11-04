extern void sub_10024460(void);

__declspec(naked) void FUN_100244b0(void)
{
    __asm {
    sub esp, 0xf4
    cmp eax, 2
    push esi
    mov esi, ecx
    jl L0
    push ebx
    push edi
    xor ebx, ebx
    mov edi, esi
    mov dword ptr [esp + 0xc], ebx
    lea esi, [esi + eax*8 - 8]
    push ebp
    mov eax, esi
    sub eax, edi
    sar eax, 3
    shr eax, 3
    inc eax
    cmp eax, 8
    jg L1
    mov eax, esi
    call sub_10024460
    dec ebx
    mov dword ptr [esp + 0x10], ebx
    js L2
    mov edi, dword ptr [esp + ebx*4 + 0x14]
    mov esi, dword ptr [esp + ebx*4 + 0x8c]
    jmp L3
    mov ebx, dword ptr [edi]
    cdq
    sub eax, edx
    sar eax, 1
    mov ecx, dword ptr [edi + eax*8]
    mov edx, dword ptr [edi + eax*8 + 4]
    lea eax, [edi + eax*8]
    mov dword ptr [eax], ebx
    mov ebx, dword ptr [edi + 4]
    mov dword ptr [eax + 4], ebx
    mov dword ptr [edi], ecx
    mov dword ptr [edi + 4], edx
    mov ecx, edi
    lea eax, [esi + 8]
    add ecx, 8
    cmp ecx, esi
    ja L4
    mov edx, dword ptr [ecx]
    cmp edx, dword ptr [edi]
    jbe L5
    sub eax, 8
    cmp eax, edi
    jbe L6
    mov edx, dword ptr [eax]
    cmp edx, dword ptr [edi]
    jae L4
    cmp eax, ecx
    mov ebp, dword ptr [eax]
    jb L7
    mov edx, dword ptr [ecx]
    mov ebx, dword ptr [ecx + 4]
    mov dword ptr [ecx], ebp
    mov ebp, dword ptr [eax + 4]
    mov dword ptr [ecx + 4], ebp
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ebx
    jmp L5
    mov edx, dword ptr [edi]
    mov ebx, dword ptr [edi + 4]
    mov dword ptr [edi], ebp
    mov ebp, dword ptr [eax + 4]
    mov dword ptr [edi + 4], ebp
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ebx
    mov edx, eax
    sub edx, edi
    mov ebx, esi
    sub ebx, ecx
    sub edx, 8
    and ebx, 0xfffffff8
    and edx, 0xfffffff8
    cmp edx, ebx
    mov ebx, dword ptr [esp + 0x10]
    jl L8
    lea edx, [eax - 8]
    cmp edi, edx
    jae L9
    add eax, -8
    mov dword ptr [esp + ebx*4 + 0x14], edi
    mov dword ptr [esp + ebx*4 + 0x8c], eax
    inc ebx
    mov dword ptr [esp + 0x10], ebx
    cmp ecx, esi
    jae L10
    mov edi, ecx
    jmp L3
    cmp ecx, esi
    jae L11
    mov dword ptr [esp + ebx*4 + 0x14], ecx
    mov dword ptr [esp + ebx*4 + 0x8c], esi
    inc ebx
    mov dword ptr [esp + 0x10], ebx
    lea ecx, [eax - 8]
    cmp edi, ecx
    jae L10
    lea esi, [eax - 8]
    jmp L3
    pop ebp
    pop edi
    pop ebx
    pop esi
    add esp, 0xf4
    ret
    }
}
