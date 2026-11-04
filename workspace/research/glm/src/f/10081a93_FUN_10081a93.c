extern void sub_100f7882(void);
extern void sub_100f78ab(void);

__declspec(naked) void FUN_10081a93(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    mov eax, dword ptr [ebp + 8]
    push ebx
    mov ebx, ecx
    cmp eax, dword ptr [ebx + 8]
    push edi
    jbe L3
    push eax
    call sub_100f7882
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebp - 4], edi
    jne L3
    mov eax, 0x8007000e
    jmp L3
    mov ecx, dword ptr [ebx + 8]
    mov eax, ecx
    push esi
    mov esi, dword ptr [ebx + 0xc]
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    push dword ptr [ebx + 0xc]
    call sub_100f78ab
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebx + 0xc], eax
    mov eax, dword ptr [ebp + 8]
    pop ecx
    mov dword ptr [ebx + 8], eax
    pop esi
    xor eax, eax
    pop edi
    pop ebx
    leave
    ret 4
    }
}
