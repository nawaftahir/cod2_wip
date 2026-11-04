extern void sub_10017a90(void);
extern void sub_10017c50(void);
extern void sub_10017c90(void);
extern void sub_10017f80(void);

__declspec(naked) void FUN_100179a0(void)
{
    __asm {
    sub esp, 8
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x18]
    push esi
    push edi
    mov edi, dword ptr [esp + 0x1c]
    mov eax, ebp
    sub eax, edi
    sar eax, 2
    cmp eax, 0x20
    jle L0
    mov esi, dword ptr [esp + 0x24]
    nop
    test esi, esi
    jle L1
    mov eax, dword ptr [esp + 0x28]
    push eax
    push ebp
    lea ecx, [esp + 0x18]
    push edi
    push ecx
    call sub_10017a90
    mov ebx, dword ptr [esp + 0x24]
    mov eax, esi
    cdq
    sub eax, edx
    sar eax, 1
    mov esi, eax
    cdq
    sub eax, edx
    sar eax, 1
    add esi, eax
    mov eax, dword ptr [esp + 0x20]
    mov edx, ebp
    mov ecx, eax
    sub edx, ebx
    sub ecx, edi
    and edx, 0xfffffffc
    and ecx, 0xfffffffc
    add esp, 0x10
    cmp ecx, edx
    jge L2
    mov edx, dword ptr [esp + 0x28]
    push edx
    push esi
    push eax
    push edi
    call L3
    mov edi, ebx
    jmp L4
    mov eax, dword ptr [esp + 0x28]
    push eax
    push esi
    push ebp
    push ebx
    call L3
    mov ebp, dword ptr [esp + 0x20]
    mov eax, ebp
    sub eax, edi
    sar eax, 2
    add esp, 0x10
    cmp eax, 0x20
    jg L5
    cmp eax, 1
    jle L6
    mov eax, dword ptr [esp + 0x28]
    push eax
    push ebp
    push edi
    call sub_10017c90
    add esp, 0xc
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
    cmp eax, 0x20
    jle L0
    mov ecx, ebp
    sub ecx, edi
    and ecx, 0xfffffffc
    cmp ecx, 4
    jle L7
    mov edx, dword ptr [esp + 0x28]
    push edx
    mov eax, ebp
    call sub_10017f80
    add esp, 4
    mov ebx, dword ptr [esp + 0x28]
    mov eax, ebp
    call sub_10017c50
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
    }
}
