extern void sub_1007dabf(void);
extern void sub_100811e9(void);

__declspec(naked) void FUN_1008149e(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    jne L6
    mov eax, dword ptr [ebp + 0x10]
    mov ecx, dword ptr [ebp + 8]
    cmp eax, dword ptr [ecx + 0x18]
    jae L6
    mov ecx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [ecx + eax*4]
    neg eax
    pop ebp
    ret 0xc
    jge L6
    neg eax
    mov dword ptr [ebp + 8], eax
    jmp L6
    lea ecx, [ebp + 8]
    push ecx
    mov ecx, dword ptr [ebp + 8]
    push eax
    call sub_100811e9
    test eax, eax
    jl L6
    push dword ptr [ebp + 0x10]
    mov ecx, dword ptr [ebp + 8]
    call sub_1007dabf
    test eax, eax
    jne L6
    xor eax, eax
    jmp L6
    }
}
