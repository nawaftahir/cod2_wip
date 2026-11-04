extern void sub_1007ec79(void);
extern void sub_100811ce(void);

__declspec(naked) void FUN_100816c1(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 0x10]
    test esi, esi
    jge L5
    neg esi
    jmp L5
    mov ecx, dword ptr [ebp + 8]
    lea eax, [ebp + 0x10]
    push eax
    push esi
    call sub_100811ce
    test eax, eax
    jl L5
    mov esi, dword ptr [ebp + 0x10]
    jmp L5
    mov esi, dword ptr [esi + 0x24]
    test esi, esi
    je L5
    push 0
    push dword ptr [ebp + 0x18]
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0xc]
    push esi
    call sub_1007ec79
    test eax, eax
    jge L5
    jmp L5
    xor eax, eax
    pop esi
    pop ebp
    ret 0x14
    }
}
