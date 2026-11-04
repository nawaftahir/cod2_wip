
__declspec(naked) void FUN_1002ce40(void)
{
    __asm {
    mov ax, word ptr [esp + 0xc]
    test ax, ax
    push esi
    push edi
    je L2
    mov esi, dword ptr [esp + 0xc]
    mov ecx, dword ptr [esi + 8]
    movsx esi, word ptr [esi + 4]
    movzx eax, ax
    mov edx, eax
    shl edx, 0x10
    or edx, eax
    mov eax, dword ptr [esp + 0x10]
    sar esi, 1
    mov edi, dword ptr [ecx]
    add edi, edx
    mov dword ptr [eax], edi
    mov edi, dword ptr [ecx + 4]
    add ecx, 4
    add eax, 4
    add edi, edx
    mov dword ptr [eax], edi
    mov edi, dword ptr [ecx + 4]
    add ecx, 4
    add eax, 4
    add edi, edx
    mov dword ptr [eax], edi
    add eax, 4
    add ecx, 4
    dec esi
    jne L2
    pop edi
    pop esi
    ret
    mov edx, dword ptr [esp + 0xc]
    movsx eax, word ptr [edx + 4]
    mov esi, dword ptr [edx + 8]
    mov edi, dword ptr [esp + 0x10]
    lea ecx, [eax + eax*2]
    shl ecx, 1
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    pop edi
    pop esi
    ret
    }
}
