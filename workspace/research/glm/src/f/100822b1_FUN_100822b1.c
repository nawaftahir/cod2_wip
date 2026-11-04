extern void sub_1006387a(void);

__declspec(naked) void FUN_100822b1(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    dec dword ptr [ecx + 4]
    mov eax, dword ptr [ecx + 4]
    jne L1
    push 1
    call sub_1006387a
    xor eax, eax
    pop ebp
    ret 4
    }
}
