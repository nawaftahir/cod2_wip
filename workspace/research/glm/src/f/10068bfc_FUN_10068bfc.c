
__declspec(naked) void FUN_10068bfc(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    xor edx, edx
    push edi
    xor esi, esi
    mov eax, dword ptr [ecx + esi*4]
    jmp L3
    mov edi, dword ptr [ebp + 8]
    mov dword ptr [edi + edx*4], eax
    mov eax, dword ptr [eax + 0x20]
    inc edx
    test eax, eax
    jne L3
    inc esi
    cmp esi, 7
    jb L3
    pop edi
    pop esi
    pop ebp
    ret 4
    }
}
