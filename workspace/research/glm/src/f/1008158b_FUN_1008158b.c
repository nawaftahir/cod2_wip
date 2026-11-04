extern void sub_1007e6dd(void);
extern void sub_100811ce(void);

__declspec(naked) void FUN_1008158b(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push edi
    mov edi, dword ptr [ebp + 0x10]
    test edi, edi
    jge L7
    neg edi
    jmp L7
    mov ecx, dword ptr [ebp + 8]
    lea eax, [ebp + 0x10]
    push eax
    push edi
    call sub_100811ce
    test eax, eax
    jl L7
    mov edi, dword ptr [ebp + 0x10]
    push esi
    mov esi, dword ptr [ebp + 0x18]
    shr esi, 2
    jmp L7
    mov edi, dword ptr [edi + 0x24]
    test edi, edi
    je L7
    push 0
    push esi
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0xc]
    push edi
    call sub_1007e6dd
    test eax, eax
    jge L7
    jmp L7
    xor eax, eax
    pop esi
    pop edi
    pop ebp
    ret 0x14
    }
}
