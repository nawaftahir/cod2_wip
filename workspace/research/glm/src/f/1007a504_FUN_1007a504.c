extern void sub_1006e26a(void);
extern void sub_1007227c(void);
extern void sub_100730ba(void);
extern void sub_1007a632(void);
extern void sub_100f7865(void);
extern void sub_100f786a(void);

__declspec(naked) void FUN_1007a504(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x14
    mov eax, dword ptr [ebp + 0xc]
    push ebx
    push edi
    xor edi, edi
    cmp eax, edi
    mov ebx, ecx
    je L0
    cmp dword ptr [ebp + 0x14], eax
    jne L1
    mov ecx, dword ptr [ebx + 8]
    test byte ptr [ecx + 0x70], 4
    jne L0
    push edi
    push eax
    mov ecx, ebx
    call sub_1007a632
    cmp eax, edi
    jl L2
    cmp dword ptr [ebx + 0x50], edi
    jne L3
    cmp dword ptr [ebx + 0x54], edi
    jne L3
    mov dword ptr [ebp + 0xc], edi
    mov eax, dword ptr [ebx + 4]
    mov ecx, dword ptr [eax + 0x18]
    mov eax, dword ptr [ebx + 8]
    mov edx, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 0xc]
    push esi
    mov esi, ecx
    shl esi, 2
    push esi
    mov dword ptr [ebp - 0x14], edx
    mov dword ptr [ebp - 0x10], eax
    call sub_100f786a
    mov edx, eax
    cmp edx, edi
    pop ecx
    mov dword ptr [ebp - 8], edx
    jne L4
    mov dword ptr [ebp - 4], 0x8007000e
    jmp L5
    xor eax, eax
    jmp L2
    mov ecx, esi
    mov esi, dword ptr [ebx + 0x18]
    mov eax, ecx
    shr ecx, 2
    mov edi, edx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebx + 8]
    xor eax, eax
    cmp dword ptr [ecx + 0x5c], eax
    je L6
    mov ecx, dword ptr [ebx + 0x60]
    mov esi, dword ptr [ebx + 0x58]
    mov edi, dword ptr [ebx + 0x5c]
    push edx
    push dword ptr [ebp + 0x14]
    mov dword ptr [ebp - 0xc], ecx
    push dword ptr [ebp + 0x10]
    mov ecx, ebx
    push dword ptr [ebp + 0xc]
    mov dword ptr [ebx + 0x58], 1
    push dword ptr [ebp + 8]
    mov dword ptr [ebx + 0x5c], eax
    mov dword ptr [ebx + 0x60], eax
    call sub_1007227c
    mov ecx, dword ptr [ebp - 0xc]
    mov dword ptr [ebp - 4], eax
    xor eax, eax
    cmp dword ptr [ebp - 4], eax
    mov dword ptr [ebx + 0x4c], eax
    mov dword ptr [ebx + 0x50], eax
    mov dword ptr [ebx + 0x54], eax
    mov dword ptr [ebx + 0x58], esi
    mov dword ptr [ebx + 0x5c], edi
    mov dword ptr [ebx + 0x60], ecx
    jge L5
    push dword ptr [ebp - 8]
    mov ecx, ebx
    push dword ptr [ebp - 0x10]
    push dword ptr [ebp - 0x14]
    call sub_1006e26a
    push dword ptr [ebp - 8]
    mov ecx, ebx
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_100730ba
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L5
    and dword ptr [ebp - 4], 0
    push dword ptr [ebp - 8]
    call sub_100f7865
    mov eax, dword ptr [ebp - 4]
    pop ecx
    pop esi
    pop edi
    pop ebx
    leave
    ret 0x10
    }
}
