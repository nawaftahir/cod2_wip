extern void sub_10082e0f(void);
extern void sub_10099846(void);
extern void sub_10099b4f(void);
extern void sub_10099bdd(void);
extern void sub_10099f62(void);
extern void sub_1009a02d(void);

__declspec(naked) void FUN_1009b490(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x5c
    push esi
    push edi
    push dword ptr [ebp + 8]
    xor edi, edi
    mov esi, ecx
    mov dword ptr [ebp - 0x14], edi
    call sub_10099b4f
    push dword ptr [ebp + 0xc]
    mov ecx, esi
    mov dword ptr [ebp - 8], eax
    call sub_10099b4f
    push dword ptr [ebp + 0xc]
    mov ecx, esi
    push dword ptr [ebp + 8]
    mov dword ptr [ebp - 0xc], eax
    call sub_10099bdd
    test eax, eax
    je L0
    xor eax, eax
    jmp L1
    push ebx
    lea ecx, [ebp - 0x38]
    xor ebx, ebx
    mov dword ptr [ebp - 4], edi
    call sub_10082e0f
    lea ecx, [ebp - 0x5c]
    call sub_10082e0f
    cmp dword ptr [ebp - 8], ebx
    jbe L2
    cmp edi, dword ptr [ebp - 0xc]
    jae L2
    lea eax, [ebp - 0x38]
    push eax
    push edi
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_10099f62
    test eax, eax
    jl L3
    lea eax, [ebp - 0x5c]
    push eax
    push edi
    push dword ptr [ebp + 0xc]
    mov ecx, esi
    call sub_10099f62
    test eax, eax
    jl L3
    lea eax, [ebp - 0x10]
    push eax
    lea eax, [ebp - 0x5c]
    push eax
    lea eax, [ebp - 0x38]
    push eax
    mov ecx, esi
    call sub_1009a02d
    test eax, eax
    jl L3
    push dword ptr [ebp - 0x10]
    mov ecx, esi
    push dword ptr [ebp - 0x24]
    call sub_10099846
    test eax, eax
    je L4
    xor ebx, ebx
    inc ebx
    push dword ptr [ebp - 0x48]
    mov ecx, esi
    push dword ptr [ebp - 0x10]
    call sub_10099846
    test eax, eax
    je L5
    mov dword ptr [ebp - 4], 1
    jmp L5
    xor ebx, ebx
    inc ebx
    mov dword ptr [ebp - 4], ebx
    test ebx, ebx
    je L6
    cmp dword ptr [ebp - 4], 0
    jne L2
    inc edi
    cmp edi, dword ptr [ebp - 8]
    jb L7
    mov ecx, dword ptr [ebp - 8]
    cmp dword ptr [ebp - 0xc], ecx
    jae L8
    push 4
    pop eax
    jmp L9
    mov eax, dword ptr [ebp - 0x14]
    test ebx, ebx
    pop ebx
    je L10
    add eax, 0x200
    cmp dword ptr [ebp - 4], 0
    je L11
    add eax, 0x10000
    cmp ecx, dword ptr [ebp - 0xc]
    jae L1
    add eax, 0x800000
    pop edi
    pop esi
    leave
    ret 8
    }
}
