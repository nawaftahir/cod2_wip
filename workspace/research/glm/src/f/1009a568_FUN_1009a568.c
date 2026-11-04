extern void sub_10099b8f(void);

__declspec(naked) void FUN_1009a568(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    test esi, esi
    je L4
    cmp dword ptr [esi + 4], 0xd
    jne L4
    mov eax, dword ptr [esi + 0x10]
    test eax, eax
    jne L4
    and dword ptr [esi + 0x14], eax
    and dword ptr [esi + 0x18], eax
    jmp L4
    cmp dword ptr [eax + 4], 9
    jne L4
    mov ecx, dword ptr [eax + 0x18]
    mov dword ptr [esi + 0x14], ecx
    mov eax, dword ptr [eax + 0x1c]
    jmp L4
    push eax
    mov dword ptr [esi + 0x14], 1
    call sub_10099b8f
    mov dword ptr [esi + 0x18], eax
    pop esi
    pop ebp
    ret 4
    }
}
