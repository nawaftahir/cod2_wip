extern void (__stdcall *fp_1010c01c)(void);

__declspec(naked) void FUN_10082304(void)
{
    __asm {
    mov edi, edi
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi]
    test eax, eax
    je L1
    push eax
    call fp_1010c01c
    and dword ptr [esi], 0
    and dword ptr [esi + 4], 0
    and dword ptr [esi + 8], 0
    xor eax, eax
    pop esi
    ret
    }
}
