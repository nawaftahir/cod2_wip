extern void sub_100f75d7(void);
extern void sub_100f75f5(void);

__declspec(naked) void FUN_10067b4b(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    and dword ptr [ebp - 4], 0
    push ebx
    mov ebx, dword ptr [ebp + 8]
    and dword ptr [ebp + 8], 0
    push esi
    mov esi, ecx
    cmp ebx, dword ptr [esi + 4]
    push edi
    mov edi, ebx
    jae L6
    cmp dword ptr [ebp + 8], 0
    jne L6
    movsx eax, byte ptr [edi]
    push eax
    call sub_100f75d7
    cmp eax, 0x75
    pop ecx
    jne L6
    mov dword ptr [ebp + 8], 1
    jmp L6
    cmp dword ptr [ebp - 4], 0
    jne L6
    movsx eax, byte ptr [edi]
    push eax
    call sub_100f75f5
    cmp eax, 0x6c
    pop ecx
    jne L6
    mov dword ptr [ebp - 4], 1
    inc edi
    cmp edi, dword ptr [esi + 4]
    jb L6
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    je L6
    cmp dword ptr [ebp + 8], 0
    je L6
    mov dword ptr [eax], 4
    jmp L6
    cmp dword ptr [ebp - 4], 0
    je L6
    mov dword ptr [eax], 3
    mov eax, edi
    pop edi
    pop esi
    sub eax, ebx
    pop ebx
    leave
    ret 8
    }
}
