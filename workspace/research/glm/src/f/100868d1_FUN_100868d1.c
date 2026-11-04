extern void sub_1008686b(void);
extern void sub_100868b6(void);

__declspec(naked) void FUN_100868d1(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    mov edx, dword ptr [ebp + 0xc]
    mov ecx, dword ptr [ebp + 8]
    call sub_1008686b
    test eax, eax
    jne L1
    pop ebp
    jmp sub_100868b6
    pop ebp
    ret 0xc
    }
}
