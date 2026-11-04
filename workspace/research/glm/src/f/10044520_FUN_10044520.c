extern void sub_10044082(void);

__declspec(naked) void FUN_10044520(void)
{
    __asm {
    sub esp, 0x24
    push ebx
    mov ebx, dword ptr [esp + 0x2c]
    mov ecx, dword ptr [ebx + 0x164]
    mov eax, dword ptr [ebx + 0x20]
    mov edx, dword ptr [eax]
    mov eax, dword ptr [eax + 4]
    push esi
    push edi
    lea edi, [ecx + 0xc]
    mov dword ptr [esp + 0xc], edx
    mov dword ptr [esp + 0x10], eax
    mov ecx, edi
    mov edx, dword ptr [ecx]
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [esp + 0x14], edx
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [esp + 0x18], eax
    mov eax, dword ptr [ecx + 0xc]
    mov dword ptr [esp + 0x1c], edx
    mov edx, dword ptr [ecx + 0x10]
    mov dword ptr [esp + 0x20], eax
    mov eax, dword ptr [ecx + 0x14]
    mov dword ptr [esp + 0x28], eax
    push 0x7f
    mov eax, 7
    lea esi, [esp + 0x10]
    mov dword ptr [esp + 0x28], edx
    mov dword ptr [esp + 0x30], ebx
    call sub_10044082
    add esp, 4
    test al, al
    je L2
    xor ecx, ecx
    xor eax, eax
    jmp L2
    mov ecx, dword ptr [ebx]
    mov dword ptr [ecx + 0x14], 0x18
    mov edx, dword ptr [ebx]
    push ebx
    call dword ptr [edx]
    mov eax, dword ptr [esp + 0x1c]
    mov ecx, dword ptr [esp + 0x18]
    add esp, 4
    mov edx, dword ptr [ebx + 0x20]
    mov esi, dword ptr [esp + 0xc]
    mov dword ptr [edx], esi
    mov edx, dword ptr [ebx + 0x20]
    mov esi, dword ptr [esp + 0x10]
    mov dword ptr [edx + 4], esi
    mov edx, dword ptr [esp + 0x24]
    mov dword ptr [edi], ecx
    mov ecx, dword ptr [esp + 0x20]
    mov dword ptr [edi + 4], eax
    mov eax, dword ptr [esp + 0x1c]
    mov dword ptr [edi + 8], eax
    mov eax, dword ptr [esp + 0x28]
    mov dword ptr [edi + 0xc], ecx
    mov dword ptr [edi + 0x10], edx
    mov dword ptr [edi + 0x14], eax
    pop edi
    pop esi
    pop ebx
    add esp, 0x24
    ret
    }
}
