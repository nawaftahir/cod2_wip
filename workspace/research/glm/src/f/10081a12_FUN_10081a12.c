extern void sub_100f787c(void);

__declspec(naked) void FUN_10081a12(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push edi
    mov esi, ecx
    call sub_100f787c
    test eax, eax
    pop ecx
    mov dword ptr [esi + 0xc], eax
    jne L2
    mov eax, 0x8007000e
    jmp L2
    mov dword ptr [esi + 8], edi
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 4
    }
}
