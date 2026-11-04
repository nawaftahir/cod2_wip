extern int g_101a50d0;
extern void sub_10100d4d(void);
extern void sub_10108ec8(void);
extern void sub_10108f26(void);

__declspec(naked) void ___mtold12(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x14
    mov eax, dword ptr g_101a50d0
    push ebx
    mov ebx, dword ptr [ebp + 0x10]
    xor edx, edx
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [ebp + 0xc]
    cmp eax, edx
    push esi
    push edi
    mov dword ptr [ebp - 0x14], 0x404e
    mov dword ptr [ebx], edx
    mov dword ptr [ebx + 4], edx
    mov dword ptr [ebx + 8], edx
    jbe L0
    mov dword ptr [ebp + 0x10], eax
    mov esi, ebx
    lea edi, [ebp - 0x10]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    push ebx
    movsd dword ptr es:[edi], dword ptr [esi]
    call sub_10108f26
    push ebx
    call sub_10108f26
    lea eax, [ebp - 0x10]
    push eax
    push ebx
    call sub_10108ec8
    push ebx
    call sub_10108f26
    mov eax, dword ptr [ebp + 8]
    movsx eax, byte ptr [eax]
    and dword ptr [ebp - 0xc], 0
    and dword ptr [ebp - 8], 0
    mov dword ptr [ebp - 0x10], eax
    lea eax, [ebp - 0x10]
    push eax
    push ebx
    call sub_10108ec8
    add esp, 0x1c
    inc dword ptr [ebp + 8]
    dec dword ptr [ebp + 0x10]
    jne L1
    xor edx, edx
    cmp dword ptr [ebx + 8], edx
    jne L2
    mov edi, dword ptr [ebx + 8]
    mov ecx, dword ptr [ebx + 4]
    add dword ptr [ebp - 0x14], 0xfff0
    mov eax, ecx
    shr eax, 0x10
    mov edi, eax
    mov eax, dword ptr [ebx]
    mov esi, eax
    shr esi, 0x10
    shl ecx, 0x10
    or esi, ecx
    shl eax, 0x10
    cmp edi, edx
    mov dword ptr [ebx + 4], esi
    mov dword ptr [ebx], eax
    je L3
    mov dword ptr [ebx + 8], edi
    mov esi, 0x8000
    jmp L4
    push ebx
    call sub_10108f26
    add dword ptr [ebp - 0x14], 0xffff
    pop ecx
    test dword ptr [ebx + 8], esi
    je L5
    mov ax, word ptr [ebp - 0x14]
    mov ecx, dword ptr [ebp - 4]
    pop edi
    pop esi
    mov word ptr [ebx + 0xa], ax
    pop ebx
    call sub_10100d4d
    leave
    ret
    }
}
