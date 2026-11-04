
__declspec(naked) void FUN_1004ebd0(void)
{
    __asm {
    cmp ecx, 0xc
    jb L1
    cmp byte ptr [eax], 0x41
    jne L1
    cmp byte ptr [eax + 1], 0x64
    jne L1
    cmp byte ptr [eax + 2], 0x6f
    jne L1
    cmp byte ptr [eax + 3], 0x62
    jne L1
    cmp byte ptr [eax + 4], 0x65
    jne L1
    movzx edx, byte ptr [eax + 7]
    movzx ecx, byte ptr [eax + 8]
    push ebx
    movzx ebx, byte ptr [eax + 0xb]
    push ebp
    movzx ebp, byte ptr [eax + 5]
    push edi
    movzx edi, byte ptr [eax + 9]
    shl edx, 8
    add edx, ecx
    movzx ecx, byte ptr [eax + 0xa]
    movzx eax, byte ptr [eax + 6]
    shl edi, 8
    add edi, ecx
    mov ecx, dword ptr [esi]
    add ecx, 0x18
    shl ebp, 8
    add ebp, eax
    mov dword ptr [ecx], ebp
    mov dword ptr [ecx + 4], edx
    mov dword ptr [ecx + 8], edi
    mov dword ptr [ecx + 0xc], ebx
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 0x14], 0x4c
    mov edx, dword ptr [esi]
    push 1
    push esi
    call dword ptr [edx + 4]
    add esp, 8
    pop edi
    pop ebp
    mov byte ptr [esi + 0x111], bl
    mov byte ptr [esi + 0x110], 1
    pop ebx
    ret
    mov eax, dword ptr [esi]
    mov edx, dword ptr [esp + 4]
    mov dword ptr [eax + 0x14], 0x4e
    mov eax, dword ptr [esi]
    add ecx, edx
    mov dword ptr [eax + 0x18], ecx
    mov ecx, dword ptr [esi]
    push 1
    push esi
    call dword ptr [ecx + 4]
    add esp, 8
    ret
    }
}
