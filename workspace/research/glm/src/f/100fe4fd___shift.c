extern void sub_100f67b8(void);
extern void sub_100fa20d(void);

__declspec(naked) void __shift(void)
{
    __asm {
    test edi, edi
    push esi
    mov esi, eax
    je L1
    push esi
    call sub_100fa20d
    inc eax
    push eax
    push esi
    add esi, edi
    push esi
    call sub_100f67b8
    add esp, 0x10
    pop esi
    ret
    }
}
