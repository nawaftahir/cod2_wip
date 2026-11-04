extern void sub_10063db9(void);
extern void sub_100f7879(void);

__declspec(naked) void FUN_10063e32(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push 0xc
    mov esi, ecx
    call sub_100f7879
    test eax, eax
    mov edx, dword ptr [ebp + 8]
    pop ecx
    je L4
    push edx
    mov ecx, eax
    call sub_10063db9
    jmp L4
    xor eax, eax
    test eax, eax
    jne L4
    mov eax, 0x8007000e
    jmp L4
    mov ecx, dword ptr [esi + 0x68]
    mov dword ptr [eax + 4], ecx
    mov dword ptr [esi + 0x68], eax
    mov dword ptr [esi + 0x298], edx
    xor eax, eax
    pop esi
    pop ebp
    ret 4
    }
}
