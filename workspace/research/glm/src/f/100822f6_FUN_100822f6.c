extern void (__stdcall *fp_1010c01c)(void);

__declspec(naked) void FUN_100822f6(void)
{
    __asm {
    mov eax, dword ptr [ecx]
    test eax, eax
    je L0
    push eax
    call fp_1010c01c
    ret
    }
}
