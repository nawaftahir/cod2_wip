extern void sub_100f75cd(void);

__declspec(naked) void FUN_10067b01(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    cmp esi, dword ptr [ecx + 4]
    push edi
    push 5
    mov edi, esi
    pop ebx
    jb L6
    xor eax, eax
    jmp L6
    movsx eax, byte ptr [esi]
    push eax
    call sub_100f75cd
    sub eax, 0x66
    pop ecx
    je L6
    dec eax
    dec eax
    jne L6
    push 6
    jmp L6
    push 7
    pop ebx
    lea edi, [esi + 1]
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    je L6
    mov dword ptr [eax], ebx
    mov eax, edi
    sub eax, esi
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
    }
}
