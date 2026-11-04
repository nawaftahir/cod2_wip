extern void sub_100636d9(void);

__declspec(naked) void FUN_1008103e(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + 4]
    cmp eax, 1
    push esi
    lea esi, [eax - 1]
    mov dword ptr [ecx + 4], esi
    jne L1
    push eax
    call sub_100636d9
    mov eax, esi
    pop esi
    pop ebp
    ret 4
    }
}
