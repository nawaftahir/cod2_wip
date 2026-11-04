extern void sub_1000ea8a(void);
extern void sub_1000ec4d(void);
extern void sub_1000ee64(void);
extern void sub_1002933b(void);
extern void sub_100f883a(void);

__declspec(naked) void FUN_1000fce0(void)
{
    __asm {
    mov eax, 0x2008
    call sub_100f883a
    push ebx
    push esi
    push edi
    lea eax, [esp + 0x10]
    push eax
    push 0
    mov esi, ecx
    call sub_1002933b
    push 0
    push 3
    push 1
    push 0x100
    push 0x20
    mov eax, 0x32
    mov ecx, esi
    call sub_1000ee64
    mov eax, dword ptr [esi]
    add esp, 0x1c
    cmp eax, 4
    jne L1
    lea ecx, [esp + 0x10]
    push ecx
    push 0
    push 0x32
    push esi
    call sub_1000ec4d
    add esp, 0x10
    pop edi
    pop esi
    pop ebx
    add esp, 0x2008
    ret
    lea edx, [esp + 0x10]
    push edx
    push 0x32
    xor edi, edi
    xor ebx, ebx
    call sub_1000ea8a
    add esp, 8
    pop edi
    pop esi
    pop ebx
    add esp, 0x2008
    ret
    }
}
