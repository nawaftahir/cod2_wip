
__declspec(naked) void FUN_10041be0(void)
{
    __asm {
    push ecx
    push edi
    mov edi, eax
    cmp dword ptr [esi + 0x14], 0x65
    je L5
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 0x14], 0x14
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 0x14]
    mov dword ptr [ecx + 0x18], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
    mov ecx, dword ptr [esi + 0xd8]
    cmp ecx, dword ptr [esi + 0x28]
    jb L5
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 0x14], 0x7b
    mov eax, dword ptr [esi]
    push -1
    push esi
    call dword ptr [eax + 4]
    add esp, 8
    mov eax, dword ptr [esi + 8]
    test eax, eax
    je L5
    mov ecx, dword ptr [esi + 0xd8]
    mov dword ptr [eax + 4], ecx
    mov edx, dword ptr [esi + 8]
    mov eax, dword ptr [esi + 0x28]
    mov dword ptr [edx + 8], eax
    mov ecx, dword ptr [esi + 8]
    push esi
    call dword ptr [ecx]
    add esp, 4
    mov eax, dword ptr [esi + 0x144]
    mov cl, byte ptr [eax + 0xc]
    test cl, cl
    je L5
    push esi
    call dword ptr [eax + 4]
    add esp, 4
    mov eax, dword ptr [esi + 0x28]
    sub eax, dword ptr [esi + 0xd8]
    cmp edi, eax
    jbe L5
    mov edi, eax
    mov ecx, dword ptr [esp + 0xc]
    mov edx, dword ptr [esi + 0x148]
    push edi
    lea eax, [esp + 8]
    push eax
    push ecx
    push esi
    mov dword ptr [esp + 0x14], 0
    call dword ptr [edx + 4]
    mov ecx, dword ptr [esi + 0xd8]
    mov eax, dword ptr [esp + 0x14]
    add esp, 0x10
    add ecx, eax
    mov dword ptr [esi + 0xd8], ecx
    pop edi
    pop ecx
    ret
    }
}
