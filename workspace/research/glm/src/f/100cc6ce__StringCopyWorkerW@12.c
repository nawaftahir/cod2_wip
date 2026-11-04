
__declspec(naked) void _StringCopyWorkerW@12(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    xor eax, eax
    cmp dword ptr [ebp + 0xc], eax
    jne L5
    mov eax, 0x80070057
    jmp L5
    mov edx, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [ebp + 0x10]
    mov cx, word ptr [esi]
    test cx, cx
    je L5
    mov word ptr [edx], cx
    inc edx
    inc edx
    inc esi
    inc esi
    dec dword ptr [ebp + 0xc]
    jne L5
    cmp dword ptr [ebp + 0xc], 0
    pop esi
    jne L5
    dec edx
    dec edx
    mov eax, 0x8007007a
    and word ptr [edx], 0
    pop ebp
    ret 0xc
    }
}
