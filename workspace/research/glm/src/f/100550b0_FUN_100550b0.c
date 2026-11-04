extern void sub_10054d72(void);

__declspec(naked) void FUN_100550b0(void)
{
    __asm {
    push ebx
    mov ebx, dword ptr [esp + 0xc]
    cmp ebx, 1
    push esi
    mov esi, dword ptr [esp + 0xc]
    push edi
    mov edi, dword ptr [esi + 4]
    je L1
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 0x14], 0xe
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 0x18], ebx
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
    push 0x78
    push ebx
    push esi
    call sub_10054d72
    mov ecx, dword ptr [esp + 0x2c]
    mov edx, dword ptr [esp + 0x28]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [esp + 0x30]
    mov dword ptr [eax + 8], edx
    mov dl, byte ptr [esp + 0x24]
    mov dword ptr [eax], 0
    mov dword ptr [eax + 0xc], ecx
    mov byte ptr [eax + 0x20], dl
    mov byte ptr [eax + 0x22], 0
    mov ecx, dword ptr [edi + 0x44]
    add esp, 0xc
    mov dword ptr [eax + 0x24], ecx
    mov dword ptr [edi + 0x44], eax
    pop edi
    pop esi
    pop ebx
    ret
    }
}
