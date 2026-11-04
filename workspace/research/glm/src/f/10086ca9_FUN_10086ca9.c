
__declspec(naked) void FUN_10086ca9(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 0x14], 0
    push esi
    je L6
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [edx + 8]
    mov edx, dword ptr [edx + 0xc]
    push edi
    mov edi, dword ptr [ebp + 0x10]
    mov esi, dword ptr [eax + edi*4]
    add edx, edi
    cmp dword ptr [ebp + 0xc], 0
    mov eax, dword ptr [eax + edx*4]
    pop edi
    je L6
    cmp esi, eax
    jbe L6
    mov eax, esi
    jmp L6
    cmp esi, eax
    ja L6
    jmp L6
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [eax + 0xc]
    imul edx, dword ptr [ebp + 0xc]
    add edx, dword ptr [ebp + 0x10]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 0x14]
    pop esi
    jmp L6
    mov eax, edx
    mov edx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edx + 0x30]
    cmp eax, edx
    jne L6
    pop ebp
    ret 0x10
    }
}
