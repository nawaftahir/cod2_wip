extern void sub_10080caa(void);
extern void sub_100811d0(void);

__declspec(naked) void FUN_1008154e(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    jge L5
    neg eax
    mov dword ptr [ebp + 0xc], eax
    jmp L5
    lea ecx, [ebp + 0xc]
    push ecx
    mov ecx, dword ptr [ebp + 8]
    push eax
    call sub_100811d0
    test eax, eax
    jl L5
    push dword ptr [ebp + 0x10]
    mov ecx, dword ptr [ebp + 0xc]
    call sub_10080caa
    test eax, eax
    jne L5
    xor eax, eax
    jmp L5
    neg eax
    pop ebp
    ret 0xc
    }
}
