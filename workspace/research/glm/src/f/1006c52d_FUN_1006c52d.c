extern void sub_100f7899(void);

__declspec(naked) void FUN_1006c52d(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L2
    lea edx, [eax - 8]
    mov eax, dword ptr [edx]
    mov dword ptr [ecx + 0x88], eax
    mov eax, dword ptr [edx + 4]
    test eax, eax
    jle L2
    mov dword ptr [ecx + 0x8c], eax
    jmp L2
    neg eax
    push edx
    mov dword ptr [ecx + 0x8c], eax
    call sub_100f7899
    pop ecx
    pop ebp
    ret 4
    }
}
