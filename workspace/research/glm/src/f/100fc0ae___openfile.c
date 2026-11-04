extern int g_101addc8;
extern int g_101ae230;
extern void sub_10107e2d(void);

__declspec(naked) void __openfile(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    mov esi, dword ptr g_101ae230
    push edi
    mov edi, dword ptr [ebp + 0xc]
    mov al, byte ptr [edi]
    xor ebx, ebx
    cmp al, 0x61
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 4], ebx
    je L0
    cmp al, 0x72
    je L1
    cmp al, 0x77
    jne L2
    mov ecx, 0x301
    jmp L3
    xor ecx, ecx
    or esi, 1
    jmp L4
    mov ecx, 0x109
    or esi, 2
    xor edx, edx
    inc edx
    jmp L5
    cmp edx, ebx
    je L6
    movsx eax, al
    cmp eax, 0x54
    jg L7
    je L8
    sub eax, 0x2b
    je L9
    sub eax, 0x19
    je L10
    sub eax, 0xe
    je L11
    dec eax
    jne L12
    cmp dword ptr [ebp - 4], ebx
    jne L12
    mov dword ptr [ebp - 4], 1
    or ecx, 0x20
    jmp L5
    cmp dword ptr [ebp - 4], ebx
    jne L12
    mov dword ptr [ebp - 4], 1
    or ecx, 0x10
    jmp L5
    test cl, 0x40
    jne L12
    or ecx, 0x40
    jmp L5
    test cl, 2
    jne L12
    and ecx, 0xfffffffe
    and esi, 0xfffffffc
    or ecx, 2
    or esi, 0x80
    jmp L5
    mov eax, 0x1000
    test eax, ecx
    jne L12
    or ecx, eax
    jmp L5
    sub eax, 0x62
    je L13
    dec eax
    je L14
    sub eax, 0xb
    je L15
    sub eax, 6
    jne L12
    test ch, 0xc0
    jne L12
    or ecx, 0x4000
    jmp L5
    cmp dword ptr [ebp - 8], ebx
    jne L12
    mov dword ptr [ebp - 8], 1
    and esi, 0xffffbfff
    jmp L5
    cmp dword ptr [ebp - 8], ebx
    je L16
    xor edx, edx
    jmp L5
    mov dword ptr [ebp - 8], 1
    or esi, 0x4000
    jmp L5
    test ch, 0xc0
    jne L12
    or ecx, 0x8000
    inc edi
    mov al, byte ptr [edi]
    cmp al, bl
    jne L17
    push 0x1a4
    push dword ptr [ebp + 0x10]
    push ecx
    push dword ptr [ebp + 8]
    call sub_10107e2d
    mov ecx, eax
    add esp, 0x10
    cmp ecx, ebx
    jge L18
    xor eax, eax
    jmp L19
    mov eax, dword ptr [ebp + 0x14]
    inc dword ptr g_101addc8
    mov dword ptr [eax + 0xc], esi
    mov dword ptr [eax + 4], ebx
    mov dword ptr [eax], ebx
    mov dword ptr [eax + 8], ebx
    mov dword ptr [eax + 0x1c], ebx
    mov dword ptr [eax + 0x10], ecx
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}
