extern void sub_100810ba(void);
extern void sub_100811d4(void);
extern void sub_100811f7(void);

__declspec(naked) void FUN_100814ee(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    jne L7
    mov eax, dword ptr [ebp + 0x10]
    test eax, eax
    jge L7
    neg eax
    jmp L7
    lea ecx, [ebp + 8]
    push ecx
    mov ecx, dword ptr [ebp + 8]
    push eax
    call sub_100811d4
    test eax, eax
    jl L7
    mov eax, dword ptr [ebp + 8]
    neg eax
    pop ebp
    ret 0xc
    jge L7
    neg eax
    mov dword ptr [ebp + 8], eax
    jmp L7
    lea ecx, [ebp + 8]
    push ecx
    mov ecx, dword ptr [ebp + 8]
    push eax
    call sub_100811f7
    test eax, eax
    jl L7
    mov ecx, dword ptr [ebp + 8]
    push 1
    push dword ptr [ebp + 0x10]
    call sub_100810ba
    test eax, eax
    jne L7
    xor eax, eax
    jmp L7
    }
}
