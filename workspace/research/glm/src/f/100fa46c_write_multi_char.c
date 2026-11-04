extern void sub_100fa44f(void);

__declspec(naked) void write_multi_char(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push esi
    mov esi, eax
    jmp L3
    mov ecx, dword ptr [ebp + 0x10]
    mov al, byte ptr [ebp + 8]
    dec dword ptr [ebp + 0xc]
    call sub_100fa44f
    cmp dword ptr [esi], -1
    je L3
    cmp dword ptr [ebp + 0xc], 0
    jg L3
    pop esi
    pop ebp
    ret
    }
}
