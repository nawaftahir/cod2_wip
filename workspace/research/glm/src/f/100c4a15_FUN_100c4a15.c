
__declspec(naked) void FUN_100c4a15(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    mov edx, dword ptr [esi + 0x14]
    xor eax, eax
    cmp edx, -1
    je L5
    push edi
    mov edi, dword ptr [ecx + 0x14]
    mov edx, dword ptr [edi + edx*4]
    mov edi, dword ptr [edx + 4]
    mov ecx, dword ptr [ecx + 0x10]
    mov ecx, dword ptr [ecx + edi*4]
    test byte ptr [ecx + 4], 8
    pop edi
    je L5
    mov eax, dword ptr [edx + 0xc]
    mov edx, dword ptr [edx + 0x10]
    and eax, 0x7ff
    or eax, 0xb0001000
    sub edx, 0
    je L5
    dec edx
    je L5
    dec edx
    je L5
    dec edx
    jne L5
    or eax, 0xff0000
    jmp L5
    or eax, 0xaa0000
    jmp L5
    or eax, 0x550000
    cmp dword ptr [esi + 0x18], 0
    jne L5
    or eax, 0xd000000
    mov ecx, dword ptr [ebp + 0xc]
    test ecx, ecx
    pop esi
    je L5
    mov dword ptr [ecx], eax
    xor eax, eax
    pop ebp
    ret 8
    }
}
