extern void sub_100c410e(void);

__declspec(naked) void FUN_100c7b3a(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push 1
    mov esi, ecx
    call sub_100c410e
    test eax, eax
    jl L1
    mov edx, dword ptr [esi + 0x10c]
    lea eax, [esi + 0x110]
    mov ecx, dword ptr [eax]
    mov esi, dword ptr [ebp + 8]
    mov dword ptr [edx + ecx*4], esi
    inc dword ptr [eax]
    xor eax, eax
    pop esi
    pop ebp
    ret 4
    }
}
