extern int g_101a50d0;
extern void sub_10100d4d(void);
extern void sub_101063ec(void);
extern void sub_10106520(void);

__declspec(naked) void __atoldbl(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x14
    mov eax, dword ptr g_101a50d0
    mov dword ptr [ebp - 4], eax
    xor eax, eax
    push eax
    push eax
    push eax
    push 1
    push dword ptr [ebp + 0xc]
    lea eax, [ebp - 0x14]
    push eax
    lea eax, [ebp - 0x10]
    push eax
    call sub_10106520
    push dword ptr [ebp + 8]
    lea eax, [ebp - 0x10]
    push eax
    call sub_101063ec
    mov ecx, dword ptr [ebp - 4]
    add esp, 0x24
    call sub_10100d4d
    leave
    ret
    }
}
