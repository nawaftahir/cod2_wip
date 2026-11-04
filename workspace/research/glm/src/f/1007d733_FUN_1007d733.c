
__declspec(naked) void FUN_1007d733(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 0x10]
    mov cx, word ptr [esi + 0xa]
    test cx, cx
    push edi
    je L9
    mov edi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi + 0xc]
    add eax, dword ptr [edi + 8]
    and dword ptr [ebp + 0x10], 0
    test cx, cx
    jbe L9
    push ebx
    lea ebx, [eax + 4]
    mov ecx, dword ptr [ebx]
    test ecx, ecx
    je L9
    mov eax, dword ptr [edi + 8]
    push dword ptr [ebp + 0x1c]
    add eax, ecx
    movzx ecx, word ptr [eax + 8]
    imul ecx, dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0x18]
    push ecx
    push eax
    push dword ptr [ebp + 0xc]
    push edi
    call L9
    movzx eax, word ptr [esi + 0xa]
    inc dword ptr [ebp + 0x10]
    add ebx, 8
    cmp dword ptr [ebp + 0x10], eax
    jb L9
    pop ebx
    jmp L9
    mov eax, dword ptr [ebp + 0xc]
    cmp word ptr [eax + 4], 0
    jne L9
    movzx ecx, word ptr [esi + 6]
    movzx eax, word ptr [esi + 4]
    jmp L9
    cmp word ptr [esi], 3
    je L9
    movzx ecx, word ptr [esi + 6]
    movzx eax, word ptr [esi + 4]
    jmp L9
    movzx ecx, word ptr [esi + 4]
    movzx eax, word ptr [esi + 6]
    add ecx, 3
    sar ecx, 2
    imul ecx, eax
    imul ecx, dword ptr [ebp + 0x14]
    mov eax, dword ptr [ebp + 0x18]
    add dword ptr [eax], ecx
    movzx eax, word ptr [esi + 4]
    movzx ecx, word ptr [esi + 6]
    imul ecx, eax
    imul ecx, dword ptr [ebp + 0x14]
    mov eax, dword ptr [ebp + 0x1c]
    add dword ptr [eax], ecx
    pop edi
    pop esi
    pop ebp
    ret 0x18
    }
}
