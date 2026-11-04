extern void sub_10098ffa(void);
extern void sub_10099283(void);

__declspec(naked) void FUN_1009935c(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    push esi
    mov esi, ecx
    and dword ptr [esi + 0xd8], 0
    and dword ptr [esi + 0xdc], 0
    test eax, eax
    je L2
    and dword ptr [eax], 0
    mov ecx, esi
    call sub_10098ffa
    test eax, eax
    jl L2
    mov ecx, esi
    call sub_10099283
    test eax, eax
    jl L2
    xor eax, eax
    pop esi
    pop ebp
    ret 4
    }
}
