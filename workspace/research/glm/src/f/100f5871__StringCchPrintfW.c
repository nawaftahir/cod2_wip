extern void sub_100cc785(void);

__declspec(naked) void _StringCchPrintfW(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 0xc], 0x7fffffff
    jbe L1
    mov eax, 0x80070057
    pop ebp
    ret
    lea eax, [ebp + 0x14]
    push eax
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_100cc785
    pop ebp
    ret
    }
}
