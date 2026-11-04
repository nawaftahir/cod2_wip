extern void sub_101054a6(void);

__declspec(naked) void write_multi_char(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push esi
    mov esi, eax
    jmp L3
    push dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 0x10]
    dec dword ptr [ebp + 0xc]
    call sub_101054a6
    cmp dword ptr [esi], -1
    pop ecx
    je L3
    cmp dword ptr [ebp + 0xc], 0
    jg L3
    pop esi
    pop ebp
    ret
    }
}
