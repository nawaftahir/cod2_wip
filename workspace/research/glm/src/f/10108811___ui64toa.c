extern void sub_10108773(void);

__declspec(naked) void __ui64toa(void)
{
    __asm {
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    push 0
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_10108773
    mov eax, dword ptr [ebp + 0x10]
    pop ebp
    ret
    }
}
