extern void sub_10085379(void);
extern void sub_10085814(void);
extern void sub_10085abe(void);
extern void sub_10085bf1(void);
extern void sub_10085c65(void);
extern void sub_10085d76(void);
extern void sub_100f786a(void);

__declspec(naked) void FUN_100ab0e0(void)
{
    __asm {
    mov edi, edi
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 0xc]
    push edi
    shl eax, 2
    push eax
    xor edi, edi
    xor ebx, ebx
    call sub_100f786a
    mov dword ptr [esi + 0x2b4], eax
    mov eax, dword ptr [esi + 8]
    shl eax, 2
    push eax
    call sub_100f786a
    cmp dword ptr [esi + 0x2b4], edi
    pop ecx
    pop ecx
    mov dword ptr [esi + 0x2b8], eax
    je L0
    cmp eax, edi
    je L0
    cmp dword ptr [esi + 0xc], ebx
    jbe L1
    push 0x74
    call sub_10085814
    test eax, eax
    je L2
    mov ecx, eax
    call sub_10085379
    jmp L3
    xor eax, eax
    mov ecx, dword ptr [esi + 0x2b4]
    mov dword ptr [ecx + edi*4], eax
    mov eax, dword ptr [esi + 0x2b4]
    mov ecx, dword ptr [eax + edi*4]
    test ecx, ecx
    je L0
    mov eax, dword ptr [esi + 0x18]
    push dword ptr [eax + edi*4]
    call sub_10085abe
    mov ebx, eax
    test ebx, ebx
    jl L4
    inc edi
    cmp edi, dword ptr [esi + 0xc]
    jb L5
    xor edi, edi
    cmp dword ptr [esi + 8], edi
    jbe L6
    push 0x80
    call sub_10085d76
    test eax, eax
    je L7
    mov ecx, eax
    call sub_10085bf1
    jmp L8
    xor eax, eax
    mov ecx, dword ptr [esi + 0x2b8]
    mov dword ptr [ecx + edi*4], eax
    mov eax, dword ptr [esi + 0x2b8]
    mov ecx, dword ptr [eax + edi*4]
    test ecx, ecx
    je L0
    mov eax, dword ptr [esi + 0x14]
    push dword ptr [eax + edi*4]
    call sub_10085c65
    mov ebx, eax
    test ebx, ebx
    jl L4
    inc edi
    cmp edi, dword ptr [esi + 8]
    jb L9
    mov eax, dword ptr [esi + 0xc]
    mov dword ptr [esi + 0x2c0], eax
    mov eax, dword ptr [esi + 8]
    mov dword ptr [esi + 0x2bc], eax
    jmp L4
    mov ebx, 0x8007000e
    pop edi
    pop esi
    mov eax, ebx
    pop ebx
    ret
    }
}
