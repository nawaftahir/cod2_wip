extern void sub_100f788e(void);

__declspec(naked) void FUN_10067634(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    push esi
    push edi
    mov edi, ecx
    lea ecx, [eax + 1]
    mov dl, byte ptr [eax]
    inc eax
    test dl, dl
    jne L3
    sub eax, ecx
    lea esi, [eax + 1]
    lea eax, [esi + 4]
    push eax
    call sub_100f788e
    test eax, eax
    pop ecx
    jne L3
    mov eax, 0x8007000e
    jmp L3
    mov ecx, dword ptr [edi]
    mov dword ptr [eax], ecx
    lea ecx, [esi - 1]
    add dword ptr [edi + 4], ecx
    mov dword ptr [edi], eax
    mov ecx, esi
    mov esi, dword ptr [ebp + 8]
    lea edi, [eax + 4]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 4
    }
}
