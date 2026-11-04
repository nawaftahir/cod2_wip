extern void sub_10062e0a(void);

__declspec(naked) void FUN_100635fe(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, dword ptr [ebp + 0x10]
    test ebx, ebx
    push esi
    push edi
    je L8
    and dword ptr [ebx], 0
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [edx]
    mov ecx, 0xffff0000
    and eax, ecx
    cmp eax, 0x46580000
    je L8
    cmp eax, 0xfffe0000
    je L8
    cmp eax, ecx
    je L8
    mov eax, 0x88760b59
    jmp L8
    and dword ptr [ebp - 4], 0
    lea eax, [ebp + 8]
    push eax
    lea eax, [ebp - 4]
    push eax
    push 0x42415443
    push edx
    call sub_10062e0a
    test eax, eax
    jl L8
    mov ecx, dword ptr [ebp - 4]
    test ecx, ecx
    je L8
    cmp dword ptr [ebp + 8], 0x1c
    jb L8
    mov eax, dword ptr [ecx + 0xc]
    mov edx, dword ptr [ecx + 0x10]
    lea esi, [eax + eax*4]
    lea esi, [esi*4 + 0x1c]
    add edx, ecx
    cmp dword ptr [ebp + 8], esi
    jb L8
    xor esi, esi
    xor edi, edi
    test eax, eax
    jbe L8
    cmp word ptr [edx + 4], 3
    jne L8
    mov eax, dword ptr [edx]
    cmp dword ptr [ebp + 8], eax
    jbe L8
    cmp esi, 0x10
    je L8
    mov ebx, dword ptr [ebp + 0xc]
    add eax, ecx
    mov dword ptr [ebx + esi*4], eax
    mov ebx, dword ptr [ebp + 0x10]
    inc esi
    inc edi
    add edx, 0x14
    cmp edi, dword ptr [ecx + 0xc]
    jb L8
    test ebx, ebx
    je L8
    mov dword ptr [ebx], esi
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 0xc
    }
}
