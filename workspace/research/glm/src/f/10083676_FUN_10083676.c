extern void sub_100827ec(void);
extern void sub_10082816(void);
extern void sub_10082825(void);

__declspec(naked) void FUN_10083676(void)
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
    call sub_100827ec
    test eax, eax
    je L2
    push dword ptr [edi + 0x10]
    push dword ptr [esi + 0x10]
    call sub_10082816
    test eax, eax
    je L2
    push dword ptr [edi + 0x14]
    push dword ptr [esi + 0x14]
    call sub_10082825
    test eax, eax
    je L2
    xor eax, eax
    inc eax
    jmp L2
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 4
    }
}
