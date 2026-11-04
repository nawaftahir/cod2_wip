extern void (__stdcall *fp_101d49f8)(void);
extern void (__stdcall *fp_101d4b00)(void);
extern void sub_1000eaa7(void);
extern void sub_1000ec76(void);
extern void sub_1000ee92(void);
extern void sub_10014971(void);

__declspec(naked) void FUN_1000fc30(void)
{
    __asm {
    sub esp, 0x14
    push ebp
    push esi
    mov esi, eax
    lea eax, [esp + 0x14]
    push eax
    lea ecx, [esp + 0x10]
    push ecx
    lea edx, [esp + 0x18]
    push edx
    lea eax, [esp + 0x14]
    push eax
    mov eax, dword ptr [esp + 0x30]
    lea ecx, [esp + 0x28]
    push ecx
    mov dword ptr [esp + 0x1c], 0
    call sub_10014971
    mov ebp, dword ptr [esp + 0x1c]
    add esp, 0x14
    test ebp, ebp
    jne L3
    pop esi
    xor al, al
    pop ebp
    add esp, 0x14
    ret
    mov edx, dword ptr [esp + 0xc]
    mov eax, dword ptr [esp + 0x10]
    push edi
    mov edi, dword ptr [esp + 0x18]
    push 0
    push 3
    push 1
    push edx
    push eax
    mov eax, edi
    mov ecx, esi
    call sub_1000ee92
    mov eax, dword ptr [esi]
    add esp, 0x14
    cmp eax, 4
    jne L3
    push ebp
    push 0
    push edi
    push esi
    call sub_1000ec76
    add esp, 0x10
    jmp L3
    push ebx
    push ebp
    push edi
    xor edi, edi
    xor ebx, ebx
    call sub_1000eaa7
    add esp, 8
    pop ebx
    push ebp
    call fp_101d49f8
    mov ecx, dword ptr [esp + 0x20]
    push ecx
    call fp_101d4b00
    add esp, 8
    pop edi
    pop esi
    mov al, 1
    pop ebp
    add esp, 0x14
    ret
    }
}
