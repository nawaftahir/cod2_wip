extern int g_101a50d0;
extern void sub_100fe634(void);
extern void sub_10100d4d(void);
extern void sub_1010837e(void);
extern void sub_101084af(void);

__declspec(naked) void __cftof(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x2c
    mov eax, dword ptr g_101a50d0
    mov dword ptr [ebp - 4], eax
    push esi
    lea eax, [ebp - 0x1c]
    push eax
    lea eax, [ebp - 0x2c]
    push eax
    mov eax, dword ptr [ebp + 8]
    push dword ptr [eax + 4]
    push dword ptr [eax]
    call sub_101084af
    mov esi, dword ptr [ebp + 0x10]
    lea eax, [ebp - 0x2c]
    push eax
    mov eax, dword ptr [ebp - 0x28]
    add eax, esi
    push eax
    xor eax, eax
    cmp dword ptr [ebp - 0x2c], 0x2d
    sete al
    add eax, dword ptr [ebp + 0xc]
    push eax
    call sub_1010837e
    push 0
    push esi
    push dword ptr [ebp + 0xc]
    lea eax, [ebp - 0x2c]
    call sub_100fe634
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp + 0xc]
    add esp, 0x28
    pop esi
    call sub_10100d4d
    leave
    ret
    }
}
