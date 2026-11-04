extern void sub_100fa20f(void);
extern void sub_100fc47a(void);
extern void sub_100fe8b3(void);

__declspec(naked) void __strdup(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    test esi, esi
    je L1
    push esi
    call sub_100fa20f
    inc eax
    push eax
    call sub_100fc47a
    test eax, eax
    pop ecx
    pop ecx
    je L1
    push esi
    push eax
    call sub_100fe8b3
    pop ecx
    pop ecx
    pop esi
    ret
    xor eax, eax
    pop esi
    ret
    }
}
