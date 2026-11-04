extern void sub_10013a40(void);
extern void sub_10013e50(void);
extern void sub_10013e90(void);
extern void sub_10014040(void);

__declspec(naked) void FUN_10013950(void)
{
    __asm {
    sub esp, 8
    push ebx
    mov ebx, dword ptr [esp + 0x10]
    push ebp
    push esi
    push edi
    mov edi, dword ptr [esp + 0x20]
    mov eax, edi
    sub eax, ebx
    sar eax, 4
    cmp eax, 0x20
    jle L0
    mov esi, dword ptr [esp + 0x24]
    nop
    test esi, esi
    jle L1
    mov eax, dword ptr [esp + 0x28]
    push eax
    push edi
    lea ecx, [esp + 0x18]
    push ebx
    push ecx
    call sub_10013a40
    mov ebp, dword ptr [esp + 0x24]
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
    mov edx, edi
    mov ecx, eax
    sub edx, ebp
    sub ecx, ebx
    and edx, 0xfffffff0
    and ecx, 0xfffffff0
    add esp, 0x10
    cmp ecx, edx
    jge L2
    mov edx, dword ptr [esp + 0x28]
    push edx
    push esi
    push eax
    push ebx
    call L3
    mov ebx, ebp
    jmp L4
    mov eax, dword ptr [esp + 0x28]
    push eax
    push esi
    push edi
    push ebp
    call L3
    mov edi, dword ptr [esp + 0x20]
    mov eax, edi
    sub eax, ebx
    sar eax, 4
    add esp, 0x10
    cmp eax, 0x20
    jg L5
    cmp eax, 1
    jle L6
    mov ecx, dword ptr [esp + 0x28]
    push ecx
    push edi
    push ebx
    call sub_10013e90
    add esp, 0xc
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
    cmp eax, 0x20
    jle L0
    mov ecx, edi
    sub ecx, ebx
    and ecx, 0xfffffff0
    cmp ecx, 0x10
    jle L7
    mov edx, dword ptr [esp + 0x28]
    push edx
    mov eax, edi
    mov ecx, ebx
    call sub_10014040
    add esp, 4
    mov eax, dword ptr [esp + 0x28]
    push eax
    mov eax, edi
    call sub_10013e50
    add esp, 4
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
    }
}
