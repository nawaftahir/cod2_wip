extern int g_1076aa34;
extern void sub_100fb11c(void);
extern void sub_10106e97(void);
extern void sub_10109fd3(void);

__declspec(naked) void __mbsnbicoll(void)
{
    __asm {
    push ebp
    mov ebp, esp
    call sub_100fb11c
    mov eax, dword ptr [eax + 0x60]
    cmp eax, dword ptr g_1076aa34
    je L3
    call sub_10106e97
    cmp dword ptr [ebp + 0x10], 0
    jne L3
    xor eax, eax
    pop ebp
    ret
    push dword ptr [eax + 4]
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 8]
    push 1
    push dword ptr [eax + 0xc]
    call sub_10109fd3
    add esp, 0x1c
    test eax, eax
    jne L3
    mov eax, 0x7fffffff
    pop ebp
    ret
    add eax, -2
    pop ebp
    ret
    }
}
