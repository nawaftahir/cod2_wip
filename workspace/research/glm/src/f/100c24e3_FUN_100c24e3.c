extern void sub_10085604(void);
extern void sub_10093058(void);
extern void sub_100b9ffd(void);
extern void sub_100c229a(void);

__declspec(naked) void FUN_100c24e3(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 0x18]
    test edi, edi
    mov esi, ecx
    jne L0
    xor eax, eax
    inc eax
    jmp L1
    mov eax, dword ptr [esi + 0x18]
    push ebx
    mov ebx, dword ptr [eax + edi*4 - 4]
    mov ecx, ebx
    call sub_10085604
    test eax, eax
    jne L2
    mov eax, dword ptr [ebx]
    and eax, 0xf0000000
    cmp eax, 0x60000000
    je L2
    test edi, edi
    mov dword ptr [ebp + 0x18], edi
    jbe L2
    dec dword ptr [ebp + 0x18]
    mov eax, dword ptr [esi + 0x18]
    mov ecx, dword ptr [ebp + 0x18]
    mov ebx, dword ptr [eax + ecx*4]
    cmp dword ptr [ebx + 0x24], edi
    je L3
    mov eax, dword ptr [ebx]
    test eax, 0xfff00000
    je L3
    and eax, 0xf0000000
    cmp eax, 0x60000000
    je L2
    mov ecx, ebx
    call sub_10085604
    test eax, eax
    jne L2
    push edi
    push ebx
    push dword ptr [ebp + 0x14]
    mov ecx, esi
    call sub_100b9ffd
    mov eax, dword ptr [esi + 0x18]
    mov ecx, dword ptr [eax + edi*4 - 4]
    cmp dword ptr [ecx + 0xc], 0
    mov edx, dword ptr [ebp + 0x18]
    mov eax, dword ptr [eax + edx*4]
    je L3
    cmp dword ptr [eax + 0xc], 0
    je L3
    mov ecx, dword ptr [ecx + 0x10]
    mov eax, dword ptr [eax + 0x10]
    mov edx, dword ptr [esi + 0x14]
    mov ecx, dword ptr [ecx]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [edx + ecx*4]
    mov edx, dword ptr [edx + eax*4]
    mov eax, dword ptr [ecx + 0x14]
    cmp eax, dword ptr [edx + 0x14]
    jne L2
    mov eax, dword ptr [ecx + 0x18]
    cmp eax, dword ptr [edx + 0x18]
    jne L2
    push dword ptr [ebp + 0x18]
    lea eax, [edi - 1]
    push eax
    mov ecx, esi
    call sub_100c229a
    test byte ptr [esi + 0x6f], 0x10
    jne L4
    push 0
    push dword ptr [ebp + 8]
    call sub_10093058
    test eax, eax
    jl L5
    cmp dword ptr [ebp + 0x1c], 0
    je L6
    push 0
    push dword ptr [ebp + 0xc]
    mov ecx, esi
    call sub_10093058
    test eax, eax
    jge L6
    lea eax, [edi - 1]
    push eax
    push dword ptr [ebp + 0x18]
    mov ecx, esi
    call sub_100c229a
    push edi
    push ebx
    push dword ptr [ebp + 0x14]
    call sub_100b9ffd
    cmp dword ptr [ebp + 0x18], 0
    ja L7
    xor eax, eax
    inc eax
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret 0x18
    xor eax, eax
    jmp L8
    }
}
