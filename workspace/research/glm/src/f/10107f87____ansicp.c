extern int g_101a50d0;
extern void (__stdcall *fp_1010c190)(void);
extern void sub_100f73df(void);
extern void sub_10100d8e(void);

__declspec(naked) void ___ansicp(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0xc
    mov eax, dword ptr g_101a50d0
    push 6
    mov dword ptr [ebp - 4], eax
    lea eax, [ebp - 0xc]
    push eax
    push 0x1004
    push dword ptr [ebp + 8]
    mov byte ptr [ebp - 6], 0
    call fp_1010c190
    test eax, eax
    jne L2
    or eax, 0xffffffff
    jmp L2
    lea eax, [ebp - 0xc]
    push eax
    call sub_100f73df
    pop ecx
    mov ecx, dword ptr [ebp - 4]
    call sub_10100d8e
    leave
    ret
    }
}
