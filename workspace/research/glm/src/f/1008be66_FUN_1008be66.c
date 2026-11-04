
__declspec(naked) void FUN_1008be66(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    push edi
    mov edi, ecx
    je L7
    mov ecx, dword ptr [ebp + 8]
    push esi
    cmp ecx, -1
    je L7
    mov edx, dword ptr [edi + 0x14]
    mov edx, dword ptr [edx + ecx*4]
    mov edx, dword ptr [edx + 0x38]
    cmp edx, -1
    je L7
    mov ecx, edx
    mov edx, dword ptr [edi + 0x14]
    mov esi, dword ptr [edx + ecx*4]
    cmp dword ptr [esi + 0x54], eax
    jae L7
    mov dword ptr [esi + 0x54], eax
    mov eax, dword ptr [esi + 8]
    cmp eax, -1
    je L7
    push dword ptr [esi + 0x54]
    mov ecx, edi
    push eax
    call L7
    mov ecx, dword ptr [esi + 0x14]
    cmp ecx, -1
    je L7
    mov eax, dword ptr [esi + 0x54]
    test eax, eax
    jne L7
    pop esi
    pop edi
    pop ebp
    ret 8
    }
}
