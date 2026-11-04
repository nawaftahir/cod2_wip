extern void sub_1006c566(void);
extern void sub_1006e308(void);
extern void sub_100f7865(void);
extern void sub_100f786a(void);

__declspec(naked) void FUN_10070bef(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x10
    push ebx
    mov ebx, dword ptr [ebp + 0x10]
    lea eax, [ebx + ebx*2]
    push esi
    shl eax, 2
    push eax
    mov esi, ecx
    call sub_100f786a
    mov edx, eax
    test edx, edx
    pop ecx
    mov dword ptr [ebp - 4], edx
    jne L0
    mov dword ptr [ebp + 0x10], 0x8007000e
    jmp L1
    mov ecx, ebx
    xor eax, eax
    shl ecx, 2
    mov dword ptr [ebp + eax*4 - 0x10], edx
    inc eax
    add edx, ecx
    cmp eax, 3
    jb L2
    mov edx, dword ptr [ebp - 0x10]
    xor eax, eax
    test ebx, ebx
    jbe L3
    mov ecx, dword ptr [esi + 0x2c]
    mov dword ptr [edx + eax*4], ecx
    inc eax
    cmp eax, ebx
    jb L4
    push ebx
    push dword ptr [ebp - 0xc]
    mov ecx, esi
    call sub_1006c566
    test eax, eax
    mov dword ptr [ebp + 0x10], eax
    jl L1
    push ebx
    push dword ptr [ebp - 8]
    mov ecx, esi
    call sub_1006c566
    test eax, eax
    mov dword ptr [ebp + 0x10], eax
    jl L1
    push edi
    push 0
    push edx
    push dword ptr [ebp + 0xc]
    mov edi, ebx
    push dword ptr [ebp - 0xc]
    and edi, 0xfffff
    mov eax, edi
    or eax, 0x20500000
    push eax
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_1006e308
    test eax, eax
    mov dword ptr [ebp + 0x10], eax
    jl L5
    push 0
    push 0
    push dword ptr [ebp - 0xc]
    or edi, 0x11000000
    push dword ptr [ebp - 8]
    mov ecx, esi
    push edi
    push dword ptr [ebp + 8]
    call sub_1006e308
    test eax, eax
    mov dword ptr [ebp + 0x10], eax
    jl L5
    xor edx, edx
    test ebx, ebx
    jbe L6
    mov ecx, dword ptr [esi + 8]
    mov edi, dword ptr [ecx + 0x14]
    mov ecx, dword ptr [ecx + 0xa8]
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [edi + eax*4]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [esi + 8]
    mov edi, dword ptr [ecx + 0xa8]
    mov ecx, dword ptr [ecx + 0x10]
    mov ecx, dword ptr [ecx + edi*4]
    mov ecx, dword ptr [ecx + 8]
    mov dword ptr [eax + 0x10], edx
    inc edx
    cmp edx, ebx
    mov dword ptr [eax + 0xc], ecx
    jb L7
    mov esi, dword ptr [esi + 8]
    mov eax, dword ptr [esi + 0xa8]
    mov ecx, dword ptr [esi + 0x10]
    mov eax, dword ptr [ecx + eax*4]
    inc dword ptr [eax + 8]
    and dword ptr [ebp + 0x10], 0
    pop edi
    push dword ptr [ebp - 4]
    call sub_100f7865
    mov eax, dword ptr [ebp + 0x10]
    pop ecx
    pop esi
    pop ebx
    leave
    ret 0xc
    }
}
