extern void sub_100811d0(void);

__declspec(naked) void FUN_100813b7(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    jge L2
    mov ecx, dword ptr [ebp + 0xc]
    neg eax
    mov dword ptr [ecx], eax
    xor eax, eax
    jmp L2
    push dword ptr [ebp + 0xc]
    push eax
    call sub_100811d0
    pop ebp
    ret 8
    }
}
