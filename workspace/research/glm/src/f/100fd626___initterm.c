
__declspec(naked) void __initterm(void)
{
    __asm {
    push esi
    mov esi, eax
    jmp L3
    mov eax, dword ptr [esi]
    test eax, eax
    je L3
    call eax
    add esi, 4
    cmp esi, dword ptr [esp + 8]
    jb L3
    pop esi
    ret
    }
}
