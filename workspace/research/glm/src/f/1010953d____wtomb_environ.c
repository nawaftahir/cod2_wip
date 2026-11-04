extern int g_1010c044;
extern int g_101ae034;
extern void sub_100f853e(void);
extern void sub_100f855a(void);
extern void sub_100fc49b(void);
extern void sub_1010a425(void);

__declspec(naked) void ___wtomb_environ(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    xor esi, esi
    push edi
    mov edi, dword ptr g_101ae034
    mov dword ptr [ebp - 4], esi
    mov eax, dword ptr [edi]
    cmp eax, esi
    je L6
    mov ebx, dword ptr g_1010c044
    push esi
    push esi
    push esi
    push esi
    push -1
    push eax
    push esi
    push esi
    call ebx
    cmp eax, esi
    mov dword ptr [ebp - 8], eax
    je L6
    push eax
    call sub_100fc49b
    cmp eax, esi
    pop ecx
    mov dword ptr [ebp - 4], eax
    je L6
    push esi
    push esi
    push dword ptr [ebp - 8]
    push eax
    push -1
    push dword ptr [edi]
    push esi
    push esi
    call ebx
    test eax, eax
    je L6
    lea eax, [ebp - 4]
    push esi
    push eax
    call sub_1010a425
    test eax, eax
    pop ecx
    pop ecx
    jge L6
    cmp dword ptr [ebp - 4], esi
    je L6
    push dword ptr [ebp - 4]
    call sub_100f853e
    pop ecx
    mov dword ptr [ebp - 4], esi
    add edi, 4
    mov eax, dword ptr [edi]
    cmp eax, esi
    jne L6
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret
    push dword ptr [ebp - 4]
    call sub_100f855a
    pop ecx
    or eax, 0xffffffff
    jmp L6
    }
}
