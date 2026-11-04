extern void sub_1006a6e8(void);
extern void sub_100f7871(void);

__declspec(naked) void FUN_1006b268(void)
{
    __asm {
    mov edi, edi
    push esi
    mov esi, ecx
    push dword ptr [esi]
    call sub_100f7871
    pop ecx
    mov ecx, dword ptr [esi + 0x20]
    test ecx, ecx
    pop esi
    je L1
    push 1
    call sub_1006a6e8
    ret
    }
}
