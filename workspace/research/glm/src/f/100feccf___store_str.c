
__declspec(naked) void __store_str(void)
{
    __asm {
    cmp dword ptr [eax], 0
    push esi
    mov esi, edx
    je L3
    push edi
    mov dl, byte ptr [esi]
    test dl, dl
    je L3
    mov edi, dword ptr [ecx]
    mov byte ptr [edi], dl
    inc dword ptr [ecx]
    inc esi
    dec dword ptr [eax]
    cmp dword ptr [eax], 0
    jne L3
    pop edi
    pop esi
    ret
    }
}
