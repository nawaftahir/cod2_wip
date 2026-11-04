extern void sub_100cc7fc(void);

__declspec(naked) void FUN_100f58bd(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 8], 0
    je L1
    cmp dword ptr [ebp + 0xc], 0x7fffffff
    ja L1
    pop ebp
    jmp sub_100cc7fc
    mov eax, 0x80070057
    pop ebp
    ret 0xc
    }
}
