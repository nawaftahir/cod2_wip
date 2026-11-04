extern void sub_100c99cb(void);
extern void sub_100c99df(void);

__declspec(naked) void FUN_100c99ce(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    or eax, dword ptr [ebp + 0xc]
    push esi
    push eax
    mov esi, ecx
    call sub_100c99cb
    test eax, eax
    jl L2
    cmp dword ptr [ebp + 0x10], 0
    je L2
    push dword ptr [ebp + 0x10]
    mov ecx, esi
    call sub_100c99df
    test eax, eax
    jl L2
    mov eax, dword ptr [esi + 0x118]
    mov ecx, dword ptr [esi + 0x10c]
    lea eax, [ecx + eax*4]
    or byte ptr [eax + 3], 0x10
    xor eax, eax
    pop esi
    pop ebp
    ret 0xc
    }
}
