extern void sub_100fe614(void);
extern void sub_100fe6f3(void);
extern void sub_100fe76b(void);

__declspec(naked) void __cfltcvt(void)
{
    __asm {
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 0x10], 0x65
    je L3
    cmp dword ptr [ebp + 0x10], 0x45
    je L3
    cmp dword ptr [ebp + 0x10], 0x66
    jne L3
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_100fe6f3
    add esp, 0xc
    pop ebp
    ret
    push dword ptr [ebp + 0x18]
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_100fe76b
    jmp L3
    push dword ptr [ebp + 0x18]
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_100fe614
    add esp, 0x10
    pop ebp
    ret
    }
}
