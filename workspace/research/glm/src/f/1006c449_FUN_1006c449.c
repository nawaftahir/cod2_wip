extern void sub_100f789e(void);
extern void sub_100f78af(void);

__declspec(naked) void FUN_1006c449(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 0x94]
    cmp dword ptr [ebp + 8], eax
    push esi
    jbe L5
    test eax, eax
    je L5
    lea esi, [eax + eax]
    jmp L5
    push 0x10
    pop esi
    jmp L5
    add esi, esi
    cmp esi, dword ptr [ebp + 8]
    jb L5
    mov eax, esi
    shl eax, 2
    push eax
    call sub_100f789e
    test eax, eax
    pop ecx
    mov dword ptr [ebp + 8], eax
    je L5
    push edi
    lea edi, [ebx + 0x90]
    push dword ptr [edi]
    call sub_100f78af
    mov eax, dword ptr [ebp + 8]
    pop ecx
    mov dword ptr [edi], eax
    mov dword ptr [ebx + 0x94], esi
    pop edi
    mov eax, dword ptr [ebx + 0x90]
    pop esi
    pop ebx
    pop ebp
    ret 4
    }
}
