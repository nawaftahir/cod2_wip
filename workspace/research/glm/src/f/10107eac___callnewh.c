extern int g_101ae234;

__declspec(naked) void __callnewh(void)
{
    __asm {
    mov eax, dword ptr g_101ae234
    test eax, eax
    je L1
    push dword ptr [esp + 4]
    call eax
    test eax, eax
    pop ecx
    je L1
    xor eax, eax
    inc eax
    ret
    xor eax, eax
    ret
    }
}
