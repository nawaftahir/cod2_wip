extern void sub_100be172(void);
extern void sub_100c5bfc(void);

__declspec(naked) void FUN_100c6123(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push dword ptr [ebp + 8]
    mov esi, ecx
    mov ecx, dword ptr [esi + 0x100]
    and dword ptr [esi + 0x15c], 0
    push 0
    mov eax, 0x80000
    push eax
    push dword ptr [ecx + 8]
    mov ecx, esi
    push 0xe0000
    push eax
    call sub_100c5bfc
    test eax, eax
    jl L1
    mov ecx, esi
    call sub_100be172
    pop esi
    pop ebp
    ret 4
    }
}
