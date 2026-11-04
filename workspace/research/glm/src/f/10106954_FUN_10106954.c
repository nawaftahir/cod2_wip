extern int g_101a50d0;
extern void sub_10100d97(void);
extern void sub_10106420(void);
extern void sub_10106546(void);

__declspec(naked) void FUN_10106954(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x10
    mov eax, dword ptr g_101a50d0
    push esi
    mov dword ptr [ebp - 4], eax
    xor eax, eax
    push eax
    push eax
    push eax
    push dword ptr [ebp + 0x14]
    lea eax, [ebp - 0x10]
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push eax
    call sub_10106546
    push dword ptr [ebp + 8]
    mov esi, eax
    lea eax, [ebp - 0x10]
    push eax
    call sub_10106420
    add esp, 0x24
    cmp eax, 1
    jne L1
    or esi, 2
    mov ecx, dword ptr [ebp - 4]
    mov eax, esi
    pop esi
    call sub_10100d97
    leave
    ret
    }
}
