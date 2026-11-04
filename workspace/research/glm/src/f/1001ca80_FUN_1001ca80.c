extern void sub_1001cbc0(void);
extern void sub_1001cf30(void);
extern void sub_1001cfd0(void);
extern void sub_1001d170(void);

__declspec(naked) void FUN_1001ca80(void)
{
    __asm {
    sub esp, 8
    push ebx
    mov ebx, dword ptr [esp + 0x10]
    push ebp
    push esi
    push edi
    mov edi, dword ptr [esp + 0x20]
    mov ecx, edi
    sub ecx, ebx
    mov eax, 0x2aaaaaab
    imul ecx
    sar edx, 1
    mov eax, edx
    shr eax, 0x1f
    add eax, edx
    cmp eax, 0x20
    jle L0
    mov esi, dword ptr [esp + 0x24]
    test esi, esi
    jle L1
    mov eax, dword ptr [esp + 0x28]
    push eax
    push edi
    lea ecx, [esp + 0x18]
    push ebx
    push ecx
    call sub_1001cbc0
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
    mov ecx, edi
    sub ecx, ebp
    mov eax, 0x2aaaaaab
    imul ecx
    mov ecx, dword ptr [esp + 0x20]
    sar edx, 1
    mov eax, edx
    shr eax, 0x1f
    add eax, edx
    mov dword ptr [esp + 0x30], eax
    sub ecx, ebx
    mov eax, 0x2aaaaaab
    imul ecx
    mov ecx, dword ptr [esp + 0x30]
    sar edx, 1
    mov eax, edx
    shr eax, 0x1f
    add eax, edx
    add esp, 0x10
    cmp eax, ecx
    jge L2
    mov ecx, dword ptr [esp + 0x28]
    mov edx, dword ptr [esp + 0x10]
    push ecx
    push esi
    push edx
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
    mov ecx, edi
    sub ecx, ebx
    mov eax, 0x2aaaaaab
    imul ecx
    sar edx, 1
    mov eax, edx
    shr eax, 0x1f
    add eax, edx
    add esp, 0x10
    cmp eax, 0x20
    jg L5
    cmp eax, 1
    jle L6
    mov ecx, dword ptr [esp + 0x28]
    push ecx
    push edi
    push ebx
    call sub_1001cfd0
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
    mov eax, 0x2aaaaaab
    imul ecx
    sar edx, 1
    mov ecx, edx
    shr ecx, 0x1f
    add ecx, edx
    cmp ecx, 1
    jle L7
    mov edx, dword ptr [esp + 0x28]
    push edx
    mov eax, edi
    mov ecx, ebx
    call sub_1001d170
    add esp, 4
    mov eax, dword ptr [esp + 0x28]
    push eax
    mov ecx, edi
    mov eax, ebx
    call sub_1001cf30
    add esp, 4
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
    }
}
