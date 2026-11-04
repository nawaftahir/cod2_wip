extern void sub_100f786e(void);
extern void sub_100f79e8(void);
extern void sub_100fc48f(void);

__declspec(naked) void copy_environ(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    xor ecx, ecx
    test edi, edi
    mov eax, edi
    jne L6
    leave
    ret
    cmp dword ptr [edi], 0
    je L6
    add eax, 4
    inc ecx
    cmp dword ptr [eax], 0
    jne L6
    push ebx
    lea eax, [ecx*4 + 4]
    push esi
    push eax
    call sub_100fc48f
    mov esi, eax
    test esi, esi
    pop ecx
    mov dword ptr [ebp - 4], esi
    jne L6
    push 9
    call sub_100f786e
    pop ecx
    mov eax, dword ptr [edi]
    mov ebx, edi
    jmp L6
    push eax
    call sub_100f79e8
    mov dword ptr [esi], eax
    add esi, 4
    add ebx, 4
    mov eax, dword ptr [ebx]
    pop ecx
    test eax, eax
    jne L6
    and dword ptr [esi], eax
    mov eax, dword ptr [ebp - 4]
    pop esi
    pop ebx
    leave
    ret
    }
}
