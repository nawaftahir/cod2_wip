extern int g_101a50d0;
extern void sub_10100de0(void);
extern void sub_1010640d(void);
extern void sub_10106549(void);

__declspec(naked) void __fltin2(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x1c
    mov eax, dword ptr g_101a50d0
    push ebx
    push esi
    push edi
    xor esi, esi
    push esi
    push esi
    push esi
    push esi
    push dword ptr [ebp + 0xc]
    mov dword ptr [ebp - 4], eax
    lea eax, [ebp - 0x1c]
    push eax
    lea eax, [ebp - 0x10]
    push eax
    xor edi, edi
    call sub_10106549
    mov ebx, eax
    add esp, 0x1c
    test bl, 4
    je L5
    mov edi, 0x200
    mov dword ptr [ebp - 0x18], esi
    mov dword ptr [ebp - 0x14], esi
    jmp L5
    lea eax, [ebp - 0x18]
    push eax
    lea eax, [ebp - 0x10]
    push eax
    call sub_1010640d
    test bl, 2
    pop ecx
    pop ecx
    jne L5
    cmp eax, 1
    jne L5
    mov edi, 0x80
    test bl, 1
    jne L5
    cmp eax, 2
    jne L5
    or edi, 0x100
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp - 0x1c]
    sub ecx, dword ptr [ebp + 0xc]
    mov dword ptr [eax], edi
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [ebp - 0x18]
    mov dword ptr [eax + 0x10], ecx
    mov ecx, dword ptr [ebp - 0x14]
    pop edi
    mov dword ptr [eax + 0x14], ecx
    mov ecx, dword ptr [ebp - 4]
    pop esi
    pop ebx
    call sub_10100de0
    leave
    ret
    }
}
