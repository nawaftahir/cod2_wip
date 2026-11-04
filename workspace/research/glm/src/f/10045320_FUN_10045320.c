extern void sub_10044e40(void);
extern void sub_10044eb0(void);

__declspec(naked) void FUN_10045320(void)
{
    __asm {
    push ebx
    push esi
    mov esi, eax
    push 0xdd
    call sub_10044e40
    add esp, 4
    mov ebx, 4
    call sub_10044eb0
    mov ebx, dword ptr [esi + 0xc4]
    call sub_10044eb0
    pop esi
    pop ebx
    ret
    }
}
