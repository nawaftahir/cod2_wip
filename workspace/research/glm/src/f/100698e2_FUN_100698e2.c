extern void sub_10069860(void);

__declspec(naked) void FUN_100698e2(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push 1
    mov esi, ecx
    call sub_10069860
    test eax, eax
    jl L1
    mov eax, dword ptr [esi + 0x5c]
    mov ecx, dword ptr [esi + 0x58]
    mov edx, dword ptr [ebp + 8]
    mov dword ptr [ecx + eax*4], edx
    inc dword ptr [esi + 0x5c]
    xor eax, eax
    pop esi
    pop ebp
    ret 4
    }
}
