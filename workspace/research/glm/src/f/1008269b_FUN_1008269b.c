extern void (__stdcall *fp_1010c090)(void);

__declspec(naked) void FUN_1008269b(void)
{
    __asm {
    mov edi, edi
    push esi
    mov esi, ecx
    jmp L2
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [eax]
    push 0x8000
    push 0
    push eax
    mov dword ptr [esi], ecx
    call fp_1010c090
    cmp dword ptr [esi], 0
    jne L2
    pop esi
    ret
    }
}
