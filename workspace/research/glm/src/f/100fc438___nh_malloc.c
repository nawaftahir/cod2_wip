extern void sub_100fc3cd(void);
extern void sub_10107ed0(void);

__declspec(naked) void __nh_malloc(void)
{
    __asm {
    cmp dword ptr [esp + 4], -0x20
    ja L3
    push dword ptr [esp + 4]
    call sub_100fc3cd
    test eax, eax
    pop ecx
    jne L3
    cmp dword ptr [esp + 8], eax
    je L3
    push dword ptr [esp + 4]
    call sub_10107ed0
    test eax, eax
    pop ecx
    jne L3
    xor eax, eax
    ret
    }
}
