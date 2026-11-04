extern void sub_10028260(void);
extern void sub_10028490(void);
extern void sub_100284e0(void);
extern void sub_10028670(void);

__declspec(naked) void FUN_10028170(void)
{
    __asm {
    sub esp, 8
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x14]
    push esi
    push edi
    mov edi, dword ptr [esp + 0x20]
    mov eax, edi
    sub eax, ebp
    sar eax, 3
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
    push ebp
    push ecx
    call sub_10028260
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
    mov edx, edi
    mov ecx, eax
    sub edx, ebx
    sub ecx, ebp
    and edx, 0xfffffff8
    and ecx, 0xfffffff8
    add esp, 0x10
    cmp ecx, edx
    jge L2
    mov edx, dword ptr [esp + 0x28]
    push edx
    push esi
    push eax
    push ebp
    call L3
    mov ebp, ebx
    jmp L4
    mov eax, dword ptr [esp + 0x28]
    push eax
    push esi
    push edi
    push ebx
    call L3
    mov edi, dword ptr [esp + 0x20]
    mov eax, edi
    sub eax, ebp
    sar eax, 3
    add esp, 0x10
    cmp eax, 0x20
    jg L5
    cmp eax, 1
    jle L6
    mov eax, dword ptr [esp + 0x28]
    push eax
    push edi
    push ebp
    call sub_100284e0
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
    sub ecx, ebp
    and ecx, 0xfffffff8
    cmp ecx, 8
    jle L7
    mov edx, dword ptr [esp + 0x28]
    push edx
    mov eax, edi
    mov ecx, ebp
    call sub_10028670
    add esp, 4
    mov ebx, dword ptr [esp + 0x28]
    mov ecx, edi
    mov eax, ebp
    call sub_10028490
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
    }
}
