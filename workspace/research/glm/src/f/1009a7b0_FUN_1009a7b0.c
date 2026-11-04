extern void sub_10063e32(void);
extern void sub_100673e4(void);

__declspec(naked) void FUN_1009a7b0(void)
{
    __asm {
    mov edi, edi
    push esi
    mov esi, ecx
    mov ecx, dword ptr [esi + 4]
    push 1
    call sub_10063e32
    mov ecx, dword ptr [esi + 4]
    call sub_100673e4
    xor eax, eax
    pop esi
    ret
    }
}
