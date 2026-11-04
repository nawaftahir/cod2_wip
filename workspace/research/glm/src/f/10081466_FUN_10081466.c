extern void sub_100811cd(void);

__declspec(naked) void FUN_10081466(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    jge L5
    neg eax
    jmp L5
    lea ecx, [ebp + 0xc]
    push ecx
    mov ecx, dword ptr [ebp + 8]
    push eax
    call sub_100811cd
    test eax, eax
    jl L5
    mov eax, dword ptr [ebp + 0xc]
    cmp word ptr [eax + 8], 3
    je L5
    or eax, 0xffffffff
    jmp L5
    movzx eax, word ptr [eax + 0xa]
    pop ebp
    ret 8
    }
}
