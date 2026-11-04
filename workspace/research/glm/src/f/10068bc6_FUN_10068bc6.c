extern void (__stdcall *fp_1010c048)(void);
extern void sub_10068b95(void);

__declspec(naked) void FUN_10068bc6(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push dword ptr [ebp + 8]
    mov esi, ecx
    call sub_10068b95
    mov esi, dword ptr [esi + eax*4]
    jmp L4
    push dword ptr [ebp + 8]
    push dword ptr [esi]
    call fp_1010c048
    test eax, eax
    je L4
    mov esi, dword ptr [esi + 0x20]
    test esi, esi
    jne L4
    xor eax, eax
    pop esi
    pop ebp
    ret 4
    mov eax, esi
    jmp L4
    }
}
